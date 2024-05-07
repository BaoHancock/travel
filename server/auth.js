const express = require("express");
const router = express.Router();
const mong = require("./models/login");
const add = require("./models/useradd.js");
const check = require("./check");
router.post("/login",async(req,res)=>{
try{
    const {email,password,token}=req.body;
    const found =await  mong.findOne({email});
    console.log(found.password);
    console.log(password);
    
    if(found.email == email){
        if(password == found.password){

            //  const got =await    mong.updateOne({email:found.email},{$set:{token:"true"}});
            console.log("up");
            const gotta = await mong.findOneAndUpdate({email:found.email},{token:true,email:found.email});
           
           return res.json(gotta);
          
          
        }
        return res.json({msg:"invalid password"});

        
    }
    return res.json({msg:"invalid email"});
    
  
 
}catch(e){
res.json({msg:e.mee})
}
})
router.post("/newuser",async(req,res)=>{
  try{
    const {username,password}=req.body;
    let add = new add({username:username,password:password});
    add = await add.save();
    res.json({username:"Received successfully"})
  }catch(e){
    console.log(e);
  }
})


router.post("/entry",async(req,res)=>{
  
  try{
    
    const {username,text,Route,Distance,Roadcondition,Mostimport,whretostay,wayto}= req.body;
   
   
    let user = new  mong({
        username,text,Route,Distance,Roadcondition,Mostimport,whretostay,wayto
    })
    user = await user.save();
    console.log(user);
    res.json(user);

  }catch(e){
    res.json({msg:e.message});
  }
})

router.post("/fetchday",async(req,res)=>{
  try{
      const{wayto}=req.body;


      const data = await mong.find({wayto:wayto});
      var obj={}
      for(var i=0;i<4;i++){
        obj[i]=data[i]["text"];
        


      }
      console.log(obj);
    
      res.json(obj);
  }catch(e){

  }
})

router.post("/fetch",async(req,res)=>{
  try{
      const{Distance}=req.body;


      const data = await mong.findOne({Distance :Distance});
      
      console.log(data);
    
      res.json(data);
  }catch(e){

  }
})

router.post("/fetchroute",async(req,res)=>{
  try{
      const{wayto}=req.body;


      const data = await mong.find({wayto:wayto});
      var obj={}
      for(var i=0;i<4;i++){
        obj[i]=data[i]["Route"];
        


      }
      console.log(obj);
        res.json(obj);
  }catch(e){

  }
})
router.post("/fetchdistance",async(req,res)=>{
  try{
      const{wayto}=req.body;


      const data = await mong.find({wayto:wayto});
      var obj={}
      for(var i=0;i<4;i++){
        obj[i]=data[i]["Distance"];
        


      }
      console.log(obj);
     
      res.json(obj);
  }catch(e){

  }
})
router.post("/fetchRoadconditon",async(req,res)=>{
  try{
      const{wayto}=req.body;


      const data = await mong.find({wayto:wayto});
      var obj={}
      for(var i=0;i<4;i++){
        obj[i]=data[i]["RoadConditon"];
        


      }
      console.log(obj);
      
      res.json(obj);
  }catch(e){

  }
})
router.post("/fetchmostimport",async(req,res)=>{
  try{
      const{wayto}=req.body;


      const data = await mong.find({wayto:wayto});
      var obj={}
      for(var i=0;i<4;i++){
        obj[i]=data[i]["Mostimport"];
        


      }
      console.log(obj);
      
      res.json(obj);
  }catch(e){

  }
})
router.post("/fetchwheretosttay",async(req,res)=>{
  try{
      const{wayto}=req.body;


      const data = await mong.find({wayto:wayto});
      var obj={}
      for(var i=0;i<4;i++){
        obj[i]=data[i]["whretostay"];
        


      }
      console.log(obj);
    
      res.json(obj);
  }catch(e){

  }
})

router.get("/checkandget",check,async(req,res)=>{
    const user = req.user;
    
    console.log(user.body);
    res.json({msg:req.user});
  
})
router.post("/signout",async(req,res)=>{
  const {email}=req.body;
  const gotta = await mong.findOneAndUpdate({email:email},{token:false,email:email});
  res.json(gotta);

})
module.exports = router;