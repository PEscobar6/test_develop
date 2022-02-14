const {Sequelize} = require('sequelize');

const db = new Sequelize('mihotel', 'root', '1075321220Pabl@', {
    host: 'localhost',
    dialect: 'mysql',
    // logging: false
});

module.exports = db;