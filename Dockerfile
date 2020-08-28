FROM python:slim

ENV APP_HOME /app
ENV PORT 8080
ENV PYTHONUNBUFFERED 1
EXPOSE $PORT
WORKDIR $APP_HOME

COPY . .

RUN pip install --upgrade pip gunicorn
RUN pip install -r requirements.txt

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 app:app
