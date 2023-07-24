const express = require('express');
const godownModel = require('../models/GodwnModel');
const godownRouter = express.Router();

godownRouter.post('/godown', async function (req, res) {
  try {
    const data = {
        godown_name: req.body. godown_name ,
        godow_id: req.body.godow_id,
      
    };
    const datas = await godownModel(data).save()
    console.log(data);
    
  } catch (error) {
    
  }
});

module.exports = godownRouter;
