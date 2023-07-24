const express = require('express')

const loginModel = require('../models/loginModel')

const userModel = require('../models/userModel')
const godownModel = require('../models/GodwnModel')
const counterModel = require('../models/CounterModel')
const deliveryboyModel = require('../models/deliveryboyModel')
const loginRouter = express.Router()


loginRouter.post('/login', async (req, res) => {
    try {
        const oldUser = await loginModel.findOne({ username: req.body.username})
        if (!oldUser) {
            return res.status(400).json({
                success: false,
                error: true,
                message: "User not found !"
            })
        }
        if (oldUser.password == req.body.password) {
            if (oldUser.role == 0) {
                return res.status(200).json({
                    success: true,
                    error: false,
                    login_id: oldUser._id,
                    details: oldUser,
                    status: oldUser.status,
                })
            }
            if (oldUser.role == 1) {
                const user = await userModel.findOne({ login_id: oldUser._id })
                if (user) {
                    return res.status(200).json({
                        success: true,
                        error: false,
                        login_id: oldUser._id,
                        user_id: user._id,
                        status: oldUser.status,
                        details: oldUser
                    })
                }

            }
            if (oldUser.role == 2) {
                const taxi = await counterModel.findOne({ login_id: oldUser._id })
                if (taxi) {
                    return res.status(200).json({
                        success: true,
                        error: false,
                        login_id: oldUser._id,
                        user_id: taxi._id,
                        status: oldUser.status,
                        details: oldUser
                    })
                }

            }
            if (oldUser.role == 3) {
                const driver = await godownModel.findOne({ login_id: oldUser._id })
                if (driver) {
                    return res.status(200).json({
                        success: true,
                        error: false,
                        login_id: oldUser._id,
                        driver_id: driver._id,
                        status: oldUser.status,
                        details: oldUser
                    })
                }


            }
            if (oldUser.role == 4) {
                const driver = await deliveryboyModel.findOne({ login_id: oldUser._id })
                if (driver) {
                    return res.status(200).json({
                        success: true,
                        error: false,
                        login_id: oldUser._id,
                        driver_id: driver._id,
                        status: oldUser.status,
                        details: oldUser
                    })
                }

                
            }
            

        } else {
            return res.status(406).json({
                success: false,
                error: true,
                message: "Password not matching!"
            })
        }


    } catch (error) {
         return res.status(400).json({
            success:true,
            error:false,
            message:"Something went wrong"
        })

    }
})

module.exports = loginRouter