const express = require('express');
const cartModel = require('../models/CartModel');
const productModel = require('../models/ProductModel');
const { default: mongoose } = require('mongoose');
const orderModel = require('../models/OrderModel');
const objectId = mongoose.Types.ObjectId

const cartRouter = express.Router();

cartRouter.get('/view_order/:id', async (req, res) => {
    try {
        const id = req.params.id
        console.log(id);
        // const data = await cartModel.find({ user_id: id, status: 0 })
        const data = await cartModel.aggregate([
            
            {
                '$lookup': {
                    'from': 'user_tbs',
                    'localField': 'user_id',
                    'foreignField': '_id',
                    'as': 'user'
                }

            },
            {
                '$lookup': {
                    'from': 'product_tbs',
                    'localField': 'product_id',
                    'foreignField': '_id',
                    'as': 'product'
                }
            },
            {
                "$unwind": "$user"
            },
            {
                "$unwind": "$product"
            },
            {
                "$match": {
                    "user_id": new objectId(id)
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
                    'product_name': { '$first': '$product.product_name' },
                    'product_image': { '$first': '$product.product_image' },
                    'price':{'$first':'$product.price'},
                    'user_id': { '$first': '$user_id' },
                 
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
  
        data.forEach((item) => {
            item.total_amount = totalValue;
        });
  
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
                totalValue:totalValue,
   
       

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
 

cartRouter.post('/save-order/:id', async (req, res) => {
            try {
                const id = req.params.id
                console.log(id);
                const carts = await cartModel.aggregate([
                    {
                        '$lookup': {
                            'from': 'user_tbs',
                            'localField': 'user_id',
                            'foreignField': '_id',
                            'as': 'user'
                        }

                    },
                    {
                        '$lookup': {
                            'from': 'product_tbs',
                            'localField': 'product_id',
                            'foreignField': '_id',
                            'as': 'product'
                        }
                    },
                   
                    {
                        '$unwind': "$user"
                    },
                    {
                        '$unwind': "$product"
                    },
                   
                    {
                        '$match': {
                            "status": '0'
                        }
                    },
                    {
                        '$match': {
                            "user_id": new  objectId(id)
                        }
                    },
                    {
                        '$group': {
                            '_id': '$_id',
                            'user_id': { '$first': '$user_id' },
                            'product_id': { '$first': '$product_id' },
                            'product_name': { '$first': '$product_name' },
                            'quantity': { '$first': '$quantity' },
                            'product_image': { '$first':'product_image' },
                            'price': { '$first': '$food.price' },
                            'status': { '$first': '$status' },

                        }
                    }
                ])
              

                carts.forEach((item) => {
                    item.total = item.price * item.quantity;
                });

                let totalValue = 0;

          
                for (let i = 0; i < carts.length; i++) {
                    totalValue += carts[i].total;
                  }
              

                
                console.log(totalValue);
                const datas = [];
                const dateString = new Date();
                const date = new Date(dateString);
                const formattedDate = date.toISOString().split('T')[0];
                for (let i = 0; i < carts.length; i++) {
                    const orderData = new orderModel({
                        product_id: carts[i].product_id,
                        user_id: carts[i].user_id,
                        total: carts[i].total,
                        totalValue:totalValue,
                        quantity: carts[i].quantity,
                        status: 0,
                    });

                    datas.push(await orderData.save());
                }
                const cart_data = await cartModel.updateMany({ user_id: id }, { $set: { status: 1 } })



             
                    return res.status(200).json({
                        success: true,
                        error: false,
                        message: 'Success',
                    });
                
            } catch (error) {
                return res.status(400).json({
                    success: false,
                    error: true,
                    message: 'Something went wrongg',
                    details: error.message,
                });
            }
        });

        cartRouter.get('/view_cart/:id', async (req, res) => {
            try {
                const id = req.params.id
                console.log(id);
                // const data = await cartModel.find({ user_id: id, status: 0 })
                const data = await cartModel.aggregate([
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
                            "user_id": new objectId(id)
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
                            'product_name': { '$first': '$product.product_name' },
                            'description': { '$first': '$product.description' },
                            'product_image': { '$first': '$product.product_image' },
                            'price': { '$first': '$product.price' },

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

                data.forEach((item) => {
                    item.total_amount = totalValue;
                });

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
                    message: "Something went wrongz"
                })
            }
        })
        cartRouter.get('/increment/:id', async (req, res) => {
            try {
                const id = req.params.id
                const old = await cartModel.findOne({ _id: id })
                console.log(old);
                const counts = parseInt(old.quantity) + 1

                const add = await cartModel.updateOne({ _id: id }, { $set: { quantity: counts } })

                if (add.modifiedCount === 1) {
                    const old_product = await productModel.findOne({ _id: old.product_id })
                    const available_counts = parseInt(old_product.quantity) - 1
                    const product = await productModel.updateOne({ _id: old.product_id }, { $set: { quantity: available_counts } })

                    return res.status(201).json({
                        success: true, error: false,
                        message: "updated"
                    })
                } else {
                    return res.status(400).json({
                        success: false, error: true,
                        message: "error"
                    })
                }
            }
            catch (err) {
                res.status(500).json({ success: false, error: true, message: 'Something Went Wrongg' })
                console.log(err)
            }
        })

        cartRouter.get('/decrement/:id', async (req, res) => {
            try {
                const id = req.params.id
                const old = await cartModel.findOne({ _id: id })
                if (old.quantity > 1) {
                    const counts = parseInt(old.quantity) - 1

                    const add = await cartModel.updateOne({ _id: id }, { $set: { quantity: counts } })

                    if (add.modifiedCount === 1) {
                        const old_product = await productModel.findOne({ _id: old.product_id })
                        const available_counts = parseInt(old_product.quantity) + 1
                        const products = await productModel.updateOne({ _id: old.product_id }, { $set: { quantity: available_counts } })

                        return res.status(201).json({
                            success: true, error: false,
                            message: "updated"
                        })
                    } else {
                        return res.status(400).json({
                            success: false, error: true,
                            message: "error"
                        })
                    }
                } else {
                    return res.status(400).json({
                        success: false, error: true,
                        message: "Quantity cannot be less than 1"
                    })
                }

            }
            catch (err) {
                res.status(500).json({ success: false, error: true, message: 'Something Went Wrong' })
                console.log(err)
            }
        })

        cartRouter.get('/delete_cart/:id', async (req, res) => {
            const id = req.params.id
            try {
                cartModel.deleteOne({ _id: id }).then((data) => {
                    if (data.deletedCount === 1) {
                        return res.status(200).json({
                            success: true,
                            error: false,
                            message: "Data Deleted From Cart"
                        })
                    }
                })

            } catch (error) {
                return res.status(400).json({
                    success: false,
                    error: true,
                    message: "Something went wrong"
                })
            }
        })

        cartRouter.post('/cart', async (req, res) => {
            console.log(req.body);
            try {
                const old = await cartModel.findOne({ user_id: req.body.user_id, product_id: req.body.product_id, status: 0 })
                if (old) {
                    return res.status(400).json({
                        success: false,
                        error: true,
                        message: "Product already in cart"
                    })
                }
                const data = {
                    user_id: req.body.user_id,
                    product_id: req.body.product_id,
                    quantity: 1,
                    status: 0
                }
                console.log(data);
                var result = await cartModel(data).save()

                if (result) {
                    return res.status(200).json({
                        success: true,
                        error: false,
                        data: result,
                        message: "Added to Cart"
                    })
                }

            } catch (err) {
                return res.status(400).json({
                    success: false,
                    error: true,
                    message: "Something went wrong"
                })
            }
        })


        module.exports = cartRouter;