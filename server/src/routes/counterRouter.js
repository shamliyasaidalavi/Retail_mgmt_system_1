const express = require('express');
const counterModel = require('../models/CounterModel');
const counterRouter = express.Router();
counterRouter.post('/counter', async function (req, res) {
  try {
    const data = {
        counter_name: req.body. counter_name ,
        counter_id: req.body.counter_id,
        Phone_no: req.body. Phone_no,
        email: req.body.email,
        password: req.body.password, 
       
      
    };
    const datas = await counterModel(data).save()
    console.log(data);
    
  } catch (error) {
    
  }
});

module.exports = counterRouter;
