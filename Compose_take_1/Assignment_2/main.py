from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates
import requests
from arango import ArangoClient, AQLQueryKillError
from pydantic import BaseModel 
import json

# connect to the arangodb database
client = ArangoClient("http://db:8529")
sys_db = client.db('_system', username='root', password='pass')

if not sys_db.has_database('movies_database'):
    sys_db.create_database('movies_database')

db = client.db('movies_database', username='root', password='pass')

if db.has_collection('actors'):
    actors = db.collection('actors')
else:
    actors = db.create_collection('actors')

actors = db.collection('actors')

app = FastAPI()


templates = Jinja2Templates(directory="templates")

class Actor(BaseModel):
    _key: str
    name: str

class Actor_k(BaseModel):
    key: str



@app.get("/", response_class=HTMLResponse)
async def read_item(request: Request):
    return templates.TemplateResponse("main_page.html" ,{"request": request})


# Insertion
@app.post("/actor")
async def insert_item(actor: Actor):
    
    a0 = {'name': actor.name}
    actors.insert(a0)
    return {
        "code": "success",
        "message": "actor added to the database"
    }


# Updation
@app.patch("/actor/{actor_key}")
async def update_item(actor: Actor, actor_key: str):

    print(actor)
    actors.update_match({'_key': actor_key},{'name': actor.name} )
    return {
        "code": "success",
        "message": "updation successfull"
    } 
        

# Deletion
@app.delete("/actor")
async def delete_item(actor: Actor_k):
    a0 = 'actors/'+actor.key
    
    actors.delete(a0)
    return {
        "code": "success",
        "message": "deletion successfull"
    }

# Retrieval
@app.get("/actor")#, response_class=HTMLResponse)
async def read_db( request: Request):
    lt=[]
    for actor in actors:
        lt.append((db.document(actor['_id'])))
    jsonStr = json.dumps(lt)
    # return templates.TemplateResponse("data.html" ,{"request": request, "list": lt})
    return jsonStr

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=8800)
