# Instructions for building and using the app locally. 

## Links:
https://quasar.dev/start/quick-start  
https://nodejs.org/en/download/current
## Pull from github 
- clone the repo to your local machine  
``` git clone https://github.com/Alec8888/dbProject ```
## Project file structure
- dbProject
  - client
  - server
## Install project dependencies
### Server
- Install node.js v18.17.1
- Install modules in server directory:  
  ``` npm install ```
    - the modules are defined in package.json
### Client
- Install Quasar/Vue CLI  
  ``` npm install -g @quasar/cli ```
## Oracle demo setup
- Log into Orcal with SQL Developer and connect to the CISE Oracle.
- Create a table DEMOTABLE using the UI
- Edit the table and add three columns.
- Insert some data into the table.
here's what I inserted in my example:
INSERT INTO DEMOTABLE (COLUMN1,COLUMN2,COLUMN3) 
VALUES ('demo2', 5, TO_DATE('1/2/2023', 'MM/DD/YYYY'))
- In our projec find ./server/server.js and enter your user and pwd for UF oracal db
## Run App
### Server
- run server.js from server directory  
  ``` node server.js ```
### Client
- Start dev server from client directory  
  ``` quasar dev ```
  - website should launch after command
  - if you are using powershell and get an error "Unknown command dev", use cmd instead (or any other terminal)


