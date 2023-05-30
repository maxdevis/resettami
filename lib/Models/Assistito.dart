class Assistito {
  int _id = 0;
  int _assistitoId = 0;
  String _codiceFiscale = "";
  String _nome = "";
  String _cognome = "";
  String _dataNascita = "";
  String _struttura = "";
  String _operatore = "";

  Assistito({
    required int id,
    required int assistitoId,
    required String codiceFiscale,
    required String nome,
    required String cognome,
    required String dataNascita,
    required String struttura,
    required String operatore,
  }) {
    _id = id;
    _assistitoId = assistitoId;
    _codiceFiscale = codiceFiscale;
    _nome = nome;
    _cognome = cognome;
    _dataNascita = dataNascita;
    _struttura = struttura;
    _operatore = operatore;
  }

  int get id => _id;

  set id(int id) => _id = id;

  int get assistitoId => _assistitoId;

  set assistitoId(int assistitoId) => _assistitoId = assistitoId;

  String get codiceFiscale => _codiceFiscale;

  set codiceFiscale(String codiceFiscale) => _codiceFiscale = codiceFiscale;

  String get nome => _nome;

  set nome(String nome) => _nome = nome;

  String get cognome => _cognome;

  set cognome(String cognome) => _cognome = cognome;

  String get dataNascita => _dataNascita;

  set dataNascita(String dataNascita) => _dataNascita = dataNascita;

  String get struttura => _struttura;

  set struttura(String struttura) => _struttura = struttura;

  String get operatore => _operatore;

  set operatore(String operatore) => _operatore = operatore;

  Assistito.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _assistitoId = json['assistito_id'];
    _codiceFiscale = json['codice_fiscale'];
    _nome = json['nome'];
    _cognome = json['cognome'];
    _dataNascita = json['data_nascita'];
    _struttura = json['struttura'];
    _operatore = json['operatore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['assistito_id'] = _assistitoId;
    data['codice_fiscale'] = _codiceFiscale;
    data['nome'] = _nome;
    data['cognome'] = _cognome;
    data['data_nascita'] = _dataNascita;
    data['struttura'] = _struttura;
    data['operatore'] = _operatore;
    return data;
  }
}
