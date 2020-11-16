var express = require('express');
var engine = require('ejs-locals');
var bodyParser = require('body-parser');
const Mutant = require('./modelo/Mutant');
var app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

var serv = require('http').Server(app);
const port = 3000;
app.engine('ejs', engine);
app.set('view engine', 'ejs');

app.post('/mutant', function (req, res) {
  const mu = new Mutant();
    if (mu.isMutant(req.body.dna)) {
        res.status(200).send({message: 'OK'});
    } else {
        res.status(406).send({message: 'Forbidden'});
    }

});



serv.listen(port);
console.log('Server Up' + port);