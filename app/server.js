const express = require("express");
const app = express();
app.get("/health", (req, res) => res.send("{status:ok}"));
app.listen(80, () => console.log("Server running on http://localhost:80"));