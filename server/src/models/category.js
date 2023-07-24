const mongoose = require("mongoose");

const schema = mongoose.Schema

const categorySchema = new schema({
    category_name: { type: String },
    category_image: { type: String },
   
})

const categoryModel = mongoose.model('category_tb',categorySchema)
module.exports = categoryModel