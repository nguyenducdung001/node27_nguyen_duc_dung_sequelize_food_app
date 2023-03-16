const sequelize = require("../models/index");
const initModel = require("../models/init-models");
const model = initModel(sequelize);

// đánh giá theo nhà hàng
const getRateByRes = async (req, res) => {
  try {
    let { id } = req.params;
    let data = await model.restaurant.findOne({
      where: {
        res_id: id,
      },
    });
    if (data) {
      let dataRate = await model.rate_res.findAll({
        where: {
          res_id: id,
        },
        include: ["user"],
      });
      if (dataRate) {
        res.status(200).send(dataRate);
      } else {
        res.status(400).send("not found");
      }
    }
  } catch (err) {
    res.status(500).send("backend error");
  }
};

//đánh giá theo người dùng
const getRateByUser = async (req, res) => {
  try {
    let { id } = req.params;
    let data = await model.user.findOne({
      where: {
        user_id: id,
      },
    });
    if (data) {
      let dataRate = await model.rate_res.findAll({
        where: {
          user_id: id,
        },
        include: ["re"],
      });
      if (dataRate) {
        res.status(200).send(dataRate);
      } else {
        res.status(400).send("not found");
      }
    }
  } catch (err) {
    res.status(500).send("backend error");
  }
};

// Thêm đánh giá
const addRate = async (req, res) => {
  try {
    let { user_id, res_id, amount, date_rate } = req.body;
    let newRate = {
      user_id,
      res_id,
      amount,
      date_rate: Date.now(),
    };
    let data = await model.rate_res.create(newRate);
    if (data) {
      res.status(201).send(data);
    } else {
      res.status(400).send("error");
    }
  } catch (err) {
    res.status(500).send("backend error");
  }
};

module.exports = {
  getRateByRes,
  getRateByUser,
  addRate,
};
