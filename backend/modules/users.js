const mongoose=require('mongoose');

const Userschema=new mongoose.Schema({
   email: {
    type:String,
    required:true
    },
    password:{
        type:String,
        required:true,
    },
    name:{
        type:String,
        required:false,
    }
});

module.exports=mongoose.model('User',Userschema);