FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8

COPY ./Assignment_2 /Assignment_2

COPY requirements.txt /tmp
WORKDIR /tmp
RUN pip install -r requirements.txt


EXPOSE 8084

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8084"]
