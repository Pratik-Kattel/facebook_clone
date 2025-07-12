const express=require('express');

const router=express.Router();

const User=require('../modules/users');

const AppError=require('../utils/Apperror');

router.post('/new_user',async(req,res)=>{
    const {email,password,name}=req.body;
    try{
    if(email==='' || password==='' || name===''){
       throw new AppError(404,'Please fill up the required field');
    }
    if(email.endsWith('@gmail.com')){
        const newuser= new User({name,email,password});
        await newuser.save();
        return res.status(201).json({message:'Successfully created new account'});
    }
    else{
       throw new AppError(405,'Please enter valid email address');
    }
    }
    catch(err){
        if(err instanceof AppError){
            return res.status(err.status).json({message:err.message});
        }
        else{
        return res.status(406).json({message:'Internal error occurred'.err})
        }
    }
});
module.exports=router;
