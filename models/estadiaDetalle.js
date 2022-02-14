const {DataTypes} = require('sequelize');
const db = require('../db/connection');

const EstadiaDetalle = db.define('estadiaDetalles', {
    id_estadia: {
        type: DataTypes.INTEGER,
        
    },
    servicio: {
        type: DataTypes.INTEGER
    },
    cantidad: {
        type: DataTypes.INTEGER
    },
    EstadiumId: {
        type: DataTypes.INTEGER
    }
}, {
    modelName: 'estadiaDetalles',
    tableName: 'estadiaDetalles',
    freezeTableName: true,
    timestamps: false
});

module.exports = EstadiaDetalle;