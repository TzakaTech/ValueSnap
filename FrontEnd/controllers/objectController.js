// controllers/objectController.js
const Object = require('../models/objectModel');

exports.getObjects = async (req, res) => {
  try {
    const objects = await Object.find();
    res.json(objects);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

exports.createObject = async (req, res) => {
  const { name, value, imageUrl } = req.body;
  try {
    const newObject = new Object({ name, value, imageUrl });
    await newObject.save();
    res.status(201).json(newObject);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
}