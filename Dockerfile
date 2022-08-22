FROM python:3.6.15-alpine

WORKDIR /app

COPY requirements.txt requirements-test.txt ./

RUN pip install -r requirements.txt -r requirements-test.txt

COPY . .

ENV MONGO mongodb
ENV MONGO_PORT 27017
ENV RMQ_HOST rabbitmq
ENV RMQ_QUEUE tasks
ENV RMQ_USERNAME rabbitmq
ENV RMQ_PASSWORD password
ENV CHECK_INTERVAL 10
ENV EXCLUDE_URLS .*github.com

ENTRYPOINT ["python", "-u", "crawler/crawler.py"]
CMD ["https://vitkhab.github.io/search_engine_test_site/"]
