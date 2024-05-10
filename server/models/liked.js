const mongoose = require("mongoose");
const liked = new  mongoose.Schema({
    Distance:{
            type:String,
            required:true,
    },
    Route:{
        type:String,
        required:true,

    },
    linked:{
        type:Boolean,
        required:true,
    },
    count:{
        type:Number,
        required:true,
    }

})

const like= mongoose.model("Liked",liked);
module.exports=like;