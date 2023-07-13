const { Pool } = require('pg');
require('dotenv').config();

const app = require('../server')

const { DATABASE_URL } = process.env;
const port = process.env.PORT || 8000

const pool = new Pool({
  connectionString: DATABASE_URL,
  ssl: {
    rejectUnauthorized: false,
  },
});

pool.connect().then((data)=>{
  console.log(data)
  app.listen(port,()=>{
    console.log(`app started successfully on port ${port}`)
  })
})

async function getPostgresVersion() {
  const client = await pool.connect();
  try {
    const res = await client.query('SELECT version()');
    console.log(res.rows[0]);
  } finally {
    client.release();
  }
}

getPostgresVersion();
