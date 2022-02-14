const {response, request} = require('express');
const Estadia = require('../models/estadia');
const EstadiaDetalle = require('../models/estadiaDetalle');

const getEstadias = async(req = request, res = response) => {
    const estadia = await Estadia.findAll({
        include: ['Cliente', 'Habitacione', 'tipoPlan', 'estadiaDetalles']
    });

    if (estadia) {
        res.json({
            msg: "Estadia encontrada correctamente",
            estadia,
            
        });
    }else{
        res.status(404).json({
            msg: `No se encontro una estadia con el id ${id}`
        });
    }
}

const getEstadia = async(req = request, res = response) => {
    const {id} = req.params;
    const estadia = await Estadia.findAll({
        include: ['Cliente', 'Habitacione', 'tipoPlan', 'estadiaDetalles']
    });

    if (estadia) {
        res.json({
            msg: "Estadia encontrada correctamente",
            estadia,
            
        });
    }else{
        res.status(404).json({
            msg: `No se encontro una estadia con el id ${id}`
        });
    }
}

module.exports = {getEstadias, getEstadia}