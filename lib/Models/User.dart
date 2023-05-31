import 'dart:convert';

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
  String? role_id;
  String? strutturaId;
  String? nome;
  String? cognome;
  String? operatore;
  String? email;
  String? ruolo;
  String? struttura;

  User(
      {this.id,
        this.strutturaId,
        this.role_id,
        this.nome,
        this.cognome,
        this.operatore,
        this.email,
        this.ruolo,
        this.struttura});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role_id = json['role_id'];
    strutturaId = json['struttura_id'];
    nome = json['nome'];
    cognome = json['cognome'];
    operatore = json['operatore'];
    email = json['email'];
    ruolo = json['ruolo'];
    struttura = json['struttura'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role_id'] = role_id;
    data['struttura_id'] = strutturaId;
    data['nome'] = nome;
    data['cognome'] = cognome;
    data['operatore'] = operatore;
    data['email'] = email;
    data['ruolo'] = ruolo;
    data['struttura'] = struttura;
    return data;
  }

  static Map<String, dynamic> toMap(User model) =>
      <String, dynamic> {
        'id': model.id,
        'role_id': model.role_id,
        'struttura_id': model.strutturaId,
        'nome': model.nome,
        'cognome': model.cognome,
        'operatore': model.operatore,
        'email': model.email,
        'ruolo': model.ruolo,
        'struttura': model.struttura,
      };

  static String serialize(User model) =>
      json.encode(User.toMap(model));

  static User deserialize(String json) =>
      User.fromJson(jsonDecode(json));


}
