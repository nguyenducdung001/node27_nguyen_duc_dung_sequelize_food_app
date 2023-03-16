const sequelize = require("../models/index");
const initModel = require("../models/init-models");
const model = initModel(sequelize);

// Xử lý like theo nhà hàng
const getLikeByRes = async (req, res) => {
  try {
    let { id } = req.params;
    let data = await model.restaurant.findOne({
      where: {
        res_id: id,
      },
    });
    if (data) {
      let dataLike = await model.like_res.findAll({
        where: {
          res_id: id,
        },
        include: ["user"],
      });
      if (dataLike) {
        res.status(200).send(dataLike);
      } else {
        res.status(400).send("not found");
      }
    }
  } catch (err) {
    res.status(500).send("backend error");
  }
};

// Xử lý like theo người dùng
const getLikeByUser = async (req, res) => {
  try {
    let { id } = req.params;
    let data = await model.user.findOne({
      where: {
        user_id: id,
      },
    });
    if (data) {
      let dataLike = await model.like_res.findAll({
        where: {
          user_id: id,
        },
        include: ["re"],
      });
      if (dataLike) {
        res.status(200).send(dataLike);
      } else {
        res.status(400).send("not found");
      }
    }
  } catch (err) {
    res.status(500).send("backend error");
  }
};
// Thêm like
const addLike = async (req, res) => {
  try {
    let { user_id, res_id, date_like } = req.body;
    let newLike = {
      user_id,
      res_id,
      date_like: Date.now(),
    };
    let data = await model.like_res.create(newLike);
    if (data) {
      res.status(201).send(data);
    } else {
      res.status(400).send("error");
    }
  } catch (err) {
    res.status(500).send("backend error");
  }
};

// unlike
const unLike = async (req, res) => {
  try {
    let { user_id, res_id } = req.query;
    let dataRes = await model.restaurant.findOne({
      where: {
        res_id: res_id,
      },
    });
    let dataUs = await model.user.findOne({
      where: {
        user_id: user_id,
      },
    });
    if (dataRes && dataUs) {
      await model.like_res.destroy({
        where: {
          res_id: res_id,
          user_id: user_id,
        },
      });
      res.send("unliked");
    } else {
      res.status(400).send("Not found");
    }
  } catch (err) {
    res.status(500).send("backend error");
  }
};

module.exports = {
  getLikeByRes,
  getLikeByUser,
  addLike,
  unLike,
};
