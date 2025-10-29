const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Admin123*',
  database: 'quoteflex'
});

module.exports = connection;