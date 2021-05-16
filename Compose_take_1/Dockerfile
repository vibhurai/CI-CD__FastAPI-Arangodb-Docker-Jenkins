# <<<<<<< HEAD
# I suggest you open the dockerfile in VSCode or some coding editor, it wont be that readable on notepad.
# Okay, so the file im about to send is a bit difficult to understnad but understandable nevertheless. I have been working and trying different things on this file and since i needed it all to be in a place, i've commented most of the the things but dont worry, the comments are also done in a manner...so you'd understand. Here it goes....

# I have implemented two ways of building the image....the first way is the venv thing and the other was npm. So the "%%%%" marks the beginning of one way of implementation which has been mentioned clearly (the first one says "VENV as given in the documentation", meaning ive tried implementing the way as it is explained in the site i have tagged in this message). the "[][][][][]" tag marks the end of that implementation way. Then i go on to implement using npm as u suggested but here, installation was something that i was facing issues with due to encoding

# To enable one methodology,uncomment the code in one part....simply select all code in that part and uncomment once.

# # %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# # VENV as given in the documentation
# # %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FROM python:3.9.0-alpine AS compile-image           
# FROM python AS compile-image                                                | THREE OPTIONS TO FOR THE BASE IMAGE
# FROM ubuntu AS compile-image                                                | THREE OPTIONS TO FOR THE BASE IMAGE

RUN python -m venv /opt/env
ENV PATH="/opt/env/bin:$PATH"

# # # CMD ["source","./opt/vevn/bin/activate"] => (an alternate way to implement the same run command as in the above line)
# # # ADD ./Assignment_2 /Assignment_2

COPY requirements.txt .
RUN pip install -r requirements.txt 
# # RUN pip list
# CMD ["pip", "list"]
# CMD ["echo","yo"]

FROM python:3.9.0-alpine
COPY --from=compile-image /opt/env /opt/env
ENV PATH="/opt/env/bin:$PATH"
# RUN pip install python3.9
# RUN echo ${PATH}
# CMD ["pip", "list"]

COPY ./Assignment_2 /Assignment_2

EXPOSE 8000
WORKDIR /Assignment_2
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
# CMD [ "echo", "yo" ]

# # ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
# # WORKDIR /opt/env/lib/python3.8/site-packages =========================IGNORE THIS LINE=========================
# # ---------------------------------------------------------------------------------------------------------------------------------------------------------------------


# # [][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]



# # %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# # Trying to use npm but issue with encoding + npm install not working since dependencies are python based
# # %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# FROM python:3.9.0-alpine
# WORKDIR /usr/src/app
# COPY requirements.txt  ./
# COPY ./Assignment_2 /Assignment_2
# # RUN ls
# RUN pip install -r requirements.txt
# WORKDIR /Assignment_2
# RUN ls
# #use "-i <corporate_repo_link>" in above line if needed in your org
# EXPOSE 8000
# CMD ["uvicorn", "main:app", "--reload"]
# # , "127.0.0.1", "--port", "8000"]
# # [][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][][]

