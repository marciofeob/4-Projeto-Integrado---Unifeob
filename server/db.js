const mysql = require('mysql2')

const conexao = mysql.createConnection({
    host: 'sj.ddns.net',
    user: 'unifeob',
    password: 'Admin123*',
    database: 'quoteflex'
})

conexao.connect((err)=>{
    if (err) throw err
    console.log('Conectado ao Mysql!')
})

module.exports = conexao