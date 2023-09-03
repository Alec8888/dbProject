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
- In our projec find ./server/.env and enter your user and pwd for UF oracal db
  - the .env file is not tracked by git so your credentials will not be shared
## Start App
### Server
- run server.js from server directory  
  ``` node server.js ```
- Leave the terminal window open.
### Client
- Open a new termial window that is not powershell
- Start dev server from client directory  
  ``` quasar dev ```
  - website should launch after command
### Alternative: Start both with one command
- First try it with the two terminal windows and two commands, then try this when you get tired of that.
``` npm run dev ```
## Check out the website
If you click the button on the home page, records stored in the oracle db are displayed.
## DB connection issues
- Double check you are using the UF VPN
- Make sure environment variables are set correctly
- Are both the server and client running? Two terminal windows should be open.

