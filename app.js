// app.js

const express = require('express');
const bodyParser = require('body-parser');
const multer = require('multer');
const { exec } = require('child_process');
const path = require('path');
const connectDB = require('./config/db');
const objectRoutes = require('./routes/objectRoutes');

const app = express();

// Connect to database
connectDB();

// Middleware
app.use(bodyParser.json());

// Set up multer for file uploads
const upload = multer({ dest: 'uploads/' });

// Routes
app.use('/api', objectRoutes);

// TensorFlow Lite route
app.post('/api/detect-object', upload.single('image'), (req, res) => {
    const imagePath = req.file.path;
    const tfliteModelPath = path.join(__dirname, 'ml/model.tflite');
    
    exec(`python3 ml/object_detection.py ${tfliteModelPath} ${imagePath}`, (error, stdout, stderr) => {
        if (error) {
            console.error(`Error executing script: ${error}`);
            return res.status(500).send('Error performing object detection');
        }
        
        console.log(`Output: ${stdout}`);
        res.send(`Object detection result: ${stdout}`);
    });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
