const express = require('express');
const offerModel = require('../models/offerModel');
const { default: mongoose } = require('mongoose');

const offerRouter = express.Router();
offerRouter.get('/view-offer', async (req, res) => {
  try {
      const users = await offerModel.find()
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

offerRouter.post('/Addoffer', async function (req, res) {
  try {
    const data = {
      product_id: req.body.product_id,
      offer_name: req.body.offer_name,
     
      status:'0',
     
    };
    const savedData = await new offerModel(data).save();
    console.log(savedData);

    if (savedData) {
      return res.status(200).json({
        success: true,
        error: false,
        details: savedData,
        message: "offer Added",
      });
    }
  } catch (error) {
    return res.status(400).json({
      success: false,
      error: true,
      message: "Something went wrong",
    });
  }
});
offerRouter.post('/offer', async function (req, res) {
  try {
    const data = {
        product_name: req.body. offer_name ,
        offer_name: req.body. offer_id,
      
    };
    const datas = await offerModel(data).save()
    console.log(data);
    
  } catch (error) {
    
  }
});

// offerRouter.get('/view_order', async (req, res) => {
//   try {
//       const id = req.params.id
//       console.log('id',id );
//       // const data = await offerModel.find({ product_id_id: id, status: 0 })
//       const data = await offerModel.aggregate([
          
        
//           {   
//               '$lookup': {
//                   'from': 'product_tbs',
//                   'localField': 'product_id',
//                   'foreignField': '_id',
//                   'as': 'product'
//               }
//           },
   
//           {
//               "$unwind": "$product"
//           },
          // {
          //     "$match": {
          //         "product_id": new objectId(id)
          //     }
          // },
          
        
//           // {
//           //     "$group": {
//           //         '_id': '$_id',
                
//           //         'product_id': { '$first': '$product._id' },
//           //         'product_name': { '$first': '$product.product_name' },
//           //         'product_image': { '$first': '$product.product_image' },
                  
//           //     }
//           // }
          
//       ])

     
//       if (data[0] === undefined) {
//           return res.status(401).json({
//               success: false,
//               error: true,
//               message: "Data Found!"
//           })
//       }
    
     
//       if (data[0] === undefined) {
//         return res.status(401).json({
//             success: false,
//             error: true,
//             message: "No Data Found!"
//         })
//     }
  

//   } catch (error) {
//       return res.status(400).json({
          
//           success: false,
//           error: true,
//           message: "Something went wrongzz"
//       })
//   }
// })




offerRouter.get('/vis', async function (req, res) {
  const id = req.params.id
  try {

      const allUser = await offerModel.aggregate([
          {
            '$lookup': {
              'from': 'product_tbs',
              'localField': 'product_id',
              'foreignField': '_id',
              'as': 'product'
          }
          },
          // {
          //     '$match':{
          //       "product_id": new mongoose.Types.ObjectId(id)
          //     }
          // },
          {
              '$unwind':"$product"
          },
          {
              '$group':{
                  '_id':'$_id',
                  
                 
              
                  'product_id':{'$first':'$product_id'},
                  'product_name':{'$first':'$product.product_name'},
                  'offer_name':{'$first':'$offer_name'},
                  'product_image':{'$first':'$product.product_image'},
                 
                  
              }
          }
        ])
      if(!allUser){
         return res.status(400).json({
              success:false,
              error:true,
              message:"No data exist"
          })
      }
      return res.status(200).json({
          success:true,
          error:false,
          data:allUser
      })
      

    
     
  } catch (error) {
      return res.status(400).json({
          success:true,
          error:false,
          message:"Something went wrong"
      })
  }
})

module.exports = offerRouter;
