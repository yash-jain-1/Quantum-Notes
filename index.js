const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const notesRoutes = require('./routes/notes');

const app = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());

// Connect to MongoDB
mongoose.connect('mongodb://localhost:27017/Nota', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

// Routes
app.use('/api/notes', notesRoutes);

// Start the server
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
