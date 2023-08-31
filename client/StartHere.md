# Instructions for building and using the app locally. 

## Server: 
- Install node.js v18.17.1 
  - https://nodejs.org/en/download/current
- install oracledb for node in the server directory
  - npm install oracledb
- install cors for node in the server directory
  - npm install cors
- install express for node in the server directory
  - npm install express
- Log into Orcal with SQL Developer. Create a table DEMOTABLE using the UI
- Edit the table and add three columns.
- Insert some data into the table.
here's what I inserted:
INSERT INTO DEMOTABLE (COLUMN1,COLUMN2,COLUMN3) 
VALUES ('demo2', 5, TO_DATE('1/2/2023', 'MM/DD/YYYY'))
- In file server.js Enter user and pwd for oracal db
- run server.js
  - node server.js

## Client:
- Install Quasar/Vue CLI
  - npm install -g @quasar/cli
  - documentation here: https://quasar.dev/start/quick-start
- Start dev server from client directory
  - quasar dev
  - documentation here: https://quasar.dev/start/quick-start
  - website should launch
