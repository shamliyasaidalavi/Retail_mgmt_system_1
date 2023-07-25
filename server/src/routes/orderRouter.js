const express = require('express');
const orderModel = require('../models/OrderModel');
const { default: mongoose } = require('mongoose');

const orderRouter = express.Router();


orderRouter.get('/make-payment/:id', async function (req, res) {
    try {
        const id = req.params.id
        const mode = req.query.mode
        console.log(id);
        const data = await orderModel.find({ user_id: id, status: 1 })
        for (let i = 0; i < data.length; i++) {
            const cart_data = await orderModel.updateMany({ user_id: id }, { $set: { status: 2,mode:mode } })
        }
        return res.status(200).json({
            success: true,
            error: false,
            message: "payment completed"
        })
    } catch (error) {
        return res.status(400).json({
            success: false,
            error: true,
            message: "Something went wrong"
        })
    }
});

orderRouter.get('/view_order/:id', async (req, res) => {
    try {
        const id = req.params.id
        console.log(id);
        // const data = await ordermodel.find({ user_id: id, status: 0 })
        const data = await orderModel.aggregate([
            {
                '$lookup': {
                    'from': 'product_tbs',
                    'localField': 'product_id',
                    'foreignField': '_id',
                    'as': 'product'
                }
            },
            {
                "$unwind": "$product"
            },
            {
                "$match": {
                    "user_id": new mongoose.Types.ObjectId(id)
                }
            },
            {
                "$match": {
                    "status": "0"
                }
            },
            {
                "$group": {
                    '_id': '$_id',
                    'quantity': { '$first': '$quantity' },
                    'status': { '$first': '$status' },
                    'product_id': { '$first': '$product._id' },
                    'price': { '$first': '$product.price' },
                    'product_name': { '$first': '$product.product_name' },
                    'product_image': { '$first': '$product.product_image' },
                    'user_id': { '$first': '$user_id' }
                }
            }
        ])

        data.forEach((item) => {
            item.total = item.price * item.quantity;
        });

        let totalValue = 0;

        for (const item of data) {
            totalValue += item.total;
        }

        //   data.forEach((item) => {
        //       item.total_amount = totalValue;
        //   });

        if (data[0] === undefined) {
            return res.status(401).json({
                success: false,
                error: true,
                message: "No Data Found!"
            })
        }
        else {
            return res.status(200).json({
                success: true,
                error: false,
                data: data,
                totalValue: totalValue
            })
        }

    } catch (error) {
        return res.status(400).json({
            success: false,
            error: true,
            message: "Something went wrongzz"
        })
    }
})

orderRouter.get('/view_completed_orders/:id', async (req, res) => {
    try {
        const id = req.params.id
        console.log(id);
        // const data = await ordermodel.find({ user_id: id, status: 0 })
        const data = await orderModel.aggregate([
            {
                '$lookup': {
                    'from': 'product_tbs',
                    'localField': 'product_id',
                    'foreignField': '_id',
                    'as': 'product'
                }
            },
            {
                "$unwind": "$product"
            },
            {
                "$match": {
                    "user_id": new mongoose.Types.ObjectId(id)
                }
            },
            {
                "$match": {
                    "status": "1"
                }
            },
            {
                "$group": {
                    '_id': '$_id',
                    'quantity': { '$first': '$quantity' },
                    'status': { '$first': '$status' },
                    'product_id': { '$first': '$product._id' },
                    'price': { '$first': '$product.price' },
                    'product_image': { '$first': '$product.product_image' },
                    'product_name': { '$first': '$product.product_name' },
                    'user_id': { '$first': '$user_id' }
                }
            }
        ])

        data.forEach((item) => {
            item.total = item.price * item.quantity;
        });

        let totalValue = 0;

        for (const item of data) {
            totalValue += item.total;
        }

        //   data.forEach((item) => {
        //       item.total_amount = totalValue;
        //   });

        if (data[0] === undefined) {
            return res.status(401).json({
                success: false,
                error: true,
                message: "No Data Found!"
            })
        }
        else {
            return res.status(200).json({
                success: true,
                error: false,
                data: data,
                totalValue: totalValue
            })
        }

    } catch (error) {
        return res.status(400).json({
            success: false,
            error: true,
            message: "Something went wrong"
        })
    }
})

orderRouter.post('/order', async function (req, res) {
    try {
        
        const data = {
            product_id: product.product_id,
            user_id: product.user_id,
            price: $first.price,
            total: $first.total,
            quantity: $first.quantity,
            status: 0,

        };
        const datas = await orderModel(data).save()
        console.log(data);

    } catch (error) {

    }
});

orderRouter.get('/couter_view_order/', async (req, res) => {
    try {
      
        // const data = await ordermodel.find({ user_id: id, status: 0 })
        const data = await orderModel.aggregate([
            {
                '$lookup': {
                    'from': 'product_tbs',
                    'localField': 'product_id',
                    'foreignField': '_id',
                    'as': 'product'
                }
            },
            {
                "$unwind": "$product"
            },
           
            {
                "$match": {
                    "status": "2"
                }
            },
            {
                "$group": {
                    '_id': '$_id',
                    'quantity': { '$first': '$quantity' },
                    'status': { '$first': '$status' },
                    'product_id': { '$first': '$product._id' },
                    'price': { '$first': '$product.price' },
                    'product_name': { '$first': '$product.product_name' },
                    'product_image': { '$first': '$product.product_image' },
                    'user_id': { '$first': '$user_id' }
                }
            }
        ])

        data.forEach((item) => {
            item.total = item.price * item.quantity;
        });

        let totalValue = 0;

        for (const item of data) {
            totalValue += item.total;
        }

        //   data.forEach((item) => {
        //       item.total_amount = totalValue;
        //   });

        if (data[0] === undefined) {
            return res.status(401).json({
                success: false,
                error: true,
                message: "No Data Found!"
            })
        }
        else {
            return res.status(200).json({
                success: true,
                error: false,
                data: data,
                totalValue: totalValue
            })
        }

    } catch (error) {
        return res.status(400).json({
            success: false,
            error: true,
            message: "Something went wrongzz"
        })
    }
})

orderRouter.get('/online_delivery_order/', async (req, res) => {
  
    try {
      const total = await orderModel.aggregate([
        { $match: { mode: 'online_delivery' } },
        { $group: { _id: '$user_id', product_id:{'$first':'$product_id'}, product_name:{'$first':'$product_name'},first_name:{'$first':'$first_name'} } },
      ]);
  
      if (total.length > 0) {
        return res.status(200).json({
          data: total,
          message: 'Success',
          success: true,
        });
      } else {
        return res.status(404).json({
          data: 'No data available',
          success: false,
        });
      }
    } catch (error) {
      return res.status(500).json({
        error: 'Internal Server Error',
        success: false,
      });
    }
  });
orderRouter.get('/take_away-oders/', async (req, res) => {
  
    try {
      const total = await orderModel.aggregate([
        { $match: { mode: 'take_away' } },
        { $group: { _id: '$user_id', product_id:{'$first':'$product_id'} } },
      ]);
  
      if (total.length > 0) {
        return res.status(200).json({
          data: total,
          message: 'Success',
          success: true,
        });
      } else {
        return res.status(404).json({
          data: 'No data available',
          success: false,
        });
      }
    } catch (error) {
      return res.status(500).json({
        error: 'Internal Server Error',
        success: false,
      });
    }
  });

module.exports = orderRouter;
