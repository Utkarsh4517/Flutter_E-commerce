const express = require("express");
const User = require("../models/user");

const authRouter = express.Router();

authRouter.post('/api/signup', async (req, res) => {
    // get the data from client

    const {name,email,password} =  req.body;

    const existingUSer = await User.findOne({ email });
    if (existingUSer) {
        return res.status(400).json({msg: 'user exist with this email! '});
    }

    let user = new User({
        email,
        password,
        name,
    })

    user = await user.save();
    // post that data in database
    // return that data to the user
})

module.exports = authRouter; // like static, or export var in py
// time 1:32:57