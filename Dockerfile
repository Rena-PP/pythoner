FROM python:3.8-slim

WORKDIR /app

COPY . /app
RUN pip install -r requirements.txt

COPY packages.txt /tmp/packages.txt
RUN apt-get update && \
    xargs apt-get install -y < /tmp/packages.txt && \
    rm -rf /var/lib/apt/lists/* /tmp/packages.txt

EXPOSE 5000

CMD ["python", "app.py"]
