const express = require("express");
const { addOrder } = require("../controllers/orderController");
const orderRoute = express.Router();

orderRoute.post("/addorder", addOrder);

module.exports = orderRoute;
