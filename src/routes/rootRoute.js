const express = require("express");
const likeRoute = require("./likeRoute");
const orderRoute = require("./orderRoute");
const rateRoute = require("./rateRoute");
const rootRoute = express.Router();

rootRoute.use("/like", likeRoute);
rootRoute.use("/rate", rateRoute);
rootRoute.use("/order", orderRoute);
module.exports = rootRoute;
