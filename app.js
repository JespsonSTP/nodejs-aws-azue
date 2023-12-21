//if db config file exist
//require('./db/config');
const express = require('express')
const path = require('path')

const app = express();

//Middleware
app.use(express.json());

//routes
app.get('/', (req, res) => {
    res.send('Hello, World!');
});


// Serve any static files
if (process.env.NODE_ENV === 'production') {
  app.use(express.static(path.join(__dirname, '../client/build')));
}

module.exports = app;