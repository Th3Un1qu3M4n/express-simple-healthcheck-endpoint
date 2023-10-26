const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.get("/healthcheck", (req, res) => {
  res.json({ status: "ok" });
});

app.listen(3000, () => {
  console.log("App listening on port 3000!");
});
