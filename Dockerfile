FROM node:carbon

RUN mkdir parse

ADD . /parse
WORKDIR /parse
RUN npm install

ENV APP_ID 4c343c59-b8d5-41e9-92dc-7ff7adcda8c0
ENV MASTER_KEY kkAo89mbHhywdjBbBB28pYbQ7CHdvZam
ENV DATABASE_URI mongodb://mongouser:password@172.30.43.11/sampledb
ENV SERVER_URL http://172.30.246.193:1337/parse

# Optional (default : 'parse/cloud/main.js')
# ENV CLOUD_CODE_MAIN cloudCodePath

# Optional (default : '/parse')
# ENV PARSE_MOUNT mountPath

EXPOSE 1337

# Uncomment if you want to access cloud code outside of your container
# A main.js file must be present, if not Parse will not start

VOLUME /parse/cloud               

CMD [ "npm", "start" ]
