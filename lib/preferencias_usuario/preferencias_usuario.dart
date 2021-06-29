import 'package:shared_preferences/shared_preferences.dart';

/*
  Recordar instalar el paquete de:
    shared_preferences:
  Inicializar en el main
    final prefs = new PreferenciasUsuario();
    await prefs.initPrefs();
    
    Recuerden que el main() debe de ser async {...
*/

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // "1" Producción - "0" Test
  get testProd {
    return _prefs.getString('testProd') ?? '';
  }

  set testProd(String value) {
    _prefs.setString('testProd', value);
  }

  // GET y SET del idUsuario
  get idUsuario {
    return _prefs.getString('idUsuario') ?? '';
  }

  set idUsuario(String value) {
    _prefs.setString('idUsuario', value);
  }

  // GET y SET del idAr
  get idAr_pref {
    return _prefs.getString('idAr_pref') ?? '';
  }

  set idAr_pref(String value) {
    _prefs.setString('idAr_pref', value);
  }

  // GET y SET del nombre de usuario
  get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  set nombre(String value) {
    _prefs.setString('nombre', value);
  }

  // GET y SET del tipo de usuario
  get idTipoUsuario {
    return _prefs.getString('idTipoUsuario') ?? '';
  }

  set idTipoUsuario(String value) {
    _prefs.setString('idTipoUsuario', value);
  }

  // GET y SET del noAr
  get noAr {
    return _prefs.getString('noAr') ?? '';
  }

  set noAr(String value) {
    _prefs.setString('noAr', value);
  }

  // GET y SET del noAr
  get pathfotos {
    return _prefs.getString('pathfotos') ?? '';
  }

  set pathfotos(String value) {
    _prefs.setString('pathfotos', value);
  }
}
