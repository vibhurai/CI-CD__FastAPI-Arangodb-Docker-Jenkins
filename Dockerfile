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
CMD ["/run"]
# CMD ["uvicorn", "main:app", "--port", "8000"]
