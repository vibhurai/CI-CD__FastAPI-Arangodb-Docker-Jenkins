FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8

COPY ./Assignment_2 /Assignment_2

# CMD ["dir"]

COPY requirements.txt /tmp
WORKDIR /tmp
# RUN pip install -r requirements.txt
RUN pip install -r requirements.txt 
# WORKDIR /~
EXPOSE 8000
CMD ["uvicorn", "main:app", "--port", "8000"]
