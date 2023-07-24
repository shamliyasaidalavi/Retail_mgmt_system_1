const mongoose = require("mongoose");

const schema = mongoose.Schema

const counterSchema = new schema({
    login_id: { type: mongoose.Types.ObjectId, ref:'login_tb' },
    counter_name: { type: String },
    counter_id: { type: String },
    Phone_no: { type: String },
    email: { type: String },
    password: { type: String },
    
})

const counterModel = mongoose.model('counter_tb',counterSchema)
module.exports = counterModel