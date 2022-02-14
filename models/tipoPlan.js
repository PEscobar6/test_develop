const {DataTypes} = require('sequelize');
const db = require('../db/connection');

const tipoPlan = db.define('tipoPlan', {
    tipo: {
        type: DataTypes.STRING
    }
}, {
    modelName: 'tipoPlan',
    freezeTableName: true
});


module.exports = tipoPlan;