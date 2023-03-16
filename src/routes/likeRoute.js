const express = require("express");
const {
  getLikeByRes,
  getLikeByUser,
  addLike,
  unLike,
} = require("../controllers/likeController");
const likeRoute = express.Router();

likeRoute.get("/getlikebyres/:id", getLikeByRes);
likeRoute.get("/getlikebyuser/:id", getLikeByUser);

likeRoute.post("/addlike", addLike);
likeRoute.delete("/unlike", unLike);

module.exports = likeRoute;
