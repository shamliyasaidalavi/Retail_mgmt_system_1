const express = require('express');
const deliveryboyModel = require('../models/deliveryboyModel');
const deliveryboyRouter = express.Router();

deliveryboyRouter.post('/delivery', async function (req, res) {
  try {
    const data = {
        deliveryboy_name: req.body.deliveryboy_name ,
        del_id: req.body.del_id,
        email: req.body. email,
        address: req.body.address,
        Phone_no: req.body.Phone_no, 
        password: req.body.password, 
       
      
    };
    const datas = await deliveryboyModel(data).save()
    console.log(data);
    
  } catch (error) {
    
  }
});

module.exports = deliveryboyRouter;
