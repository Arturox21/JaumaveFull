import mongoose from 'mongoose';
//import User from './models/User'

mongoose.connect('mongodb+srv://Administrador:Mave1234@clustermave.a0ipagw.mongodb.net/').then(() => { 
    console.log("\x1b[92m[MongoDB] La conexion a la base de datos exitosa \x1b[39m");
}).catch(err => console.log(err))


/*mongoose.connect('mongodb://127.0.0.1:27017/jaumave').then(() => { 
    console.log("\x1b[92m[MongoDB] La conexion a la base de datos exitosa \x1b[39m");
}).catch(err => console.log(err))*/