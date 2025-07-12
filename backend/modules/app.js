const express=require('express');
const cors=require('cors');
const body_parser=require('body-parser');
const app=express();
const mongoconnect=require('../connection/connection');
const routes=require('../routes/userroutes');
const login=require('../routes/new_account');

const update_password =require('../routes/update_password');
const port=process.env.PORT || 3000;

app.use(cors());
app.use(body_parser.json());

mongoconnect();

app.use('/auth',routes);
app.use('/login',login);
app.use('/update_password',update_password);


app.listen(port,()=>{
    console.log('Server started at port:',port)
})

