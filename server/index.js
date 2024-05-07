const express = require("express");
const router = require("./auth")

const port = process.env.PORT||3000;

const app = express();

app.use(express.json());

app.use(router);


app.listen(port,()=>{
    console.log("COnnected to port 3000");


})