const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const bodyParser = require('body-parser');

const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'ajandekwebshop-filled'
});

con.connect(function (err) {
    if (err) throw err;
    console.log('Connected!');
});

const app = express();

app.use(cors({
    credentials: true,
    origin: 'http://127.0.0.1:5500',
}));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false,
}));

app.route('/sql')
    .post((req, res) => {
        con.query(req.body.sql, (err, result) => {
            if (err) {
                res.send(err);
            } else {
                res.json(result)
            }
        })
    })

app.listen(3000, () => console.log('Example app listening on port 3000!'))