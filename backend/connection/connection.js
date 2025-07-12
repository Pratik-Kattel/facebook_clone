const mongoose=require('mongoose');

const db_connect=async()=>{
    try{
        mongoose.connect('mongodb://127.0.0.1:27017/facebook_users',{
            useNewUrlParser:true,
            useUnifiedTopology:true,
        })
        console.log('Successfully connected to database');
    }
    catch(err){
        console.log('Error in database connection',err);
        process.exit(1);
    }
}
module.exports=db_connect;