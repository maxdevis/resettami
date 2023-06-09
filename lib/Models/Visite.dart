class Visite {
  bool op = false;
  List<Model>? model;

  Visite({op, model});

  Visite.fromJson(Map<String, dynamic> json) {
    op = json['op'];
    if (json['model'] != null) {
      model = <Model>[];
      json['model'].forEach((v) {
        model!.add(Model.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['op'] = op;
    if (model != null) {
      data['model'] = model!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Model {
  int id = 0;
  int pazienteId = 0;
  String? strutturaId;
  String? operatoreId;
  String? idLingua;
  String? statoId;
  String? medico;
  String? dataApertura;
  String? dataChiusura;
  String? struttura;
  String? fCondiviso;
  String? evento;

  Model(
      {id,
        pazienteId,
        strutturaId,
        operatoreId,
        idLingua,
        statoId,
        medico,
        dataApertura,
        dataChiusura,
        struttura,
        fCondiviso,
        evento
        });

  Model.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    pazienteId = int.parse(json['paziente_id']);
    strutturaId = json['struttura_id'];
    operatoreId = json['operatore_id'];
    idLingua = json['id_lingua'];
    statoId = json['stato_id'];
    medico = json['medico'];
    dataApertura = json['data_apertura'];
    dataChiusura = json['data_chiusura'];
    struttura = json['struttura'];
    fCondiviso = json['f_condiviso'];
    evento = json['evento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['paziente_id'] = pazienteId;
    data['struttura_id'] = strutturaId;
    data['operatore_id'] = operatoreId;
    data['id_lingua'] = idLingua;
    data['stato_id'] = statoId;
    data['medico'] = medico;
    data['data_apertura'] = dataApertura;
    data['data_chiusura'] = dataChiusura;
    data['struttura'] = struttura;
    data['f_condiviso'] = fCondiviso;
    data['evento'] = evento;
    return data;
  }
}

