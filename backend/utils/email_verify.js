const User=require('../modules/users');
const AppError=require('./Apperror');
async function findUserbyEmail(email){
    const id=await User.findOne({email});
    if(!id){
       throw new AppError(406,'No user with such email exists')
    }
    return id;    
}

module.exports={findUserbyEmail};