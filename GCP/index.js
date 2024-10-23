const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send(`Hello OE`);
});

//stage-db
app.get("/startsql", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./updatedb.sh PROJECT_NAME oe-kubernates-dev ALWAYS');
  res.send("Request processed");
});

app.get("/stopsql", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./updatedb.sh PROJECT_NAME oe-kubernates-dev NEVER');
  res.send("Request processed");
});

//NAMESPACE-cluster
app.get("/startoe", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./startoe.sh');
  res.send("Request processed");
});

app.get("/stopoe", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./stopoe.sh');
  res.send("Request processed");
});

app.get("/startignite", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./startignite.sh');
  res.send("Request processed");
});

//NAMESPACE-pods

app.get("/startoestagepods", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./stage-scaleup.sh');
  res.send("Request processed");
});

app.get("/stopoestagepods", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./stage-scaledown.sh');
  res.send("Request processed");
});

//CLUSTER_NAME-nodes
app.get("/startoedev", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./devup.sh');
  res.send("Request processed");
});

app.get("/stopoedev", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./devdown.sh');
  res.send("Request processed");
});

//CLUSTER_NAME-pods
app.get("/startoedevpods1", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./dev-scaleup-1.sh');
  res.send("Request processed");
});
app.get("/startoedevpods2", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./dev-scaleup-2.sh');
  res.send("Request processed");
});
app.get("/startoedevpods3", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./dev-scaleup-3.sh');
  res.send("Request processed");
});

app.get("/stopoedevpods", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./dev-scaledown.sh');
  res.send("Request processed");
});

//general-cluster
app.get("/startgeneral", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./update.sh PROJECT_NAME general 1 us-central1-a');
  res.send("Request processed");
});

app.get("/stopgeneral", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./update.sh PROJECT_NAME general 0 us-central1-a');
  res.send("Request processed");
});

//general-db
app.get("/startgeneralsql", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./updatedb.sh PROJECT_NAME general ALWAYS');
  res.send("Request processed");
});

app.get("/stopgeneralsql", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./updatedb.sh PROJECT_NAME general NEVER');
  res.send("Request processed");
});

const port = process.env.PORT || 8080;
app.listen(port, () => {
  console.log('Server update app started on port', port);
});

//CLUSTER_NAME
//CLUSTER_NAME-nodes
app.get("/startoestaging", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./oe-stagingup.sh');
  res.send("Request processed");
});

app.get("/stopoestaging", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./oe-stagingdown.sh');
  res.send("Request processed");
});

//CLUSTER_NAME-pods
app.get("/startoestagingpods1", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./oe-staging-scaleup1.sh');
  res.send("Request processed");
});
app.get("/startoestagingpods2", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./oe-staging-scaleup2.sh');
  res.send("Request processed");
});
app.get("/startoestagingpods3", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./oe-staging-scaleup3.sh');
  res.send("Request processed");
});

app.get("/stopoestagingpods", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./oe-staging-scaledown.sh');
  res.send("Request processed");
});

//istio 

app.get("/istionodeup", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./istio-nodeup.sh');
  res.send("Request processed");
});
app.get("/istionodedown", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./istio-nodedown.sh');
  res.send("Request processed");
});
app.get("/istiopodsup", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./istio-podsup.sh');
  res.send("Request processed");
});

app.get("/istiopodsdown", (req, res) => {
  const shell = require('shelljs');
  shell.exec('./istio-podsdown.sh');
  res.send("Request processed");
});


