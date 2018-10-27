const express = require('express')
const node_app = express()

node_app.get('/', function(req, res){
    res.send('hello, express')
})

node_app.listen(3000)
module.exports = exports = node_app