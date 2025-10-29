const express = require('express');
const cors = require('cors');
const routes = require('./routes/auth');

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api', routes);

const PORT = 3000;
app.listen(PORT, () => console.log(`Servidor backend rodando na porta ${PORT}`));
