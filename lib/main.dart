import 'package:firmaservicios/Pages/firma_page.dart';
import 'package:flutter/material.dart';
import 'Pages/pdf_screen.dart';
import 'Pages/Login_Page.dart';
import 'Pages/Servicios_page.dart';
import 'Pages/SignUp_page.dart';
import 'package:firmaservicios/preferencias_usuario/preferencias_usuario.dart';

//import 'Pages/firma_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final _prefs = new PreferenciasUsuario();
    _prefs.idTipoUsuario =
        "1"; //"1" = Producción, "0" o cualquier otro valor = TEST
    return MaterialApp(
      title: 'CITI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Color.fromRGBO(5, 109, 174, 1.0),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginPage(),
        'signup': (_) => SignUpPage(),
        'servicios': (_) => ServiciosPage(),
        "firma": (_) => SignaturePage(),
        "pdfa": (_) => PDFScreen()
      },
    );
  }
}
