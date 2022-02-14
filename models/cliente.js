const {DataTypes} = require('sequelize');
const db = require('../db/connection');
const Estadia = require('./estadia');

const Cliente = db.define('Cliente', {
    nombre: {
        type: DataTypes.STRING
    },
    dni: {
        type: DataTypes.STRING
    },
    edad: {
        type: DataTypes.INTEGER
    },
    status: {
        type: DataTypes.BOOLEAN
    }
});

module.exports = Cliente;