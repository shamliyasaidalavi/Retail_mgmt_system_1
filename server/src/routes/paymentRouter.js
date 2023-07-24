const express = require('express');
const paymentModel = require('../models/PaymentModel');


const paymentRouter = express.Router();
paymentRouter.get('/view-payment', async (req, res) => {
  try {
      const users = await paymentModel.find()
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
paymentRouter.post('/payment', async function (req, res) {
  try {
    const data = {
        user_name: req.body. user_name ,
        user_id: req.body.user_id,
        bill_number: req.body.bill_number,
        payment_type: req.body.payment_type,
        price: req.body.price,
        date: req.body.date, 
       time:req.body.time,
       totalValue:req.body.totalValue,
      
    };
    const datas = await paymentModel(data).save()
    console.log(data);
    
  } catch (error) {
    
  }
});

module.exports = paymentRouter;
