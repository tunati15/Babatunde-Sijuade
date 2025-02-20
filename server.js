"use strict";

const express = require("express");

// Constants
const PORT = 80;
const HOST = "0.0.0.0";

// App 
// Declare route
const app = express();
app.get("/", (req, res) => {
  res.send("Hello World");
});

app.get("/planning-poker", (req, res) => {
  res.send("Future Planning Poker URL");
});

app.listen(PORT, HOST, () => {
  console.log(`Running on http://${HOST}:${PORT}`);
});


