const sequelize = require("../models/index");
const initModel = require("../models/init-models");
const model = initModel(sequelize);

// Thêm order
const addOrder = async (req, res) => {
  try {
    let { user_id, food_id, amount, code, arr_sub_id } = req.body;
    let newOrder = {
      user_id,
      food_id,
      amount,
      code,
      arr_sub_id,
    };
    let data = await model.order.create(newOrder);
    if (data) {
      res.status(201).send(data);
    } else {
      res.status(400).send("error");
    }
  } catch (err) {
    res.status(500).send("Backend errors");
  }
};

module.exports = {
  addOrder,
};
