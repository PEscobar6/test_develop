const {DataTypes} = require('sequelize');
const db = require('../db/connection');

const Habitaciones = db.define('Habitaciones', {
    tipo_habitacion: {
        type: DataTypes.INTEGER
    },
    code: {
        type: DataTypes.STRING
    },
    estado: {
        type: DataTypes.STRING
    }
}, {
    modelName: "habitaciones",
    freezeTableName: true
});


module.exports = Habitaciones;