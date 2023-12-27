//https://github.com/yorch-el-profe/santander-backend-fundamentals/tree/master/07-seguridad/01-jwt
const mongoose = require("mongoose");

// Conectar con MongoDB
mongoose
    .connect(
    "mongodb+srv://root:root@bedu.excpd0l.mongodb.net/test?retryWrites=true&w=majority"
    )
    .then(() => console.log("> Conectado a MongoDB"))
    .catch((e) => console.error("> Error: ", e));

// Crear el schema
// Un schema es como una tabla en SQL
const UserSchema = new mongoose.Schema(
    {
        email: { type: String, required: true, unique: true, maxlength: 100 },
        password: { type: String, required: true, minlength: 8, maxlength: 50 },
    },
    {
        timestamps: true
    }
);

// Crear un modelo a partir del schema
// Ya puedo interactuar con la BD
const UserModel = mongoose.model("users", UserSchema);

const passport = require("passport");
const { Strategy, ExtractJwt } = require("passport-jwt")
const jwt = require("jsonwebtoken");
const express = require("express");
const app = express();
const JWT_SECRET = "secreto";

// Configurar passport
passport.use(
	new Strategy(
		{
			// El mismo secreto que se usa para crear el token
			// se necesita para validarlo
			secretOrKey: JWT_SECRET,

			// Passport va tomar el token de un encabezado
			// llamado "Authentication"
			jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
		},
		// Esta función se ejecuta una vez que el token fue validado con éxito
		// con esto buscamos al usuario dentro de la base de datos
		// y se lo entregamos a passport.
		async function (payload, done) {
			const { _id } = payload;
			const user = await UserModel.findById(_id).exec();
			done(null, user);
		}
	)
);

app.get("/register", async function (request, response) {
    const data = request.body;

    try {
        const instance = new UserModel(data);
        const user = await instance.save();
        response.json(user);
    } catch (e) {
        response.json({ error: true, stack: e.message});
    }
});

// Endpoint que genera un token JWT para el frontend

// Pasos para generar un JWT
// 1. Verificar que el usuario exista en la base de datos
// 2. Elegir una llave secreta
// 3. Seleccionar el "payload" (lo que vamos a guardar en el token)
// 4. Con el payload y la llave secreta generar un token
// 5. Entregar el token al cliente
app.get("/authenticate", async function (request, response) {
	const { email, password } = request.body;

	// find encuentra 0 ([]) o más documentos
	// findOne encuentra 0 (null) o 1 documento
	// SELECT * FROM users WHERE email = :email
	const user = await UserModel.findOne({ email }).exec();

	// Type Coercion
	if (!user) {
		return response.json({ error: "No existe el usuario" });
	}

	if (user.password !== password) {
		return response.json({ error: "La contraseña es incorrecta" });
	}

	// Generar el JSON WEB TOKEN
	const payload = { _id: user._id, email: user.email };

	// payload: qué voy almacenar en el token
	// secret: la llave para generar/validar el token
	const token = jwt.sign(payload, JWT_SECRET);

	response.json({ token });
});

// Indica que usuario viene dentro del token
app.get(
	"/info",
	// Estoy activando el middleware de Passport
	// única y exclusivamente para esta ruta
	passport.authenticate("jwt", { session: false }),
	function (request, response) {
		// request.user es el usuario que inicio sesión con el token JWT
		response.json(request.user);
	}
);