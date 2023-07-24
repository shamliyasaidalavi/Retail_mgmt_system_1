const express = require('express')
const userModel = require('../models/userModel')
const loginModel = require('../models/loginModel')
const counterModel = require('../models/CounterModel')
const godownModel = require('../models/GodwnModel')
const deliveryboyModel = require('../models/deliveryboyModel')
const registerRouter = express.Router()



registerRouter.get('/view-users', async function (req, res) {
    try {

        const allUser = await userModel.aggregate([
            {
                '$lookup': {
                    'from': 'login_tbs', 
                    'localField': 'login_id', 
                    'foreignField': '_id', 
                    'as': 'login'
                }

            },
            {
                '$match':{
                    "login.status":'0'
                }
            },
            {
                '$unwind':"$login"
            },
            {
                '$group':{
                    '_id':'$_id',
                    
                   
                
                    'logid':{'$first':'$login._id'},
                     'first_name':{'$first':'$first_name'},
                    'Phone_no':{'$first':'$Phone_no'},
                    'last_name':{'$first':'$last_name'},
                    'status':{'$first':'$login.status'},
                    'address':{'$first':'$address'},
                    'email':{'$first':'$email'},
                    'gender':{'$first':'$gender'},
                    'username':{'$first':'$login.username'},
                    
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
registerRouter.get('/view-usersaproov', async function (req, res) {
    try {

        const allUser = await userModel.aggregate([
            {
                '$lookup': {
                    'from': 'login_tbs', 
                    'localField': 'login_id', 
                    'foreignField': '_id', 
                    'as': 'login'
                }

            },
            {
                '$match':{
                    "login.status":'1'
                }
            },
            {
                '$unwind':"$login"
            },
            {
                '$group':{
                    '_id':'$_id',
                    
                   
                    
                    'logid':{'$first':'$login._id'},
                     'first_name':{'$first':'$first_name'},
                    'Phone_no':{'$first':'$Phone_no'},
                    'last_name':{'$first':'$last_name'},
                    'status':{'$first':'$login.status'},
                    'address':{'$first':'$address'},
                    'email':{'$first':'$email'},
                    'gender':{'$first':'$gender'},
                    'username':{'$first':'$login.username'},
                    
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
registerRouter.get('/view-counter', async function (req, res) {
    try {

        const allUser = await counterModel.aggregate([
            {
                '$lookup': {
                    'from': 'login_tbs', 
                    'localField': 'login_id', 
                    'foreignField': '_id', 
                    'as': 'login'
                }
            },
            {
                '$match':{
                    "login.status":'0'
                }
            },
            
            {
                '$unwind':"$login"
            },
            {
                '$group':{
                    '_id':'$_id',
                    'logid':{'$first':'$login._id'},
                    'counter_name':{'$first':'$counter_name'},
                    'Phone_no':{'$first':'$Phone_no'},
                    'counter_id':{'$first':'$counter_id'},
                    'status':{'$first':'$login.status'},
                    'email':{'$first':'$email'},
                    'username':{'$first':'$login.username'},
                    
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
registerRouter.get('/view-counteraproov', async function (req, res) {
    try {

        const allUser = await counterModel.aggregate([
            {
                '$lookup': {
                    'from': 'login_tbs', 
                    'localField': 'login_id', 
                    'foreignField': '_id', 
                    'as': 'login'
                }
            },
            {
                '$match':{
                    "login.status":'1'
                }
            },
            
            {
                '$unwind':"$login"
            },
            {
                '$group':{
                    '_id':'$_id',
                    'logid':{'$first':'$login._id'},
                    'counter_name':{'$first':'$counter_name'},
                    'Phone_no':{'$first':'$Phone_no'},
                    'counter_id':{'$first':'$counter_id'},
                    'status':{'$first':'$login.status'},
                    'email':{'$first':'$email'},
                    'username':{'$first':'$login.username'},
                    
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
registerRouter.get('/view-godownaproov', async function (req, res) {
    try {

        const allUser = await godownModel.aggregate([
            {
                '$lookup': {
                    'from': 'login_tbs', 
                    'localField': 'login_id', 
                    'foreignField': '_id', 
                    'as': 'login'
                }
            },
            {
                '$match':{
                    "login.status":'1'
                }
            },
            {
                '$unwind':"$login"
            },
            {
                '$group':{
                    '_id':'$_id',
                    'logid':{'$first':'$login._id'},

                    'godown_name':{'$first':'$godown_name'},
                    'godow_id':{'$first':'$godow_id'},
                    'status':{'$first':'$login.status'},
                    'username':{'$first':'$login.username'},
                    
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
registerRouter.get('/view-godown', async function (req, res) {
    try {

        const allUser = await godownModel.aggregate([
            {
                '$lookup': {
                    'from': 'login_tbs', 
                    'localField': 'login_id', 
                    'foreignField': '_id', 
                    'as': 'login'
                }
            },
            {
                '$match':{
                    "login.status":'0'
                }
            },
            {
                '$unwind':"$login"
            },
            {
                '$group':{
                    '_id':'$_id',
                    'logid':{'$first':'$login._id'},

                    'godown_name':{'$first':'$godown_name'},
                    'godow_id':{'$first':'$godow_id'},
                    'status':{'$first':'$login.status'},
                    'username':{'$first':'$login.username'},
                    
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
registerRouter.get('/view-delivery', async function (req, res) {
    try {

        const allUser = await deliveryboyModel.aggregate([
            { '$lookup': {
                'from': 'login_tbs', 
                'localField': 'login_id', 
                'foreignField': '_id', 
                'as': 'login'
            }
            },
            {
                '$match':{
                    "login.status":'0'
                }
            },
            {
                '$unwind':"$login"
            },
            {
                '$group':{
                    '_id':'$_id',
                    'logid':{'$first':'$login._id'},
                    'deliveryboy_name':{'$first':'$deliveryboy_name'},
                    'Phone_no':{'$first':'$phone_no'},
                    'del_id':{'$first':'$del_id'},
                    'status':{'$first':'$login.status'},
                    'address':{'$first':'$address'},
                    'email':{'$first':'$email'},
                    'username':{'$first':'$login.username'},
                    
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
registerRouter.get('/view-deliveryap', async function (req, res) {
    try {

        const allUser = await deliveryboyModel.aggregate([
            { '$lookup': {
                'from': 'login_tbs', 
                'localField': 'login_id', 
                'foreignField': '_id', 
                'as': 'login'
            }
            },
            {
                '$match':{
                    "login.status":'1'
                }
            },
            {
                '$unwind':"$login"
            },
            {
                '$group':{
                    '_id':'$_id',
                    'logid':{'$first':'$_id'},
                    'deliveryboy_name':{'$first':'$deliveryboy_name'},
                    'Phone_no':{'$first':'$phone_no'},
                    'del_id':{'$first':'$del_id'},
                    'status':{'$first':'$login.status'},
                    'address':{'$first':'$address'},
                    'email':{'$first':'$email'},
                    'username':{'$first':'$login.username'},
                    
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


registerRouter.post('/user-register', async function (req, res) {
    try {
        const oldUser = await loginModel.findOne({ username: req.body.username })
        if (oldUser) {
            return res.status(400).json({
                success: true,
                error: false,
                message: "User already exists"
            })
        }
        const oldPhone = await userModel.findOne({ Phone_no: req.body.phoneNumber })
        if (oldPhone) {
            return res.status(400).json({
                success: true,
                error: false,
                message: "Phone number already exists"
            })
        }

        const log_data = {
            username: req.body.username,
            password: req.body.password,
            role: 1,
            status: 0,
        }
        const save_login = await loginModel(log_data).save()
        if (save_login) {
            const user_data = {
                login_id: save_login._id,
                first_name: req.body.first_name,
                last_name: req.body.last_name,
                Phone_no: req.body.phoneNumber,
        
                email: req.body.email,
                address: req.body.address,
                gender: req.body.gender,
            }
            const save_user = await userModel(user_data).save()
            if (save_user) {
                return res.status(200).json({
                    success: true,
                    error: false,
                    details: save_user,
                    message: "Registration completed"
                })
            }
        }
    } catch (error) {
        return res.status(400).json({
            success: true,
            error: false,
            message: "Something went wrong"
        })
    }
})

registerRouter.post('/counter-register', async function (req, res) {
    try {
        const oldUser = await loginModel.findOne({ username: req.body.username })
        if (oldUser) {
            return res.status(400).json({
                success: true,
                error: false,
                message: "User already exists"
            })
        }
        const oldPhone = await counterModel.findOne({ Phone_no: req.body.phoneNumber })
        if (oldPhone) {
            return res.status(400).json({
                success: true,
                error: false,
                message: "Phone number already exists"
            })
        }

        const log_data = {
            username: req.body.username,
            password: req.body.password,
            role: 2,
            status: 0,
        }
        const save_login = await loginModel(log_data).save()
        if (save_login) {
            const user_data = {
                login_id: save_login._id,
                counter_name: req.body.counter_name,
                counter_id: req.body.counter_id,
                Phone_no: req.body.phoneNumber,
                email: req.body.email,
            }
            const save_user = await counterModel(user_data).save()
            if (save_user) {
                return res.status(200).json({
                    success: true,
                    error: false,
                    details: save_user,
                    message: "Registration completed"
                })
            }
        }
    } catch (error) {
        return res.status(400).json({
            success: true,
            error: false,
            message: "Something went wrong"
        })
    }
})
registerRouter.post('/godown-register', async function (req, res) {
    try {
        const oldUser = await loginModel.findOne({ username: req.body.username })
        if (oldUser) {
            return res.status(400).json({
                success: true,
                error: false,
                message: "User already exists"
            })
        }

        const log_data = {
            username: req.body.username,
            password: req.body.password,
            role: 3,
            status: 0,
        }
        const save_login = await loginModel(log_data).save()
        if (save_login) {
            const user_data = {
                login_id: save_login._id,
                godown_name: req.body.godown_name,
                godow_id : req.body.godow_id,
               
            }
            const save_user = await godownModel(user_data).save()
            if (save_user) {
                return res.status(200).json({
                    success: true,
                    error: false,
                    details: save_user,
                    message: "Registration completed"
                })
            }
        }
    } catch (error) {
        return res.status(400).json({
            success: true,
            error: false,
            message: "Something went wrong"
        })
    }
})
registerRouter.post('/delivery-register', async function (req, res) {
    try {
        const oldUser = await loginModel.findOne({ username: req.body.username })
        if (oldUser) {
            return res.status(400).json({
                success: true,
                error: false,
                message: "User already exists"
            })
        }
        const oldPhone = await deliveryboyModel.findOne({ Phone_no: req.body.Phone_no })
        if (oldPhone) {
            return res.status(400).json({
                success: true,
                error: false,
                message: "Phone number already exists"
            })
        }

        const log_data = {
            username: req.body.username,
            password: req.body.password,
            role: 4,
            status: 0,
        }
        const save_login = await loginModel(log_data).save()
        if (save_login) {
            const user_data = {
                login_id: save_login._id,
                deliveryboy_name: req.body.deliveryboy_name,
                del_id: req.body.del_id,
                address: req.body.address,
                Phone_no: req.body.Phone_no,
                email: req.body.email,
            }
            const save_user = await deliveryboyModel(user_data).save()
            if (save_user) {
                return res.status(200).json({
                    success: true,
                    error: false,
                    details: save_user,
                    message: "Registration completed"
                })
            }
        }
    } catch (error) {
        return res.status(400).json({
            success: true,
            error: false,
            message: "Something went wrong"
        })
    }
})
registerRouter.get('/approve/:id', async (req, res) => {
    try {
      const id = req.params.id;
 const approve = await loginModel.updateOne({ _id: id }, { $set: { status: 1 } });
   console.log(approve);
      if (approve && approve.modifiedCount === 1) {
        return res.status(200).json({
          success: true,
          message: 'User approved',
        });
      } else if (approve && approve.modifiedCount === 0) {
        return res.status(400).json({
          success: false,
          message: 'User not found or already approved',
        });
      } else {
        throw new Error('Error updating user');
      }
    } catch (error) {
      return res.status(400).json({
        success: false,
        message: 'Something went wrong',
        details: error.message,
      });
    }
  });
  registerRouter.get('/reject/:id', async (req, res) => {
    try {
      const id = req.params.id;
  
      const reject = await loginModel.deleteOne({ _id: id });
  
      if (reject && reject.deletedCount === 1) {
        return res.status(200).json({
          success: true,
          message: 'User rejected',
        });
      } else if (reject && reject.deletedCount === 0) {
        return res.status(400).json({
          success: false,
          message: 'User not found or already rejected',
        });
      } else {
        throw new Error('Error deleting user');
      }
    } catch (error) {
      return res.status(400).json({
        success: false,
        message: 'Something went wrong',
        details: error.message,
      });
    }
  });
  
module.exports = registerRouter
