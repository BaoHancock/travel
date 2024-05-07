const mongoose = require("mongoose");
const useradd = new  mongoose.Schema({
    username:{
            type:String,
            required:true,
    },
    passwrod:{
        type:String,
        required:true,

    },
})

const add = mongoose.model("newuser",useradd);
module.exports=add;