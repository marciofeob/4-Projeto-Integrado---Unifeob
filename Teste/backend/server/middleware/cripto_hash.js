const crypto = require('crypto');


// Uso no Express
app.use(express.json());
app.use(md5PasswordMiddleware);
