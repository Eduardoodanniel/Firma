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
