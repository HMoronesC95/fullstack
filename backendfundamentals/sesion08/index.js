const express = require("express");
const app = express();

app.get("/", function (request, response){
    response.send("hello world");
});

app.listen(7075);