const {response, request} = require('express');
const Cliente = require('../models/cliente');

const getClients = async (req = request, res = response) => {
    const clientes = await Cliente.findAll();

    res.json({
        msg: 'Clientes obtenidos correctamente',
        data: clientes
    });
}

const getClient = async(req = request, res = response) => {
    const {id} = req.params;

    const usuario = await Cliente.findByPk(id);
    if (usuario) {
        res.json({
            msg: "Cliente obtenido correctamente",
            data: usuario
        });        
    }else{
        res.status(404).json({
            msg: `No existe un cliente con el id ${id}`
        })
    }

}

const postClient = async(req = request, res = response) => {
    res.json({
        ok: true,
        msg: "post API - controller"
    })
}

const putClient = (req = request, res = response) => {
    const {id} = req.params;


    res.json({
        ok: true,
        msg: "put API - controller",
        id
    })
}

const deleteClient = (req = request, res = response) => {
    res.json({
        ok: true,
        msg: "delete API - controller"
    })
}

const getClientWithEstadia = async(req = request, res = response) => {
    const a =1;
}

module.exports = {
    getClients,
    getClient,
    postClient,
    putClient,
    deleteClient
}