const mongoose = require("mongoose");

const schema = mongoose.Schema

const salesSchema = new schema({
    order_id: { type: mongoose.Types.ObjectId, ref:'order_tb' },
    product_name: { type: String },
    user_name:{ type: String},
    quantity: { type: String },
    price: { type: String },
    item: { type: String },
    date: { type: String },
    totalValue: {type: String},
    bill_number: { type: String },
})

const salesModel = mongoose.model('sales_tb',salesSchema)
module.exports = salesModel