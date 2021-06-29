import 'package:firmaservicios/models/servicios_model.dart';
import 'package:firmaservicios/preferencias_usuario/preferencias_usuario.dart';
import 'package:flutter/material.dart';
import 'package:firmaservicios/bd/operaciones.dart';
//import 'package:firmaservicios/Pages/pdf_screen.dart';
import 'package:firmaservicios/Pages/pdf_screen.dart';

class ServiciosPage extends StatefulWidget {
  static const String ROUTE = "/";

  @override
  _ServiciosPageState createState() => _ServiciosPageState();
}

class _ServiciosPageState extends State<ServiciosPage> {
  @override
  Widget build(BuildContext context) {
    return MyList();
  }
}

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

// class MyItem {
//   MyItem({this.isExpanded: false, this.header, this.body});
//   bool isExpanded;
//   final String header;
//   final String body;
// }

class _MyListState extends State<MyList> {
  // List<MyItem> _items = <MyItem>[
  //   MyItem(header: "Header 1", body: "Body 1"),
  //   MyItem(header: "Header 2", body: "Body 2"),
  //   MyItem(header: "Header 3", body: "Body 3"),
  // ];

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

  List<Servicio> servicios = [];
  List<ServicioL> serviciosL = [];
  final _prefs = new PreferenciasUsuario();

  @override
  void initState() {
    // TODO: implement initState
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // return ListView(
    //   children: [
    //     ExpansionPanelList(
    //       expansionCallback: (int index, bool isExpanded) {
    //         setState(() {
    //           _items[index].isExpanded = !_items[index].isExpanded;
    //         });
    //       },
    //       children: _items.map((MyItem item) {
    //         return ExpansionPanel(
    //             headerBuilder: (BuildContext context, bool isExpanded) {
    //               return Text(item.header);
    //             },
    //             isExpanded: item.isExpanded,
    //             body: Container(
    //               child: Text(item.body),
    //             ));
    //       }),
    //     )
    //   ],
    // );

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Servicios"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  cargaTablas();
                },
                child: Icon(
                  Icons.toggle_off,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Container(
          child: ListView.builder(
        shrinkWrap: true,
        itemCount: servicios.length,
        itemBuilder: (_, i) => createItem(i),
      )),
      //drawer: _drawer(context),
    );
  }

  _loadData() async {
    // List<Unidad> auxUnidades = await Operaciones.unidades();
    List<Servicio> auxServicios = await Operaciones.servicios();
    List<ServicioL> auxServiciosL = await Operaciones.serviciosL(auxServicios);
    setState(() {
      servicios = auxServicios;
      serviciosL = auxServiciosL;
      serviciosL.forEach((serv) {
        serv.instalacionesl.forEach((uni) {
          print(uni.noserie);
        });
      });
    });
  }

  createUnidad(int j, int i) {
    //print(serviciosL[i].instalacionesl[j]);
    return ListTile(
      title: Text(serviciosL[i].retirosl[j].noserie),
    );
  }

  createItem(int i) {
    final size = MediaQuery.of(context).size;
    String retirosl = servicios[i].retiros == null ? "" : servicios[i].retiros;
    String instalacionesl =
        servicios[i].instalaciones == null ? "" : servicios[i].instalaciones;
    return Dismissible(
      key: Key(i.toString()),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.only(left: 5),
        margin: EdgeInsets.only(bottom: 50),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            )),
      ),
      onDismissed: (direction) {
        //Operaciones.delete(servicios[i]);
      },
      child: ListTile(
        title: Container(
          margin: EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0),
            ],
            border: Border.all(
              width: 1,
              color: Colors.blueGrey[600],
            ),
          ),
          child: Column(
            children: [
              texto("AR: ", servicios[i].noAr, Colors.blueAccent[900], 10.0),
              texto("No. Afiliación: ", servicios[i].noAfiliacion, Colors.black,
                  30.0),
              texto("Negocio: ", servicios[i].descNegocio, Colors.black, 30.0),
              texto("Garantía: ", servicios[i].fecGarantia, Colors.black, 30.0),
              texto("Dir: ", servicios[i].direccion, Colors.black, 30.0),
              texto("Indicaciones: ", servicios[i].sintoma, Colors.black, 30.0),
              //filaBtn(servicios[i].retiros == null ? "" : servicios[i].retiros, servicios[i].instalaciones == null ? "" : servicios[i].instalaciones),
              SizedBox(
                height: 18,
              ),
              RaisedButton(
                color: Colors.blue[900],
                onPressed: servicios[i].firma == null
                    ? () => firmar(servicios[i])
                    : null,
                child: servicios[i].firma == null
                    //child: servicios1[i].firma1 == null
                    ? Text(
                        "Firmar",
                        style: TextStyle(color: Colors.white),
                      )
                    : Text(
                        "Firmado",
                        style: TextStyle(color: Colors.white),
                      ),
              ),

              RaisedButton(
                color: Colors.red[900],
                onPressed: servicios[i].firma == null
                    ? () => pdfa(servicios[i])
                    : null,
                child: servicios[i].firma == null
                    //child: servicios1[i].firma1 == null
                    ? Text(
                        "Crear PDF",
                        style: TextStyle(color: Colors.white),
                      )
                    : Text(
                        "Crear PDF",
                        style: TextStyle(color: Colors.white),
                      ),
              ),

              SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  firmar(Servicio servicio) {
    _prefs.idAr_pref = servicio.noAr;
    Navigator.pushNamed(context, 'firma', arguments: servicio)
        .then(_loadData());
  }

  pdfa(Servicio servicio) {
    _prefs.idAr_pref = servicio.noAr;
    Navigator.pushNamed(context, 'pdfa');
  }

  Widget filaBtn(String retiros, String instalaciones) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blueGrey[600],
              onPrimary: Colors.white, // foreground
            ),
            onPressed: () {},
            child: SizedBox(
                width: (size.width / 3.5),
                child: Center(child: Text('Retiros' + retiros))),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blueGrey[600],
              onPrimary: Colors.white, // foreground
            ),
            onPressed: () {},
            child: SizedBox(
                width: (size.width / 3.5),
                child: Center(child: Text('Instalaciones' + instalaciones))),
          ),
        ],
      ),
    );
  }

  Widget texto(String subtit, String contenido, Color color, double pl) {
    return Padding(
      padding: EdgeInsets.fromLTRB(pl, 10, 10, 0),
      child: Row(
        children: [
          Text(
            subtit,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
          Text(
            contenido,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }

  Widget _miAppBar(BuildContext context) {
    return AppBar(
        title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Servicios Asignados a:",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              _prefs.nombre,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        Image(
          image: _prefs.idTipoUsuario != null && _prefs.idTipoUsuario == "1"
              ? AssetImage('assets/CitiBlanco.png')
              : AssetImage('assets/citi_azul.png'),
          height: 40.0,
          width: 40.0,
        ),
      ],
    ));
  }

  Drawer _drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(_prefs.nombre),
            accountEmail: Text("correo@correo.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                _prefs.nombre.toString().substring(0, 1).toUpperCase(),
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            title: Text("Borrar todas las tablas"),
            leading: Icon(Icons.phonelink_erase),
            onTap: () {
              listarServicios();
            },
          ),
          ListTile(
            title: Text("Cargar Servicios y Unidades"),
            leading: Icon(Icons.file_upload),
            onTap: () {
              cargaTablas();
            },
          ),
          ListTile(
            title: Text("Generar PDF"),
            leading: Icon(Icons.picture_as_pdf),
            onTap: () {
              // Navigator.pop(context);
              // Navigator.pushNamed(context, 'pdf');
            },
          ),
          ListTile(
            title: Text("Cerrar Sesión"),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              _prefs.idUsuario = "";

              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }

  listarServicios() async {
    List<Servicio> servl = await Operaciones.servicios();
    servl.forEach((val) {
      print("Let: " + val.noAfiliacion);
    });
  }

  Future cargaTablas() async {
    Navigator.pop(context);
    progressSnackBar("Cargando Servicios");
    final bool a = await Operaciones.eliminarBD();
    List<Servicio> res = await Operaciones.cargarServiciosJson();
    await _loadData();
    mostrarSnackBar("Servicios Cargandos");
  }
}
