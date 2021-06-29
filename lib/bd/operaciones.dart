import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:firmaservicios/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:firmaservicios/models/unidades_model.dart';
import 'package:firmaservicios/models/servicios_model.dart';

final _prefs = new PreferenciasUsuario();

//Crear Tabla SQFlite
class Operaciones {
  static Future<bool> eliminarBD() async {
    final path1 = join(await getDatabasesPath(), 'Citi.db');
    bool nExiste = await databaseExists(path1);
    if (nExiste) {
      await deleteDatabase(path1);
      await _openDB();
    }
    return true;
  }

  static Future<Database> _openDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'Citi.db'),
        onCreate: (db, version) async {
      await db.execute(
        'CREATE TABLE Unidades ('
        ' id INTEGER PRIMARY KEY, '
        ' idar INTEGER,'
        ' noar TEXT,'
        ' idunidad INTEGER, '
        ' noserie TEXT, '
        ' lnoserie TEXT,'
        ' noinventario TEXT, '
        ' lnoinventario TEXT,'
        ' nombreequipo TEXT, '
        ' lnombreequipo TEXT,'
        ' ip TEXT, '
        ' lip TEXT, '
        ' monitor TEXT,'
        ' teclado TEXT,'
        ' mouse TEXT, '
        ' fechacapt TEXT, '
        ' enviado INTEGER, '
        ' fechaenv TEXT, '
        ' intoret TEXT'
        ') ',
      );
      await db.execute('CREATE TABLE Servicios ('
          ' id INTEGER PRIMARY KEY, '
          ' idAr INTEGER, '
          ' idCarga INTEGER, '
          ' idCliente INTEGER, '
          ' noAr TEXT, '
          ' concepto TEXT, '
          ' descCorta TEXT, '
          ' sintoma TEXT, '
          ' bitacora TEXT, '
          ' noAfiliacion TEXT, '
          ' telefono TEXT, '
          ' descNegocio TEXT, '
          ' direccion TEXT, '
          ' colonia TEXT, '
          ' poblacion TEXT, '
          ' estado TEXT, '
          ' cp TEXT, '
          ' notasRemedy TEXT, '
          ' equipo TEXT, '
          ' descEquipo TEXT, '
          ' segmento INTEGER, '
          ' fecInicio TEXT, '
          ' fecConvenio TEXT, '
          ' tipoServicio INTEGER, '
          ' tipoFalla INTEGER, '
          ' idSegmento INTEGER, '
          ' idServicio INTEGER, '
          ' idFalla INTEGER, '
          ' horasGarantia INTEGER, '
          ' precioExito INTEGER, '
          ' precio TEXT, '
          ' idNegocio INTEGER, '
          ' idEstado INTEGER, '
          ' idRegion INTEGER, '
          ' idZona INTEGER, '
          ' idTipoPlaza INTEGER, '
          ' idTecnico INTEGER, '
          ' isTecnicoForaneo INTEGER, '
          ' isDuplicada INTEGER, '
          ' isIngresoManual INTEGER, '
          ' isActualizacion INTEGER, '
          ' isInstalacion INTEGER, '
          ' isSustitucion INTEGER, '
          ' isRetiro INTEGER, '
          ' fecAlta TEXT, '
          ' fecAtencion TEXT, '
          ' fecGarantia TEXT, '
          ' retiros TEXT, '
          ' instalaciones TEXT, '
          ' retirosl BLOB, '
          ' instalacionesl BLOB, '
          ' atendida INTEGER, '
          ' fecha TEXT, '
          ' firma TEXT '
          ') ');
    }, version: 1);
  }

  //Insert SQFlite Unidades
  static Future<void> insert(Unidad unidad) async {
    Database database = await _openDB();
    final a = await database.insert("Unidades", unidad.toMap());
    return 1;
  }

  //Insert SQFlite Servicio
  static Future<void> insertServicio(Servicio servicio) async {
    Database database = await _openDB();
    final a = await database.insert("Servicios", servicio.toJson());
    return a;
  }

  //Delete SQFlite Unidades
  static Future<void> delete() async {
    Database database = await _openDB();

    return database.delete("Unidades");
  }

  //Delete SQFlite Servicios
  static Future<void> deleteServicio() async {
    Database database = await _openDB();

    return database.delete("Servicios");
  }

  //Update SQFlite Unidades
  static Future<void> update(Unidad unidad) async {
    Database database = await _openDB();

    return database.update("Unidades", unidad.toMap(),
        where: 'id = ?', whereArgs: [unidad.idunidad]);
  }

  //Update SQFlite Servicios
  static Future<void> updateServicios(Servicio servicio) async {
    Database database = await _openDB();

    return database.update("Servicios", servicio.toJson(),
        where: 'id = ?', whereArgs: [servicio.id]);
  }

  //List SQFlite unidades
  static Future<List<Unidad>> unidades() async {
    Database database = await _openDB();

    final List<Map<String, dynamic>> unidadesMap =
        await database.query("Unidades");

    List<Unidad> unik = unidadesMap.map((c) => Unidad.fromJson(c)).toList();
    return unik;
  }

  //List SQFlite
  static Future<List<Servicio>> servicios() async {
    Database database = await _openDB();

    final List<Map<String, dynamic>> serviciosMap =
        await database.query("Servicios");
    List<Unidad> unidadesMapL = [];
    List<Unidad> uRet = [];
    List<Unidad> uInst = [];
    ServicioL serv = ServicioL();
    serv.instalacionesl = [];
    serv.retirosl = [];

    List<Servicio> unik =
        serviciosMap.map((c) => Servicio.fromJson(c)).toList();
    List<ServicioL> servl = [];
    // unik.forEach((val) async {
    int index = 0;
    for (Servicio val in unik) {
      final List<Map<String, dynamic>> unidadesMap = await database
          .query("Unidades", where: 'idAr = ?', whereArgs: [val.idAr]);
      servl.add(serv);
      unidadesMapL = unidadesMap.map((c) => Unidad.fromJson(c)).toList();
      int nInst = 0;
      int nRet = 0;

      for (Unidad uni in unidadesMapL) {
        if (uni.intoret == "I") {
          uInst.add(uni);
          ++nInst;
        } else {
          uRet.add(uni);
          ++nRet;
        }
      }
      servl[index].instalacionesl = uInst;
      servl[index].retirosl = uRet;
      val.instalaciones = " 0/" + nInst.toString();
      val.retiros = " 0/" + nRet.toString();
      // val.instalacionesl = uInst;
      // val.instalacionesl = uRet;
    }

    return unik;
  }

  static Future<List<ServicioL>> serviciosL(List<Servicio> unik) async {
    Database database = await _openDB();
    List<Unidad> unidadesMapL = [];
    List<Unidad> uRet = [];
    List<Unidad> uInst = [];
    ServicioL serv = ServicioL();
    serv.instalacionesl = [];
    serv.retirosl = [];

    List<ServicioL> servl = [];
    // unik.forEach((val) async {
    int index = 0;

    for (Servicio val in unik) {
      final List<Map<String, dynamic>> unidadesMap = await database
          .query("Unidades", where: 'idAr = ?', whereArgs: [val.idAr]);
      servl.add(serv);
      unidadesMapL = unidadesMap.map((c) => Unidad.fromJson(c)).toList();
      int nInst = 0;
      int nRet = 0;
      uInst = [];
      uRet = [];
      for (Unidad uni in unidadesMapL) {
        if (uni.intoret == "I") {
          print("Inst AR: " + val.noAr + " - " + uni.noserie);
          uInst.add(uni);
          ++nInst;
        } else {
          print("Ret AR: " + val.noAr + " - " + uni.noserie);
          uRet.add(uni);
          ++nRet;
        }
      }
      servl[index].instalacionesl = uInst;
      servl[index].retirosl = uRet;
      index++;
      print("agregando " + servl[index - 1].instalacionesl.length.toString());
    }

    for (ServicioL serv in servl) {
      for (Unidad uniL in serv.instalacionesl) {
        print(uniL.noar);
      }
      for (Unidad uniL2 in serv.retirosl) {
        print(uniL2.noar);
      }
      print("_____________");
    }

    return servl;
  }

  //Update SQFlite
  static Future<Map<String, dynamic>> login(
      String username, String password) async {
    //final resp = _prefs.idTipoUsuario != null && _prefs.idTipoUsuario == "1"

    final headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://smc.microformas.com.mx/APICITIBN/api/CUsuarios/login'));
    request.body = """{\"user\": \"$username\", \"password\": \"$password\"}""";
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final resp = await response.stream.bytesToString();
      final Map<String, dynamic> user = json.decode(resp);
      _prefs.idUsuario = user['idUsuario'].toString();
      _prefs.nombre =
          user['nombre'] + " " + user['paterno'] + " " + user['materno'];

      return {'ok': true, 'idUsuario': ""};
    } else {
      return {'ok': false, 'error': 'error'};
    }
  }

  static Future<List<Servicio>> cargarServiciosJson() async {
    //final List<Map<String, dynamic>> resp = await rootBundle.loadString('data/servicios.json');
    int nInst = 0;
    int nRet = 0;

    final resp = await rootBundle.loadString('data/servicios.json');
    final inst = await rootBundle.loadString('data/unidades.json');
    final ret = await rootBundle.loadString('data/unidadesennegocio.json');
    List<dynamic> servicios = [];
    List<dynamic> instalaciones = [];
    List<dynamic> retiros = [];

    List<Servicio> serviciosl = [];
    List<Unidad> instalacionesl = [];
    List<Unidad> retirosl = [];

    List<Unidad> unidadesl = [];

    servicios = await json.decode(resp);
    instalaciones = await json.decode(inst);
    retiros = await json.decode(ret);

    serviciosl = servicios.map((c) => Servicio.fromJson(c)).toList();

    instalacionesl = instalaciones.map((c) => Unidad.fromJson(c)).toList();
    retirosl = retiros.map((c) => Unidad.fromJson(c)).toList();
    await delete();
    await deleteServicio();

    //Insertar filas en Unidades de Instalaciones en SQLite
    instalaciones.forEach((val) async {
      final instala = Unidad();
      instala.idar = val["ID_AR"];
      instala.idunidad = val["ID_UNIDAD"];
      instala.noserie = val["NO_SERIE"];
      instala.noinventario = val["NO_INVENTARIO"];
      instala.nombreequipo = val["NOMBRE_EQUIPO"];
      instala.ip = val["IP"];
      instala.lip = "false";
      instala.intoret = "I";
      instala.enviado = 0;
      instala.fechaenv = "";
      await insert(instala);
    });

    //Insertar filas en Unidades de Retiro en SQLite
    retiros.forEach((val) async {
      final retiro = Unidad();
      retiro.idar = val["idAr"];
      retiro.idunidad = val["idUnidad"];
      retiro.noserie = val["noSerie"];
      retiro.noinventario = val["noInventario"];
      retiro.nombreequipo = val["nombreEquipo"];
      retiro.ip = val["ip"];
      retiro.lip = "false";
      retiro.intoret = "R";
      retiro.enviado = 0;
      retiro.fechaenv = "";

      await Operaciones.insert(retiro);
    });

    //Insertar filas en Servicios en SQLite
    serviciosl.forEach((val) async {
      await insertServicio(val);
    });

    return serviciosl;
  }
}
