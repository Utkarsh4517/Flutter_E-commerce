const express = require("express");
const User = require("../models/user");
const bcryptjs = require('bcryptjs');
const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
  try {
    // get the data from client

    const { name, email, password } = req.body;

    const existingUSer = await User.findOne({ email });
    if (existingUSer) {
      return res.status(400).json({ msg: "user exist with this email! " });
    }

    
    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      email,
      password: hashedPassword,
      name,
    });

    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({error: e.message});
  }
}),
  (module.exports = authRouter); // like static, or export var in py
