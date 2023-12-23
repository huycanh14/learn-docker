const Client = require("pg");
const dotenv = require("dotenv");
dotenv.config();

const pool = new Client({
  user: process.env.USER || "postgres",
  password: process.env.PASSWORD || "postgres",
  host: process.env.HOST || "localhost",
  port: process.env.PORT || 5432, // default Postgres port
  database: process.env.DATABASE || "database",
});

function query(text, params) {
  return pool.query(text, params);
}

export { pool, query };
