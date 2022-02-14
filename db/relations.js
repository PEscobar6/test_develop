const Estadia = require("../models/estadia");
const EstadiaDetalle = require("../models/estadiaDetalle");
const Cliente = require("../models/cliente");
const Habitaciones = require("../models/habitaciones");
const TipoPlan = require("../models/tipoPlan");
const Servicios = require("../models/servicios");


// Estadia has many Clientes
Estadia.belongsTo(Cliente);

//Estadia has many Habitaciones
Estadia.belongsTo(Habitaciones);

//Estadia has many Tipo de Planes
Estadia.belongsTo(TipoPlan);

// Estadia has many Detalles
Estadia.hasMany(EstadiaDetalle, {
    foreignKey: 'id_estadia'
});

//Estadia Detalle belongs to Estadia
EstadiaDetalle.belongsTo(Estadia);

//Estadia detalle has many Servicios
EstadiaDetalle.hasMany(Servicios);