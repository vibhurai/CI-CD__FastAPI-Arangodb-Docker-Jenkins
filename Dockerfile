
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8 AS mybuildstage
COPY ./Assignment_2 /Assignment_2
COPY requirements.txt /tmp
WORKDIR /tmp
# RUN pip install -r requirements.txt
RUN pip install -r requirements.txt 
# CMD ["dir"]
FROM scratch
COPy --from=mybuildstage requirements.txt


# WORKDIR /~
EXPOSE 8000

WORKDIR /Assignment_2
RUN chmod +x /Assignment_2/run.sh
CMD ["./run.sh"]

# CMD ["uvicorn", "main:app", "--port", "8000"]

