const mongoose = require("mongoose");

const schema = mongoose.Schema

const productSchema = new schema({
    product_name: { type: String },
    quantity: { type: String },
    price: { type: String },
    description: { type: String },
    category: { type: String },
    product_image: { type: String },
    total:{type:String},
    total_amount:{type:String},
    
})

const productModel = mongoose.model('product_tb',productSchema)
module.exports = productModel