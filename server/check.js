const mongo = require("./models/login");


const check = async(req,res,nxt)=>{
        try{
                const {email,password,token}=req.body;
                const found =await  mongo.findOne({email});
                // console.log(found.body);
                if(found.email != email){
                    if(password != found.password){
                       return res.json({msg:"invalid password"});
                    }
            
                     return res.json({msg:"invalid email"});
                
                }
              if(found.token != token ){
                return res.json({msg:"token invalid"});
            
              }
              
              console.log("down");
              req.user= found;
              
              
              nxt();
                
        }catch(e){
            console.log(e);


        }

}

module.exports= check ;