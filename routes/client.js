const {Router} = require('express');
const router = Router();

const { getClients,
        getClient,
        postClient,
        putClient,
        deleteClient
    } = require('../controllers/clientes');

router.get('/', getClients);

router.get('/:id', getClient);

router.post('/', postClient);

router.put('/:id', putClient);

router.delete('/:id', deleteClient);

module.exports = router;