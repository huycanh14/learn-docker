// import express, { urlencoded, json } from "express";
const express = require("express");
const cors = require("cors");
const dotenv = require("dotenv");
const { Client } = require("pg");
const bodyParser = require("body-parser");
dotenv.config();

const connection = new Client({
  user: process.env.PG_USER || "postgres",
  password: process.env.PG_PASSWORD || "postgres",
  host: process.env.PG_HOST || "localhost",
  port: process.env.PG_PORT || 5432, // default Postgres port
  database: process.env.PG_DATABASE || "database",
});

const query = (text, params) => {
  return connection.query(text, params);
};

const app = express();
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(cors());
app.listen(3000);

//CONNECT TO DATABASE POSTGRES

// console.log(process.env);
connection.connect(function (err) {
  if (err) console.log(err);
  let sql =
    "CREATE TABLE IF NOT EXISTS users (id SERIAL NOT NULL, fullname character varying(255), user_name character varying(255), password character varying(255), email character varying(255))";
  query(sql, function (err, result) {
    if (err) console.log(err);
  });
  console.log("Connected!");
});

//Login
app.post("/login", async (req, res) => {
  if (req.body.username && req.body.password) {
    try {
      // gets connection
      const results = await connection.query(
        `SELECT * FROM users WHERE user_name = $1 AND password = $2`,
        [req.body.username, req.body.password]
      ); // sends queries
      if (results && results.length < 1) {
        console.log(results);
        return res.status(400).json({ message: "Dang nhap khong thanh cong" });
      } else {
        return res.status(200).json(results.rows[0]);
      }
    } catch (error) {
      res.status(400).json({ message: error.stack });
    }
  }
  return res.status(400).json({ message: "Khong co username hoac password" });
});

//Dang ky
app.post("/register", async (req, res) => {
  const { fullname, user_name, password, email } = req.body;
  try {
    // gets connection
    await connection.query(
      `INSERT INTO "users" ("fullname", "user_name", "password", "email")  
             VALUES ($1, $2, $3, $4)`,
      [fullname, user_name, password, email]
    ); // sends queries
    res.status(200).json({ message: "Create user success" });
  } catch (error) {
    res.status(400).json({ message: error.stack });
  }
});
