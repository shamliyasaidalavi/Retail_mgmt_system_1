const mongoose = require("mongoose");

const schema = mongoose.Schema

const paymentSchema = new schema({
    user_id: { type: mongoose.Types.ObjectId, ref:'user_tb'},
    user_name: { type: String },
    bill_number: { type: String },
    payment_type : { type: String },
    date: { type: String },
    price: { type: String },
    time: { type: String },
    totalValue: {type: String},
   
})

const paymentModel = mongoose.model('payment_tb',paymentSchema)
module.exports = paymentModel