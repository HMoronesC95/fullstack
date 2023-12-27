const express = require("express");
const app = express();

// NOTA: En express EL ORDEN de middlewares/ruta es importante
// .use(f) se utiliza para registrar un "middleware" para todas las rutas
// .use("/ruta", f) se utiliza para registrar un "middleware" para una
// ruta en particular
app.use(function (request, response, next) {
	//console.log("URL:", request.url);
    console.log("Hola guapo");

    if(request.url == "/ban") {
        response.end(); //termina la peticion
    }else {
        next(); //la peticion puede continuar su camino
    }
	
});

app.use(function (request, response, next){
    console.log("Segundo middleware...")
    next()
})

app.get("/", function (request, response) {
    response.send("hello npunworld")
});

app.listen(8080, function () {
	console.log("> Escuchando puerto 8080");
});