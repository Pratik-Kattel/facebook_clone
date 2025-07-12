const express=require('express');
const User=require('../modules/users');
const router= express.Router();
const {findUserbyEmail}=require('../utils/email_verify');
const AppError=require('../utils/Apperror');

router.post('/email_verify',async (req,res)=>{
const {email}=req.body;
try{
    if(!email){
        throw new AppError(409,'Please fillup the required fields');
    }
    const user= await findUserbyEmail(email);
    return res.status(310).json({message:'Email verified successfully'});
}
catch(err){
if(err instanceof AppError){
    return res.status(err.status).json({message:err.message});
}
else{
    return res.status(410).json({message:"Internal error occurred"});
}
}
});

router.post('/update_password',async(req,res)=>{
    const{newpassword,email}=req.body;
    try{
        if(!newpassword){
            throw new AppError(411,'Please fillup the required field');
        }
        else{
        const user=await findUserbyEmail(email);
        user.password=newpassword;
        await user.save();
         return res.status(469).json({message:'Password changed successfully,now you can login back to facebook'});
        }
    }
    catch(err){
        if(err instanceof AppError){
            return res.status(err.status).json({message:err.message});
        }
        else{
              return res.status(412).json({message:"Internal error occurred"});
        }
    }
});

module.exports=router;