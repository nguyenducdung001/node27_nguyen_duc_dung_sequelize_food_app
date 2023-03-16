const express = require("express");
const {
  getRateByRes,
  getRateByUser,
  addRate,
} = require("../controllers/rateController");
const rateRoute = express.Router();

rateRoute.get("/getratebyres/:id", getRateByRes);
rateRoute.get("/getratebyuser/:id", getRateByUser);

rateRoute.post("/addrate", addRate);

module.exports = rateRoute;
