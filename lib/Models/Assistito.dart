class Assistito {
  bool op = false;
  List<AssistitoModel>? model;
  String? msg;
  int? code;

  Assistito({required this.op, this.model, this.msg, this.code});

  Assistito.fromJson(Map<String, dynamic> json) {
    op = json['op'];
    if (json['model'] != null) {
      model = <AssistitoModel>[];
      json['model'].forEach((v) {
        model!.add(AssistitoModel.fromJson(v));
      });
    }
    msg = json['msg'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['op'] = op;
    if (model != null) {
      data['model'] = model!.map((v) => v.toJson()).toList();
    }
    data['msg'] = msg;
    data['code'] = code;
    return data;
  }
}

class AssistitoModel {
  String? id;
  String? assistitoId;
  String? codiceFiscale;
  String? nome;
  String? cognome;
  String? dataNascita;
  String? struttura;
  String? createdAt;
  String? operatore;

  AssistitoModel(
      {this.id,
        this.assistitoId,
        this.codiceFiscale,
        this.nome,
        this.cognome,
        this.dataNascita,
        this.struttura,
        this.createdAt,
        this.operatore});

  AssistitoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assistitoId = json['assistito_id'];
    codiceFiscale = json['codice_fiscale'];
    nome = json['nome'];
    cognome = json['cognome'];
    dataNascita = json['data_nascita'];
    struttura = json['struttura'];
    createdAt = json['created_at'];
    operatore = json['operatore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['assistito_id'] = this.assistitoId;
    data['codice_fiscale'] = this.codiceFiscale;
    data['nome'] = this.nome;
    data['cognome'] = this.cognome;
    data['data_nascita'] = this.dataNascita;
    data['struttura'] = this.struttura;
    data['created_at'] = this.createdAt;
    data['operatore'] = this.operatore;
    return data;
  }
}
