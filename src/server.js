const express = require('express');
const dotenv = require('dotenv');

dotenv.config();

const app = express();
app.use(express.json());

const usersRouter = require('./routes/users.routes');

app.get('/', (req, res) => {
  res.json({ message: 'API corriendo correctamente desde Docker' });
});

// prefijo: /api
app.use('/api', usersRouter);

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`API escuchando en http://localhost:${PORT}`);
});
