// This is the main server file that will run the backend code

// Environment variables for db connection
require('dotenv').config();
const dbUser = process.env.DB_USER;
const dbPassword = process.env.DB_PASSWORD;

// EXPRESS 
const express = require('express');
const app = express();

// allow cross origin requests
const cors = require('cors');
const corsOptions = {
  origin: 'http://localhost:9000/',
  credentials: true,
  optionSuccessStatus: 200
}
app.options('*', cors());
app.use(cors(corsOptions));
app.use(function (req, res, next) {
  res.header('Access-Control-Allow-Origin', "http://localhost:9000");
  res.header('Access-Control-Allow-Headers', true);
  res.header('Access-Control-Allow-Credentials', true);
  res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
  next();
});

// connect to DB config
const oracledb = require('oracledb');
let connectionConfig = {
  user: dbUser,
  password: dbPassword,
  connectString: "oracle.cise.ufl.edu:1521/orcl"  // Typically in 'hostname:port/serviceName' format
};

// Connection to Oracle DB
async function run(name_submitted) {
  let connection;
  let result;
  try {
    connection = await oracledb.getConnection(connectionConfig);
    console.log('Successfully connected to Oracle!');
    result = await connection.execute("SELECT name, population FROM CITY WHERE name=:name", {name: name_submitted});
    console.log(result.rows);
  } catch (err) {
    console.error('Error connecting to the database', err);
  } finally {
    if (connection) {
      try {
        await connection.close();
      } catch (err) {
        console.error('Error closing the database connection', err);
      }
    }
  }
  return result.rows;
};
const fs = require('fs');
async function runQuery2(start, end, tID) {
  let connection;
  let result;
  try {
    connection = await oracledb.getConnection(connectionConfig);
    console.log('Successfully connected to Oracle!');
    const sql = fs.readFileSync('../Queries/query2.sql').toString();
    result = await connection.execute(sql, {startYear: start, endYear: end, team: tID});
    console.log(result.rows);
} catch (err) {
    console.error('Error connecting to the database', err);
  } finally {
    if (connection) {
      try {
        await connection.close();
      } catch (err) {
        console.error('Error closing the database connection', err);
      }
    }
  }
  return result.rows;
};5

async function getTeamsInRange(start, end) {
  let connection;
  let result;
  try {
    connection = await oracledb.getConnection(connectionConfig);
    console.log('Successfully connected to Oracle!');
    const sql = fs.readFileSync('../Queries/getTeamsInRange.sql').toString();
    result = await connection.execute(sql, {startYear: start, endYear: end});
    console.log(result.rows);
} catch (err) {
    console.error('Error connecting to the database', err);
  } finally {
    if (connection) {
      try {
        await connection.close();
      } catch (err) {
        console.error('Error closing the database connection', err);
      }
    }
  }
  return result.rows;
};

async function runQuery5(start, end) {
  let connection;
  let result;
  try {
    connection = await oracledb.getConnection(connectionConfig);
    console.log('Successfully connected to Oracle!');
    const sql = fs.readFileSync('../Queries/query5.sql').toString();
    result = await connection.execute(sql, {startYear: start, endYear: end});
    console.log(result.rows);
} catch (err) {
    console.error('Error connecting to the database', err);
  } finally {
    if (connection) {
      try {
        await connection.close();
      } catch (err) {
        console.error('Error closing the database connection', err);
      }
    }
  }
  return result.rows;
};


app.use(express.static("../spa/"));
const server = app.listen(4000, () => {
  console.log('server started at localhost:4000');
});

app.get('/api', async(req, res) => {
  const rows = await run(req.query.name_from_client);
  res.send(rows);
});

app.get('/q2', async(req, res) => {
  const rows = await runQuery2(req.query.startYear, req.query.endYear, req.query.team);
  res.send(rows);
});

app.get('/q5', async(req, res) => {
  const rows = await runQuery5(req.query.startYear, req.query.endYear);
  res.send(rows);
});

app.get('/q2/teams_in_range', async(req, res) => {
  const rows = await getTeamsInRange(req.query.startYear, req.query.endYear);
  res.send(rows);
});