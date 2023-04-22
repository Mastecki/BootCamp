const os = require('os');
const fs = require('fs');
const http = require('http');
const { Client } = require('pg');

const containerHostname = os.hostname();
const applicationVersion = process.env.APP_VERSION ?? "v1";

const serverHostname = '0.0.0.0';
const port = 80;

const dbHostname = process.env.DB_HOSTNAME ?? "localhost";
const dbPort = process.env.DB_PORT ?? 5432;
const dbUsername = process.env.DB_USER ?? "";
const dbPassword = process.env.DB_PASS ?? "";
const dbName = process.env.DB_NAME ?? "";

const redisHostname = process.env.REDIS_HOSTNAME ?? "";
const redisPort = process.env.REDIS_PORT ?? "";

const { createClient } = require('redis');

const client = createClient();

client.on('error', err => console.log('Redis Client Error', err));

const server = http.createServer(async (req, res) => {
  const pgClient = new Client({
    user: dbUsername,
    password: dbPassword,
    host: dbHostname,
    port: dbPort,
    database: dbName
  });
  await pgClient.connect();

  const pgResponse = await client.query('SELECT NOW()');
  await pgClient.end();

  await client.connect({
    url: `redis://${redisHostname}:${redisPort}`
  });

  await client.set('key', 'value');
  const value = await client.get('key');
  await client.disconnect();

  res.statusCode = 200;
  res.setHeader('Content-Type', 'application/json');

  const responseBody = JSON.stringify({
    status: 'ok'
  });

  res.end(responseBody);
});

server.listen(port, serverHostname, () => {
  console.log(`Container hostname: ${containerHostname}`);
  console.log(`Server running at http://${serverHostname}:${port}/`);
});
