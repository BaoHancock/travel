const express = require("express");
const router = require("./auth")



const app = express();

app.use(express.json());

app.use(router);


app.listen(3000,()=>{
    console.log("COnnected to port 3000");


})