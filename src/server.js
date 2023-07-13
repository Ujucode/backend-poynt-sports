const express = require('express')

const athlets = require("./router/athlets.route")
const app = express();

app.use("/poyntSports",express.static("dist"))

app.use("/api/v1/athlets",athlets)

app.get('/',(req,res)=>{
    res.send("hello world");
})


module.exports = app