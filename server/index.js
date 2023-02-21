console.log("Hello,world");

// creating an api using express js
// we can name this const express as const xyz
const express = require('express');
// similar to import line in dart ^
const PORT = 3000;
// initialising express and saving it in the app variable.
const app = express();

// CREATING API
// GET,PUT,POST,DELETE,UPDATE -> CRUD

// GET -- fetching some data
http://<youripaddress>/hello-world
// app.get('/path', () {}) // ipaddress/path
app.get('/hello-world', (req,res) => {
    res.send('hello world');
} )

app.listen(PORT, () => {
    console.log('connected at port ' + PORT + ' hello') ;
} );