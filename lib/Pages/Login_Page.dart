import 'package:flutter/material.dart';
import 'package:firmaservicios/Widgets/Header.dart';
import 'package:firmaservicios/Widgets/LogoHeader.dart';
import 'package:firmaservicios/bd/operaciones.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  mostrarSnackBar(String mensaje) {
    final snackBar = SnackBar(
      backgroundColor: Colors.black,
      content: Text(mensaje, style: TextStyle(color: Colors.white)),
      duration: Duration(milliseconds: 5000),
    );

    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  progressSnackBar(String mensaje) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(mensaje),
          CircularProgressIndicator(),
        ],
      ),
    );

    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  // TextEditingController passwordControler = TextEditingController(text: "Micro2021*");
  // TextEditingController usuarioControler = TextEditingController(text: "android");
  TextEditingController usuarioControler = TextEditingController(text: "");
  TextEditingController passwordControler = TextEditingController(text: "");

  String user = "";

  String passwd = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        physics: BouncingScrollPhysics(),
        children: [
          // Stack(
          //   children: [HeaderLogin(), LogoHeader()],
          // ),
          //_Titulo(),
          Divider(
            height: 40,
          ),
          Container(
            child: Center(
              child: Column(
                children: [
                  Align(
                    child: Image(
                      image: AssetImage('assets/citi_azul.png'),
                      height: 85.0,
                      width: 85.0,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Firma electrónica de Servicios",
                    style: TextStyle(fontSize: 20, color: Colors.blue[900]),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          _emailAndPassword(context),
        ],
      ),
    );
  }

  Widget _emailAndPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          TextField(
            controller: usuarioControler,
            keyboardType: TextInputType.text,
            obscureText: false,
            decoration: InputDecoration(
                hintText: "Nombre de Usuario",
                filled: false,
                //fillColor: Color(0xffEBDCfA),
                prefixIcon: Icon(
                  Icons.person_pin_circle,
                  color: Colors.blue[900],
                ),
                border: OutlineInputBorder(
                  // borderSide: BorderSide(color: Color(0xffEBDCfA)),
                  borderSide: BorderSide(color: Colors.orange[900]),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                  // borderSide: BorderSide(color: Color.fromRGBO(54, 105, 194, .5)),
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          SizedBox(height: 20),
          TextField(
            controller: passwordControler,
            keyboardType: TextInputType.text,
            obscureText: false,
            decoration: InputDecoration(
                hintText: "Contraseña",
                filled: false,
                //fillColor: Color(0xffEBDCfA),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.blue[900],
                ),
                border: OutlineInputBorder(
                  // borderSide: BorderSide(color: Color(0xffEBDCfA)),
                  borderSide: BorderSide(color: Colors.orange[900]),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                  // borderSide: BorderSide(color: Color.fromRGBO(54, 105, 194, .5)),
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          SizedBox(
            height: 40,
          ),
          _botonSignIn(context, usuarioControler.text, passwordControler.text)
        ],
      ),
    );
  }

  Widget _botonSignIn(BuildContext context, String user, String passwd) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Color.fromRGBO(5, 109, 174, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: FlatButton(
        minWidth: size.width / 2,
        child: Text('Ingresar',
            style: TextStyle(color: Colors.white, fontSize: 18)),
        onPressed: () => ingresar(),
      ),
    );
  }

  void ingresar() async {
    if (usuarioControler.text != '' &&
        usuarioControler.text != null &&
        passwordControler.text != '' &&
        passwordControler.text != null) {
      progressSnackBar("Validando usuario y contraseña");
      //Map info = await Operaciones.login(usuarioControler.text.trim(), passwordControler.text.trim());
      Map info = await Operaciones.login(
          usuarioControler.text.trim(), passwordControler.text.trim());
      if (info['ok']) {
        Navigator.pushReplacementNamed(context, 'servicios',
            arguments: info); //antes odt
      } else {
        mostrarSnackBar(
            info['ok'] ? "Exito" : "No existe usuario o contraseña");
      }
    } else {
      mostrarSnackBar("Usuario o password vacío");
    }
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Text(
            'Ingresar   ',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            '/',
            style: TextStyle(fontSize: 24, color: Colors.grey),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, 'signup'),
            child: Text(
              'OLVIDÉ PASSWORD',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
