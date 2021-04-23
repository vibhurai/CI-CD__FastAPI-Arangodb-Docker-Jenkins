FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8 AS compile-image
# CMD ["cwd"]
RUN python -m venv /opt/venv
# ENV PATH="/opt/venv/bin"
CMD ["source","vevn/Scripts/activate"]

COPY requirements.txt .
# WORKDIR /tmp
# RUN pip install -r requirements.txt

RUN pip install -r requirements.txt
CMD ["dir"]
# RUN pip install --user .
# RUN chmod +x /Assignment_2/run.sh
# WORKDIR /Assignment_2


# FROM ubuntu
# COPY --from=compile-image /root/.local /root/.local
# # COPY --from=mybuildstage /tmp/requirements.txt ./tmp
# COPY ./Assignment_2 /Assignment_2

# # CMD ["dir"]
# # WORKDIR /~
# EXPOSE 8000

# WORKDIR /Assignment_2
# ENV PATH="/opt/venv/bin"
# CMD ["source","vevn/Scripts/activate"]
# # CMD ["ls"]
# CMD ["uvicorn", "main:app", "--port", "8000"]
