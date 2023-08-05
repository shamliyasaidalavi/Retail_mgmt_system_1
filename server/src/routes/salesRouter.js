const express = require('express');
const salesModel = require('../models/SalesModel');


const salesRouter = express.Router();
salesRouter.get('/view-sales', async (req, res) => {
  try {
      const users = await salesModel.find()
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
salesRouter.post('/sales', async function (req, res) {
  try {
    const data = {
        product_name: req.body. product_name ,
        order_id: req.body.order_id,
       user_id: req.body.user_id,
        quantity: req.body.quantity,
        price: req.body.price,
        item: req.body.item,
        date: req.body.date, 
        totalValue: req.body.totalValue ,
        bill_number: req.body.bill_number ,
      
    };
    const datas = await salesModel(data).save()
    console.log(data);
    
  } catch (error) {
    
  }
});

module.exports = salesRouter;
