const express = require('express');
const deliveryboyModel = require('../models/deliveryboyModel');
const deliveryboyRouter = express.Router();
deliveryboyRouter.get('/view-del', async (req, res) => {
  try {
      const users = await deliveryboyModel.find()
      if(users[0]!=undefined){
          return res.status(200).json({
              success:true,
              error:false,
              data:users
          })
      }else{
          return res.status(400).json({
              success:false,
              error:true,
              message:"No data found"
          })
      }
  } catch (error) {
      return res.status(400).json({
          success:false,
          error:true,
          message:"Something went wrong",
          details:error
      })
  }
  })  
deliveryboyRouter.post('/delivery', async function (req, res) {
  try {
    const data = {
        deliveryboy_name: req.body.deliveryboy_name ,
        del_id: req.body.del_id,
        user_name:req.body.user_name,
        email: req.body. email,
        address: req.body.address,
        Phone_no: req.body.Phone_no, 
        password: req.body.password, 
       order_id:req.body.order_id,
       time:req.body.time,
      
    };
    const datas = await deliveryboyModel(data).save()
    console.log(data);
    
  } catch (error) {
    
  }
});

module.exports = deliveryboyRouter;
