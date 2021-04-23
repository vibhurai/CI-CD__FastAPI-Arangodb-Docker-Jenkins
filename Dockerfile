FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8 AS mybuildstage
COPY ./Assignment_2 /Assignment_2
CMD ["dir"]
# COPY requirements.txt /tmp
# WORKDIR /tmp
# # RUN pip install -r requirements.txt
# RUN pip install -r requirements.txt 
# # CMD ["dir"]
# RUN chmod +x /Assignment_2/run.sh
# WORKDIR /Assignment_2
# CMD ["dir"]

# WORKDIR /~
EXPOSE 8000

# WORKDIR /Assignment_2
# CMD ["ls"]
# CMD ["uvicorn", "main:app", "--port", "8000"]
