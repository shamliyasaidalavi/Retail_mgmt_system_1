const express = require('express');

const categoryModel = require('../models/category');
const multer = require('multer');

const categoryRouter = express.Router();
var storage = multer.diskStorage({
  destination: function (req, file, cb) {
      cb(null, "./public/images/")
  },
  filename: function (req, file, cb) {
      cb(null,file.originalname)
  }
})

var upload = multer({ storage: storage })

categoryRouter.post('/upload', upload.single("file"), (req, res) => {
  console.log("jh",req.file.filename);
  return res.json("file uploaded")
})
categoryRouter.get('/view-category', async (req, res) => {
    try {
        const users = await categoryModel.find()
        if(users[0]!=undefined){
            return res.status(200).json({
                success:true,
                error:false,
                data:users
            })
        }else{
            return res.status(400).json({
                success:false,
                error:true,
                message:"No data found"
            })
        }
    } catch (error) {
        return res.status(400).json({
            success:false,
            error:true,
            message:"Something went wrong",
            details:error
        })
    }
    })
categoryRouter.post('/category', async function (req, res) {
  try {
    const data = {
      category_name: req.body.category_name,
      category_image: req.body.category_image,
      
    };
    const savedData = await categoryModel(data).save();
    if(savedData){
      return res.status(200).json({
        success:true,
        error:false,
        data:savedData
    })
      console.log(savedData);
    }
   
  } catch (error) {
    return res.status(400).json({
      success:false,
      error:true,
      message:"Something went wrong",
      details:error
  })
    console.error(error);
  }
});

module.exports = categoryRouter;
