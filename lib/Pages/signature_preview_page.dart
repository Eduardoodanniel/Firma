import 'dart:typed_data';

import 'package:firmaservicios/bd/operaciones.dart';
import 'package:firmaservicios/models/servicios_model.dart';
import 'package:firmaservicios/preferencias_usuario/preferencias_usuario.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firmaservicios/utils.dart';

class SignaturePreviewPage extends StatefulWidget {
  final Uint8List signature;
  final Servicio servicio;

  const SignaturePreviewPage({
    Key key,
    @required this.signature,
    @required this.servicio,
  }) : super(key: key);

  @override
  _SignaturePreviewPageState createState() => _SignaturePreviewPageState();
}

class _SignaturePreviewPageState extends State<SignaturePreviewPage> {
  final _prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: CloseButton(),
          title: Text('Guardar firma'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.done),
              onPressed: () => storeSignature(context),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: Center(
          child: Image.memory(widget.signature, width: double.infinity),
        ),
      );

  Future storeSignature(BuildContext context) async {
    final status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    //final time = DateTime.now().toIso8601String().replaceAll('.', ':');
    final name = 'firma' + _prefs.idAr_pref.trim() + '.png';
    widget.servicio.firma = name;
    Operaciones.updateServicios(widget.servicio);
    final result =
        await ImageGallerySaver.saveImage(widget.signature, name: name);
    final isSuccess = result['isSuccess'];

    if (isSuccess) {
      //Navigator.pop(context);
      Navigator.pushReplacementNamed(context, 'servicios');

      Utils.showSnackBar(
        context,
        text: 'Guardar la firma en Galería',
        color: Colors.green,
      );
    } else {
      Utils.showSnackBar(
        context,
        text: 'Error al guardar la firma',
        color: Colors.red,
      );
    }
  }
}
