const http = require("node:http")

const server = http.createServer(function (request, response) {

    //agregar datos a la respusta
    response.write("hello guapo desde Node.js")

    //termina la peticion
    response.end()
})

//escucho el puerto 8080 para recibir peticiones
server.listen(8080, function() {
    console.log("Servidor escuchado puerto 8080")
})