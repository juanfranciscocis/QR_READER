class ScanModelModel {

  int? id;
  String? tipo;
  String valor;

  ScanModelModel({
    this.id,
    this.tipo,
    required this.valor,

  }){
    if(this.valor.contains('http')){
      this.tipo = 'http';
    }else{
      this.tipo = 'geo';
    }
  }


  factory ScanModelModel.fromJson(Map<String, dynamic> json) => ScanModelModel(
    id: json["id"],
    tipo: json["tipo"],
    valor: json["valor"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tipo": tipo,
    "valor": valor,
  };
}
