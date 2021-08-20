const mysql = require('mysql');


const conn = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    port:3306,
    database:'daycare_node'
});

module.exports = conn