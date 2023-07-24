const mongoose = require("mongoose");

const schema = mongoose.Schema

const cartSchema = new schema({
    user_id: { type: mongoose.Types.ObjectId,ref:'user_tb' },
    
    product_id: { type: mongoose.Types.ObjectId,ref:'product_tb' },

    quantity: { type: String },
    status: { type: String },

    
    
})

const cartModel = mongoose.model('cart_tb',cartSchema)
module.exports = cartModel