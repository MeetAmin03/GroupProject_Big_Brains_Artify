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


// Route to display Art List
app.get("/art-list", async (req, res) => {
    try {
      const arts = await pool.query("SELECT * FROM art_pieces");
      console.log(arts);
  
  
      res.render("art-list.ejs", { arts: arts[0] });
  
    } catch (err) {
      console.error("Error fetching arts: " + err.stack);
      res.status(500).send("Error fetching arts");
    }
  });
  
  // route to render data with get method
  
  
  
  app.get("/add-art", async (req, res) => {
    try {
      const artists_list = await pool.query("SELECT * FROM artists");
  
      const artists = artists_list[0];
  
      console.log(artists);
  
      res.render("add-art.ejs", {artists:artists}); 
    } catch (err) {
      console.error("Error rendering Art List page: " + err.stack);
      res.status(500).send("Error rendering Art List page");
    }
  });
  
  app.post("/add-art", async (req, res) => {
    try {
      console.log("111");
      console.log(req.body);
      const { title, medium, yearCreated, price, artistID } = req.body;
  
      console.log(req.body);
  
      const existingArtPiece = await pool.query(
        "SELECT art_piece_id FROM art_pieces WHERE title = ?",
        [title]
      );
  
      console.log(existingArtPiece);
  
      console.log(title);
  
      if (existingArtPiece[0].length > 0) {
        // Art piece with this title already exists
        return res.status(400).send("Art piece with this title already exists");
      }
  
      // console.log(artPieceData);
  
      const artPieceData = {
        title: title,
        medium: medium,
        year_created: yearCreated,
        price: price,
        artist_id: artistID,
      };
  
      console.log(artPieceData);
  
      await pool.query("INSERT INTO art_pieces SET ?", artPieceData);
  
      console.log("Art piece inserted successfully");
      res.redirect("/"); // Redirect to a page showing the list of art pieces after insertion
    } catch (err) {
      console.log(`error: ${err}`);
      res.status(500).send("Server error");
    }
  });
  
  // Route to handle delete product
  app.post("/delete-art-piece", async (req, res) => {
    try {
      const artPieceID = req.body.artPieceID;
  
      // Delete art piece from the database
      await pool.query("DELETE FROM art_pieces WHERE art_piece_id = ?", [
        artPieceID,
      ]);
  
      console.log("Art piece deleted successfully");
      res.redirect("/art-piece-list"); // Redirect to the art piece list page after deletion
    } catch (err) {
      console.error("Error deleting art piece: " + err.stack);
      res.status(500).send("Error deleting art piece");
    }
  });
  
  // Route to render edit product form
  app.get("/edit-art", async (req, res) => {
    try {
      const artPieceID = req.query.art_piece_id;
  
      console.log(artPieceID);
  
      // Fetch art piece details from the database
      const artPieceData = await pool.query(
        "SELECT * FROM art_pieces WHERE art_piece_id = ?",
        [artPieceID]
      );
  
      const art = artPieceData[0]; // Extracting the art piece object from the array
  
      res.render("edit-art.ejs", { art: art[0] }); // Render the edit art piece form with art piece details
    } catch (err) {
      console.error("Error fetching art piece details: " + err.stack);
      res.status(500).send("Error fetching art piece details");
    }
  });
  
  // Route to handle edit product form submission
  app.post("/edit-art", async (req, res) => {
    try {
      const { art_piece_id, title, medium, year_created, price,artist_id } =
        req.body;
  
      // Update art piece details in the database
      await pool.query(
        "UPDATE art_pieces SET title = ?, medium = ?, year_created = ?, price = ? WHERE art_piece_id = ?",
        [title, medium, year_created, price,art_piece_id]
      );
  
      console.log("Art piece updated successfully");
      res.redirect("/art-list"); // Redirect to the art piece list page after update
    } catch (err) {
      console.error("Error updating art piece: " + err.stack);
      res.status(500).send("Error updating art piece");
    }
  });
  