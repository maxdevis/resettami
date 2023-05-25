class UserModel {
  bool op = false;
  User? user;
  String? token;
  String? type;

  UserModel({required this.op, this.user, this.token, this.type});

  UserModel.fromJson(Map<String, dynamic> json) {
    op = json['op'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['op'] = op;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    data['type'] = type;
    return data;
  }
}

class User {
  String? id;
  String? userId;
  String? strutturaId;
  String? nome;
  String? cognome;
  String? username;
  String? utente;
  String? email;
  String? ruolo;
  String? struttura;

  User(
      {this.id,
        this.userId,
        this.strutturaId,
        this.nome,
        this.cognome,
        this.username,
        this.utente,
        this.email,
        this.ruolo,
        this.struttura});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    strutturaId = json['struttura_id'];
    nome = json['nome'];
    cognome = json['cognome'];
    username = json['username'];
    utente = json['utente'];
    email = json['email'];
    ruolo = json['ruolo'];
    struttura = json['struttura'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['struttura_id'] = strutturaId;
    data['nome'] = nome;
    data['cognome'] = cognome;
    data['username'] = username;
    data['utente'] = utente;
    data['email'] = email;
    data['ruolo'] = ruolo;
    data['struttura'] = struttura;
    return data;
  }
}
