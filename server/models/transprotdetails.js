const mongoose = require("mongoose");
const transport = new  mongoose.Schema({
    username:{
            type:String,
            required:true,
    },
    wayto:{
        type:String,
        required:true,

    },
    details:{
        type:String,
        required:true,
    }
})

const details = mongoose.model("transport",transport);
module.exports=details;