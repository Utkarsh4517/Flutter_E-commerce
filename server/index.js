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
const PORT = 8080;
// initialising express and saving it in the app variable.
const app = express();
const DB = "mongodb+srv://Utkarsh4517:clocked4517@cluster0.bry89kx.mongodb.net/?retryWrites=true&w=majority";

//middleware
app.use(express.json());
app.use(authRouter);

// connections
mongoose
  .connect(DB)
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

