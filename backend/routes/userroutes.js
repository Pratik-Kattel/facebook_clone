const express=require('express');

const router=express.Router();

const User=require('../modules/users');

const {findUserbyEmail}=require('../utils/email_verify');

const AppError=require('../utils/Apperror');

router.post('/login',async(req,res)=>{
const {email,password} =req.body;
try{
    if(email==='' || password===''){
       throw new AppError(402,'Please fill all the required field');
    }
    const user=await findUserbyEmail(email);
     if(password!=user.password){
        throw new AppError(401,'Sorry incorrect passowrd');
    }
    else{
      throw new AppError(200,'Login successful');
    }
}
catch(err){
   if(err instanceof AppError){
    return res.status(err.status).json({message:err.message});
   }
   else{
    return  res.status(500).json({message:'Internal error occurred'})
   }
}
});

module.exports=router;
