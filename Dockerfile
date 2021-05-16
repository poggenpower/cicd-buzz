FROM alpine:3.10.1
RUN apk add --update python3 py3-pip
RUN pip3 install pipenv
COPY Pipfile* /src/
RUN cd /src && pipenv lock --keep-outdated --requirements > requirements.txt
RUN pip3 install -r /src/requirements.txt
COPY app.py /src
COPY buzz /src/buzz
CMD python3 /src/app.py
EXPOSE 5000