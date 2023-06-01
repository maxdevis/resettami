class Paziente {
  bool op = false;
  String? msg;
  List<Model>? model;

  Paziente({op, msg, model});

  Paziente.fromJson(Map<String, dynamic> json) {
    op = json['op'];
    msg = json['msg'];
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
    data['msg'] = msg;
    if (model != null) {
      data['model'] = model!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Model {
  String? id;
  String? strutturaId;
  String? sessoId;
  String? operatoreId;
  String? codiceRegione;
  String? codiceProvincia;
  String? codiceComune;
  String? regioneNascita;
  String? provNascita;
  String? comuneNascita;
  String? sesso;
  String? nome;
  String? cognome;
  String? codiceFiscale;
  String? dataNascita;
  String? stato;
  String? struttura;
  String? fCondiviso;
  String? telefono;
  String? cellulare;
  String? indResidenza;
  String? comuneRes;
  String? provRes;
  String? visitaOpen;

  Model(
      {id,
        strutturaId,
        sessoId,
        operatoreId,
        codiceRegione,
        codiceProvincia,
        codiceComune,
        regioneNascita,
        provNascita,
        comuneNascita,
        sesso,
        nome,
        cognome,
        codiceFiscale,
        dataNascita,
        stato,
        struttura,
        fCondiviso,
        telefono,
        cellulare,
        indResidenza,
        comuneRes,
        provRes,
        visitaOpen});

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    strutturaId = json['struttura_id'];
    sessoId = json['sesso_id'];
    operatoreId = json['operatore_id'];
    codiceRegione = json['codice_regione'];
    codiceProvincia = json['codice_provincia'];
    codiceComune = json['codice_comune'];
    regioneNascita = json['regione_nascita'];
    provNascita = json['prov_nascita'];
    comuneNascita = json['comune_nascita'];
    sesso = json['sesso'];
    nome = json['nome'];
    cognome = json['cognome'];
    codiceFiscale = json['codice_fiscale'];
    dataNascita = json['data_nascita'];
    stato = json['stato'];
    struttura = json['struttura'];
    fCondiviso = json['f_condiviso'];
    telefono = json['telefono'];
    cellulare = json['cellulare'];
    indResidenza = json['ind_residenza'];
    comuneRes = json['comune_res'];
    provRes = json['prov_res'];
    visitaOpen = json['visita_open'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['struttura_id'] = strutturaId;
    data['sesso_id'] = sessoId;
    data['operatore_id'] = operatoreId;
    data['codice_regione'] = codiceRegione;
    data['codice_provincia'] = codiceProvincia;
    data['codice_comune'] = codiceComune;
    data['regione_nascita'] = regioneNascita;
    data['prov_nascita'] = provNascita;
    data['comune_nascita'] = comuneNascita;
    data['sesso'] = sesso;
    data['nome'] = nome;
    data['cognome'] = cognome;
    data['codice_fiscale'] = codiceFiscale;
    data['data_nascita'] = dataNascita;
    data['stato'] = stato;
    data['struttura'] = struttura;
    data['f_condiviso'] = fCondiviso;
    data['telefono'] = telefono;
    data['cellulare'] = cellulare;
    data['ind_residenza'] = indResidenza;
    data['comune_res'] = comuneRes;
    data['prov_res'] = provRes;
    data['visita_open'] = visitaOpen;
    return data;
  }
}
