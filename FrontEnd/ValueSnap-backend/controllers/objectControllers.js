// controllers/objectController.js
const Object = require('../models/objectModel');
const { validationResult } = require('express-validator');
const logger = require('../logger'); // Assuming you have a logger setup

exports.getObjects = async (req, res) => {
  try {
    const objects = await Object.find();
    res.json(objects);
    logger.info('Fetched all objects');
  } catch (err) {
    logger.error('Error fetching objects:', err);
    res.status(500).json({ message: err.message });
  }
};

exports.createObject = async (req, res) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
    return res.status(400).json({ errors: errors.array() });
  }

  const { name, value, imageUrl } = req.body;

  try {
    const newObject = new Object({ name, value, imageUrl });
    await newObject.save();
    res.status(201).json(newObject);
    logger.info('Created new object:', newObject);
  } catch (err) {
    logger.error('Error creating object:', err);
    res.status(400).json({ message: err.message });
  }
};
