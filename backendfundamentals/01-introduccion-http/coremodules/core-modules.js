//los core modules son paquetes o modulos que
//vienen incluidos en la instalacion de nodejs

//se utiliza una funcion especial llamada "reuire" para
//"importar" las funciones o módulos que queremos utilizar

//los modulos se pueden traer en forma de variables

//commonjs
const os = require("node:os")//require es una funcion propia de nodejs
//3 tipos de codigos, el primero es el que ya esta dentro de la instalacion
//segundo es uno propio que yo puedo usar
//el tercero es uno externo que yo puedo descargar

//ecmascript 6, es el metodo nuevo
//import os from 'node:os';

console.log(os.platform())

