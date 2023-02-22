//console.log("Hello,world");

// creating an api using express js
// we can name this const express as const xyz

// IMPORTS FROM PACKAGES

const express = require("express");
const mongoose = require("mongoose");
// similar to import line in dart ^

//IMPORTS FROM OTHER FILES

const authRouter = require("./routes/auth");

// INIT
const PORT = 3000;
// initialising express and saving it in the app variable.
const app = express();

//middleware
app.use(authRouter);

// connections
mongoose
  .connect()
  .then(() => {
    console.log("connection successful");
  })
  .catch((e) => {
    console.log(e);
  });
// CREATING API
// GET,PUT,POST,DELETE,UPDATE -> CRUD

// GET -- fetching some data
//<youripaddress>/hello-world
// app.get('/path', () {}) // ipaddress/path
http: app.get("/hello-world", (req, res) => {
  res.json({ hi: "hello , world" });
});

app.listen(PORT, () => {
  console.log("connected at port " + PORT + " hello");
});
// time 1:10:23
