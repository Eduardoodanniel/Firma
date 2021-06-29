class Servicio {
  int id;
  int idAr;
  int idCarga;
  int idCliente;
  String noAr;
  String concepto;
  String descCorta;
  String sintoma;
  String bitacora;
  String noAfiliacion;
  String telefono;
  String descNegocio;
  String direccion;
  String colonia;
  String poblacion;
  String estado;
  String cp;
  String notasRemedy;
  String equipo;
  String descEquipo;
  int segmento;
  String fecInicio;
  String fecConvenio;
  int tipoServicio;
  int tipoFalla;
  int idSegmento;
  int idServicio;
  int idFalla;
  int horasGarantia;
  int idNegocio;
  int idEstado;
  int idRegion;
  int idZona;
  int idTipoPlaza;
  int idTecnico;
  int isTecnicoForaneo;
  int isDuplicada;
  int isIngresoManual;
  int isActualizacion;
  int isInstalacion;
  int isSustitucion;
  int isRetiro;
  String fecAlta;
  String fecAtencion;
  String fecGarantia;
  String retiros;
  String instalaciones;
  // List retirosl;
  // List instalacionesl;
  int atendida;
  String fecha;
  String firma;

  Servicio({
    this.id,
    this.idAr,
    this.idCarga,
    this.idCliente,
    this.noAr,
    this.concepto,
    this.descCorta,
    this.sintoma,
    this.bitacora,
    this.noAfiliacion,
    this.telefono,
    this.descNegocio,
    this.direccion,
    this.colonia,
    this.poblacion,
    this.estado,
    this.cp,
    this.notasRemedy,
    this.equipo,
    this.descEquipo,
    this.segmento,
    this.fecInicio,
    this.fecConvenio,
    this.tipoServicio,
    this.tipoFalla,
    this.idSegmento,
    this.idServicio,
    this.idFalla,
    this.horasGarantia,
    this.idNegocio,
    this.idEstado,
    this.idRegion,
    this.idZona,
    this.idTipoPlaza,
    this.idTecnico,
    this.isTecnicoForaneo,
    this.isDuplicada,
    this.isIngresoManual,
    this.isActualizacion,
    this.isInstalacion,
    this.isSustitucion,
    this.isRetiro,
    this.fecAlta,
    this.fecAtencion,
    this.fecGarantia,
    this.retiros,
    this.instalaciones,
    // this.retirosl,
    // this.instalacionesl,
    this.atendida,
    this.fecha,
    this.firma,
  });

  Servicio.empty();

  factory Servicio.fromJson(Map<String, dynamic> json) => Servicio(
        id: json["id"],
        idAr: json["idAr"],
        idCarga: json["idCarga"],
        idCliente: json["idCliente"],
        noAr: json["noAr"],
        concepto: json["concepto"],
        descCorta: json["descCorta"],
        sintoma: json["sintoma"],
        bitacora: json["bitacora"],
        noAfiliacion: json["noAfiliacion"],
        telefono: json["telefono"],
        descNegocio: json["descNegocio"],
        direccion: json["direccion"],
        colonia: json["colonia"],
        poblacion: json["poblacion"],
        estado: json["estado"],
        cp: json["cp"],
        notasRemedy: json["notasRemedy"],
        equipo: json["equipo"],
        descEquipo: json["descEquipo"],
        segmento: json["segmento"],
        fecInicio: json["fecInicio"],
        fecConvenio: json["fecConvenio"],
        tipoServicio: json["tipoServicio"],
        tipoFalla: json["tipoFalla"],
        idSegmento: json["idSegmento"],
        idServicio: json["idServicio"],
        idFalla: json["idFalla"],
        horasGarantia: json["horasGarantia"],
        idNegocio: json["idNegocio"],
        idEstado: json["idEstado"],
        idRegion: json["idRegion"],
        idZona: json["idZona"],
        idTipoPlaza: json["idTipoPlaza"],
        idTecnico: json["idTecnico"],
        isTecnicoForaneo: json["isTecnicoForaneo"],
        isDuplicada: json["isDuplicada"],
        isIngresoManual: json["isIngresoManual"],
        isActualizacion: json["isActualizacion"],
        isInstalacion: json["isInstalacion"],
        isSustitucion: json["isSustitucion"],
        isRetiro: json["isRetiro"],
        fecAlta: json["fecAlta"],
        fecAtencion: json["fecAtencion"],
        fecGarantia: json["fecGarantia"],
        retiros: json["retiros"],
        instalaciones: json["instalaciones"],
        // retirosl: json["retirosl"],
        // instalacionesl: json["instalacionesl"],
        atendida: json["atendida"],
        fecha: json["fecha"],
        firma: json["firma"],
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "idAr": idAr,
      "idCarga": idCarga,
      "idCliente": idCliente,
      "noAr": noAr,
      "concepto": concepto,
      "descCorta": descCorta,
      "sintoma": sintoma,
      "bitacora": bitacora,
      "noAfiliacion": noAfiliacion,
      "telefono": telefono,
      "descNegocio": descNegocio,
      "direccion": direccion,
      "colonia": colonia,
      "poblacion": poblacion,
      "estado": estado,
      "cp": cp,
      "notasRemedy": notasRemedy,
      "equipo": equipo,
      "descEquipo": descEquipo,
      "segmento": segmento,
      "fecInicio": fecInicio,
      "fecConvenio": fecConvenio,
      "tipoServicio": tipoServicio,
      "tipoFalla": tipoFalla,
      "idSegmento": idSegmento,
      "idServicio": idServicio,
      "idFalla": idFalla,
      "horasGarantia": horasGarantia,
      "idNegocio": idNegocio,
      "idEstado": idEstado,
      "idRegion": idRegion,
      "idZona": idZona,
      "idTipoPlaza": idTipoPlaza,
      "idTecnico": idTecnico,
      "isTecnicoForaneo": isTecnicoForaneo,
      "isDuplicada": isDuplicada,
      "isIngresoManual": isIngresoManual,
      "isActualizacion": isActualizacion,
      "isInstalacion": isInstalacion,
      "isSustitucion": isSustitucion,
      "isRetiro": isRetiro,
      "fecAlta": fecAlta,
      "fecAtencion": fecAtencion,
      "fecGarantia": fecGarantia,
      "retiros": retiros,
      "instalaciones": instalaciones,
      // "retirosl": retirosl,
      // "instalacionesl": instalacionesl,
      "atendida": atendida,
      "fecha": fecha,
      "firma": firma,
    };
  }
}

class ServicioL {
  List retirosl;
  List instalacionesl;

  ServicioL({
    this.retirosl,
    this.instalacionesl,
  });

  ServicioL.empty();

  factory ServicioL.fromJson(Map<String, dynamic> json) => ServicioL(
        retirosl: json["retirosl"],
        instalacionesl: json["instalacionesl"],
      );

  Map<String, dynamic> toJson() {
    return {
      "retirosl": retirosl,
      "instalacionesl": instalacionesl,
    };
  }
}

class Unidad {
  int id;
  int idar;
  String noar;
  int idunidad;
  String noserie;
  String lnoserie;
  String noinventario;
  String lnoinventario;
  String nombreequipo;
  String lnombreequipo;
  String ip;
  String lip;
  String monitor;
  String teclado;
  String mouse;
  String fechacapt;
  int enviado;
  String fechaenv;
  String intoret;

  Unidad({
    this.id,
    this.idar,
    this.noar,
    this.idunidad,
    this.noserie,
    this.lnoserie,
    this.noinventario,
    this.lnoinventario,
    this.nombreequipo,
    this.lnombreequipo,
    this.ip,
    this.lip,
    this.monitor,
    this.teclado,
    this.mouse,
    this.fechacapt,
    this.enviado,
    this.fechaenv,
    this.intoret,
  });

  Unidad.empty();
  factory Unidad.fromJson(Map<String, dynamic> json) => Unidad(
        id: json["id"],
        idar: json["idar"],
        noar: json["noar"],
        idunidad: json["idunidad"],
        noserie: json["noserie"],
        lnoserie: json["lnoserie"],
        noinventario: json["noinventario"],
        lnoinventario: json["lnoinventario"],
        nombreequipo: json["nombreequipo"],
        lnombreequipo: json["lnombreequipo"],
        ip: json["ip"],
        lip: json["lip"],
        monitor: json["monitor"],
        teclado: json["teclado"],
        mouse: json["mouse"],
        fechacapt: json["fechacapt"],
        enviado: json["enviado"],
        fechaenv: json["fechaenv"],
        intoret: json["intoret"],
      );

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "idar": idar,
      "noar": noar,
      "idUnidad": idunidad,
      "noserie": noserie,
      "lnoSerie": lnoserie,
      "noinventario": noinventario,
      "lnoinventario": lnoinventario,
      "nombreequipo": nombreequipo,
      "lnombreequipo": lnombreequipo,
      "ip": ip,
      "lip": lip,
      "monitor": monitor,
      "teclado": teclado,
      "mouse": mouse,
      "fechacapt": fechacapt,
      "enviado": enviado,
      "fechaenv": fechaenv,
      "intoret": intoret,
    };
  }
}
