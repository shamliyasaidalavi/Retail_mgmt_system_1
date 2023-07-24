const mongoose = require("mongoose");

const schema = mongoose.Schema

const offerSchema = new schema({
    product_id: { type: mongoose.Types.ObjectId, ref:'product_tb' },
    offer_name: { type: String },
   product_image:{type: String},
    
})

const offerModel = mongoose.model('offer_tb',offerSchema)
module.exports = offerModel