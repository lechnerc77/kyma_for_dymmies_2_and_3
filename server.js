const express = require('express')
const app = express()

app.get('/free', (req, res) => {
    res.send('Free silly')
})

app.get('/prot', (req, res) => {
    res.send(`Successfully passed security control. Running on '${req.headers.host}${req.path}'. Auth: '${req.headers.authorization}'`)
})

app.listen(1111, () => {
    console.log('Node app running on port 1111')
})