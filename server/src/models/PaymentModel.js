const mongoose = require("mongoose");

const schema = mongoose.Schema

const paymentSchema = new schema({
    user_id: { type: mongoose.Types.ObjectId, ref:'user_tb'},
    order_id : { type: mongoose.Types.ObjectId, ref:'order_tb'},
    user_name: { type: String },
    payment_type : { type: String },
    date: { type: String },
    totalValue: {type: String},
   
})

const paymentModel = mongoose.model('payment_tb',paymentSchema)
module.exports = paymentModel