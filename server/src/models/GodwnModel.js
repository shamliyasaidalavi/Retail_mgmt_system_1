const mongoose = require("mongoose");

const schema = mongoose.Schema

const godownSchema = new schema({
    login_id: { type: mongoose.Types.ObjectId, ref:'login_tb' },
    godown_name: { type: String },
    godow_id: { type: String },
    password: { type: String },
    
})

const godownModel = mongoose.model('godown_tb',godownSchema)
module.exports = godownModel