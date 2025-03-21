FROM python:3.12

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt

RUN pip install -r /app/requirements.txt

COPY ./aspects_dbt_extension /app/aspects-dbt

WORKDIR /app/aspects-dbt

RUN pip install -r requirements.txt

RUN dbt deps

WORKDIR /app
