const {DataTypes} = require('sequelize');
const db = require('../db/connection');

const Estadia = db.define('Estadia', {
    ClienteId: {
        type: DataTypes.INTEGER
    },
    HabitacioneId: {
        type: DataTypes.INTEGER
    },
    tipoPlanId: {
        type: DataTypes.INTEGER
    },
    fecha_ingreso: {
        type: DataTypes.DATE
    },
    acompañantes: {
        type: DataTypes.INTEGER
    },
    total: {
        type: DataTypes.FLOAT
    }
}, {
    modelName: 'estadia',
    freezeTableName: true
});


module.exports = Estadia;