const {DataTypes} = require('sequelize');
const db = require('../db/connection');

const Servicios = db.define('Servicios', {
    servicio: {
        type: DataTypes.STRING
    },
    valor: {
        type: DataTypes.FLOAT
    }
}, {
    modelName: 'servicios',
    freezeTableName: true
});


module.exports = Servicios;