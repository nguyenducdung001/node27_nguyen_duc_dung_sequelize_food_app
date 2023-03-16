const { Sequelize } = require("sequelize");

const sequelize = new Sequelize("db_food", "root", "dungKute01@", {
  host: "localhost",
  port: "3307",
  dialect: "mysql",
});

const checkConnect = async () => {
  try {
    await sequelize.authenticate();
    console.log("Kết nối thành công");
  } catch {
    console.log("Kết nối thất bại");
  }
};

checkConnect();

module.exports = sequelize;
