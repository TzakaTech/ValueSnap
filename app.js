const express = require('express');
const bodyParser = require('body-parser');
const connectDB = require('./config/db');
const objectRoutes = require('./routes/objectRoutes');

const app = express();

// Connect to database
connectDB();

// Middleware
app.use(bodyParser.json());

// Routes
app.use('/api', objectRoutes);

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
