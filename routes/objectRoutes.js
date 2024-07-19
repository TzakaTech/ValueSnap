const express = require('express');
const router = express.Router();
const objectController = require('../controllers/objectController');

router.get('/objects', objectController.getObjects);
router.post('/objects', objectController.createObject);

module.exports = router;