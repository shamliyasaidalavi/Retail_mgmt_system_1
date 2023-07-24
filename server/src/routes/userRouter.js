const express = require('express');

const userModel = require('../models/userModel');
const userRouter = express.Router();

userRouter.post('/user', async function (req, res) {
  try {
    const data = {
        first_name: req.body. user_name ,
        last_name: req.body.last_name,
        Phone_no: req.body.Phone_no,
        address: req.body.address,
        email: req.body.email,
        gender: req.body.gender, 
       
      
    };
    const datas = await userModel(data).save()
    console.log(data);
    
  } catch (error) {
    
  }
});

module.exports = userRouter;
