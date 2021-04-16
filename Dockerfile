
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8

COPY ./Assignment_2 /Assignment_2

# CMD ["dir"]

COPY requirements.txt /tmp
WORKDIR /tmp
# RUN pip install -r requirements.txt
RUN pip install -r requirements.txt 
# WORKDIR /~
EXPOSE 8000

WORKDIR /Assignment_2
RUN chmod +x /Assignment_2/run
<<<<<<< HEAD
CMD ["/run"]
=======
CMD ["/run"]
# CMD ["uvicorn", "main:app", "--port", "8000"]
>>>>>>> 3b7e0668f8ecbda31322e0502c28812b2e9e1e0b
