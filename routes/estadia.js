const {Router} = require('express');
const router = Router();

const { getEstadias,
        getEstadia
    } = require('../controllers/estadias');

router.get('/', getEstadias);

router.get('/:id', getEstadia);

module.exports = router;