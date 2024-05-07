
const mongoose = require("mongoose");

const DB = "mongodb+srv://sangrammohite280:qGQvFAO5iWWgIDoN@cluster0.ohmqsrd.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";



mongoose.connect(DB).then(()=>{
    console.log("connected to database");
})
const login = new  mongoose.Schema({
    username:{
            type:String,
            required:true,
    },
    text:{
        type:String,
        required:true,

    },
    
    Route:{
        type:String,
        required:true,

    }
    ,
    Distance:{
        type:String,
        required:true,

    },
    Roadcondition:{
        type:String,
        required:true,

    },
    Mostimport:{
        type:String,
        required:true,

    },
    whretostay:{
        type:String,
        required:true
    },
    wayto:{
        type:String,
        required:true,
    }
})

const User = mongoose.model("user",login);

module.exports=User;