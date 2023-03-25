const os = require('os');
const fs = require('fs');
const http = require('http');

const containerHostname = os.hostname();
const applicationVersion = process.env.APP_VERSION ?? "v1";

const serverHostname = '0.0.0.0';
const port = 80;

const server = http.createServer((req, res) => {
  res.statusCode = 200;

  const filePath = __dirname + req.url;
  if (!filePath.endsWith('/') && fs.existsSync(filePath)) {
      fs.readFile(filePath, function (err,data) {
        if (err) {
          res.writeHead(404);
          res.end(JSON.stringify(err));
          return;
        }
        res.writeHead(200);
        res.end(data);
      });
      return;
  }
  res.setHeader('Content-Type', 'text/html');

  const responseBody = `
        Hello!
        <br/>
        <br/>
        <img src="logo.svg" />
        <br />
        <br />
        Container hostname: ${containerHostname}<br />
        Application version: ${applicationVersion}<br />
  `;
  res.end(responseBody);
});

server.listen(port, serverHostname, () => {
  console.log(`Container hostname: ${containerHostname}`);
  console.log(`Server running at http://${serverHostname}:${port}/`);
});
