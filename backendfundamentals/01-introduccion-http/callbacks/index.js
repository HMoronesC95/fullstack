//import fs from 'node:fs'
const fs = require("node:fs");

//callback: es una funcion que se va a ejecutar en el futuro
//(después de determinada accion)
fs.readFile("./readme.txt", "utf-8", function(err,data) {

    if(err) {
        console.log("Ocurrio un error al leer el archivo :(")
        console.log(err)
    }else {
        console.log(data)
    }

})

console.log("Leyendo un archivo......")