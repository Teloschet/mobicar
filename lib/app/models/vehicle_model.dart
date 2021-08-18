class VehicleModel {
  String? id;
  String? anoModelo;
  String? marca;
  String? name;
  String? veiculo;
  String? preco;
  String? combustivel;
  String? referencia;
  String? fipeCodigo;
  String? key;

  VehicleModel(
      {this.id,
      this.anoModelo,
      this.marca,
      this.name,
      this.veiculo,
      this.preco,
      this.combustivel,
      this.referencia,
      this.fipeCodigo,
      this.key});

  static VehicleModel fromJson({required Map<String, dynamic> json}) {
    return VehicleModel(
        id: json['id'],
        anoModelo: json['ano_modelo'],
        marca: json['marca'],
        name: json['name'],
        veiculo: json['veiculo'],
        preco: json['preco'],
        combustivel: json['combustivel'],
        referencia: json['referencia'],
        fipeCodigo: json['fipe_codigo'],
        key: json['key']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ano_modelo'] = this.anoModelo;
    data['marca'] = this.marca;
    data['name'] = this.name;
    data['veiculo'] = this.veiculo;
    data['preco'] = this.preco;
    data['combustivel'] = this.combustivel;
    data['referencia'] = this.referencia;
    data['fipe_codigo'] = this.fipeCodigo;
    data['key'] = this.key;
    return data;
  }

  @override
  String toString() {
    return 'VehicleModel(id: $id, anoModelo: $anoModelo, marca: $marca, name: $name, veiculo: $veiculo, preco: $preco, combustivel: $combustivel, referencia: $referencia, fipeCodigo: $fipeCodigo, key: $key)';
  }
}
