import express from "express";
import mysql from "mysql2";

import PDFDocument from "pdfkit";

const app = express();

app.set("view-engine", "ejs");

app.use(express.static("public"));
app.use(express.urlencoded({ extended: true }));

app.listen(8000, () => {
  console.log("App listening on port 8000");
});

const pool = mysql
  .createPool({
    host: "127.0.0.1",
    user: "root",
    password: "",
    database: "art_gallery",
    connectionLimit: 10,
  })
  .promise();

// routes to render page

app.get("/", async (req, res) => {
  try {
    const arts = await pool.query("SELECT * FROM art_pieces");
    console.log(arts);
    res.render("dashboard.ejs", { arts: arts[0] });
  } catch (err) {
    console.error("Error fetching products: " + err.stack);
    res.status(500).send("Error fetching products");
  }
});

app.get("/dashboard", async (req, res) => {
  try {
    await res.render("dashboard.ejs");
  } catch (err) {
    console.error("Error fetching dashboard: " + err.stack);
    res.status(500).send("Error fetching dashboard");
  }
});