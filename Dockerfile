FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8 AS compile-image
# CMD ["cwd"]
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .
# WORKDIR /tmp
# RUN pip install -r requirements.txt
RUN pip install -r requirements.txt 
CMD ["dir"]
# RUN chmod +x /Assignment_2/run.sh
# WORKDIR /Assignment_2

FROM ubuntu
COPY --from=compile-image /opt/venv /opt/venv
# COPY --from=mybuildstage /tmp/requirements.txt ./tmp
COPY ./Assignment_2 /Assignment_2

# CMD ["dir"]
# WORKDIR /~
EXPOSE 8000

WORKDIR /Assignment_2
# CMD ["ls"]
CMD ["uvicorn", "main:app", "--port", "8000"]
