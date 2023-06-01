class Updrs {
  bool op = false;
  List<Model>? model;

  Updrs({op, model});

  Updrs.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? servizioId;
  String? pazienteId;
  String? dataComp;
  String? c1a;
  String? c101;
  String? c102;
  String? c103;
  String? c104;
  String? c105;
  String? c106;
  String? c107;
  String? c108;
  String? c109;
  String? c110;
  String? c111;
  String? c112;
  String? c113;
  String? c201;
  String? c202;
  String? c203;
  String? c204;
  String? c205;
  String? c206;
  String? c207;
  String? c208;
  String? c209;
  String? c210;
  String? c211;
  String? c212;
  String? c213;
  String? c213a;
  String? c213b;
  String? c213c;
  String? c213c1;
  String? c301;
  String? c302;
  String? c303a;
  String? c303b;
  String? c303c;
  String? c303d;
  String? c303e;
  String? c304a;
  String? c304b;
  String? c305a;
  String? c305b;
  String? c306a;
  String? c306b;
  String? c307a;
  String? c307b;
  String? c308a;
  String? c308b;
  String? c309;
  String? c310;
  String? c311;
  String? c312;
  String? c313;
  String? c314;
  String? c315a;
  String? c315b;
  String? c316a;
  String? c316b;
  String? c317a;
  String? c317b;
  String? c317c;
  String? c317d;
  String? c317e;
  String? c318;
  String? c318a;
  String? c318b;
  String? c401;
  String? c402;
  String? c403;
  String? c404;
  String? c405;
  String? c406;
  String? totale1;
  String? totale2;
  String? totale3;
  String? totale4;
  String? note;
  String? utenteIns;
  String? utenteUpd;
  String? utenteDel;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? pdmeddt;
  String? dbsStatus;
  String? scalaHoenYahrId;
  String? dbsontm;
  String? dbsofftm;
  String? hrdbsoff;
  String? hrdbson;
  String? np4wdysknum;
  String? np4wdyskden;
  String? np4wdyskpct;
  String? np4offnum;
  String? np4offden;
  String? np4offpct;
  String? np4dystnnum;
  String? np4dystnden;
  String? np4dystnpct;

  Model(
      {id,
        servizioId,
        pazienteId,
        dataComp,
        c1a,
        c101,
        c102,
        c103,
        c104,
        c105,
        c106,
        c107,
        c108,
        c109,
        c110,
        c111,
        c112,
        c113,
        c201,
        c202,
        c203,
        c204,
        c205,
        c206,
        c207,
        c208,
        c209,
        c210,
        c211,
        c212,
        c213,
        c213a,
        c213b,
        c213c,
        c213c1,
        c301,
        c302,
        c303a,
        c303b,
        c303c,
        c303d,
        c303e,
        c304a,
        c304b,
        c305a,
        c305b,
        c306a,
        c306b,
        c307a,
        c307b,
        c308a,
        c308b,
        c309,
        c310,
        c311,
        c312,
        c313,
        c314,
        c315a,
        c315b,
        c316a,
        c316b,
        c317a,
        c317b,
        c317c,
        c317d,
        c317e,
        c318,
        c318a,
        c318b,
        c401,
        c402,
        c403,
        c404,
        c405,
        c406,
        totale1,
        totale2,
        totale3,
        totale4,
        note,
        utenteIns,
        utenteUpd,
        utenteDel,
        createdAt,
        updatedAt,
        deletedAt,
        pdmeddt,
        dbsStatus,
        scalaHoenYahrId,
        dbsontm,
        dbsofftm,
        hrdbsoff,
        hrdbson,
        np4wdysknum,
        np4wdyskden,
        np4wdyskpct,
        np4offnum,
        np4offden,
        np4offpct,
        np4dystnnum,
        np4dystnden,
        np4dystnpct});

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    servizioId = json['servizio_id'];
    pazienteId = json['paziente_id'];
    dataComp = json['data_comp'];
    c1a = json['c1a'];
    c101 = json['c101'];
    c102 = json['c102'];
    c103 = json['c103'];
    c104 = json['c104'];
    c105 = json['c105'];
    c106 = json['c106'];
    c107 = json['c107'];
    c108 = json['c108'];
    c109 = json['c109'];
    c110 = json['c110'];
    c111 = json['c111'];
    c112 = json['c112'];
    c113 = json['c113'];
    c201 = json['c201'];
    c202 = json['c202'];
    c203 = json['c203'];
    c204 = json['c204'];
    c205 = json['c205'];
    c206 = json['c206'];
    c207 = json['c207'];
    c208 = json['c208'];
    c209 = json['c209'];
    c210 = json['c210'];
    c211 = json['c211'];
    c212 = json['c212'];
    c213 = json['c213'];
    c213a = json['c213a'];
    c213b = json['c213b'];
    c213c = json['c213c'];
    c213c1 = json['c213c1'];
    c301 = json['c301'];
    c302 = json['c302'];
    c303a = json['c303a'];
    c303b = json['c303b'];
    c303c = json['c303c'];
    c303d = json['c303d'];
    c303e = json['c303e'];
    c304a = json['c304a'];
    c304b = json['c304b'];
    c305a = json['c305a'];
    c305b = json['c305b'];
    c306a = json['c306a'];
    c306b = json['c306b'];
    c307a = json['c307a'];
    c307b = json['c307b'];
    c308a = json['c308a'];
    c308b = json['c308b'];
    c309 = json['c309'];
    c310 = json['c310'];
    c311 = json['c311'];
    c312 = json['c312'];
    c313 = json['c313'];
    c314 = json['c314'];
    c315a = json['c315a'];
    c315b = json['c315b'];
    c316a = json['c316a'];
    c316b = json['c316b'];
    c317a = json['c317a'];
    c317b = json['c317b'];
    c317c = json['c317c'];
    c317d = json['c317d'];
    c317e = json['c317e'];
    c318 = json['c318'];
    c318a = json['c318a'];
    c318b = json['c318b'];
    c401 = json['c401'];
    c402 = json['c402'];
    c403 = json['c403'];
    c404 = json['c404'];
    c405 = json['c405'];
    c406 = json['c406'];
    totale1 = json['totale_1'];
    totale2 = json['totale_2'];
    totale3 = json['totale_3'];
    totale4 = json['totale_4'];
    note = json['note'];
    utenteIns = json['utente_ins'];
    utenteUpd = json['utente_upd'];
    utenteDel = json['utente_del'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    pdmeddt = json['pdmeddt'];
    dbsStatus = json['dbs_status'];
    scalaHoenYahrId = json['scala_hoen_yahr_id'];
    dbsontm = json['dbsontm'];
    dbsofftm = json['dbsofftm'];
    hrdbsoff = json['hrdbsoff'];
    hrdbson = json['hrdbson'];
    np4wdysknum = json['np4wdysknum'];
    np4wdyskden = json['np4wdyskden'];
    np4wdyskpct = json['np4wdyskpct'];
    np4offnum = json['np4offnum'];
    np4offden = json['np4offden'];
    np4offpct = json['np4offpct'];
    np4dystnnum = json['np4dystnnum'];
    np4dystnden = json['np4dystnden'];
    np4dystnpct = json['np4dystnpct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['servizio_id'] = servizioId;
    data['paziente_id'] = pazienteId;
    data['data_comp'] = dataComp;
    data['c1a'] = c1a;
    data['c101'] = c101;
    data['c102'] = c102;
    data['c103'] = c103;
    data['c104'] = c104;
    data['c105'] = c105;
    data['c106'] = c106;
    data['c107'] = c107;
    data['c108'] = c108;
    data['c109'] = c109;
    data['c110'] = c110;
    data['c111'] = c111;
    data['c112'] = c112;
    data['c113'] = c113;
    data['c201'] = c201;
    data['c202'] = c202;
    data['c203'] = c203;
    data['c204'] = c204;
    data['c205'] = c205;
    data['c206'] = c206;
    data['c207'] = c207;
    data['c208'] = c208;
    data['c209'] = c209;
    data['c210'] = c210;
    data['c211'] = c211;
    data['c212'] = c212;
    data['c213'] = c213;
    data['c213a'] = c213a;
    data['c213b'] = c213b;
    data['c213c'] = c213c;
    data['c213c1'] = c213c1;
    data['c301'] = c301;
    data['c302'] = c302;
    data['c303a'] = c303a;
    data['c303b'] = c303b;
    data['c303c'] = c303c;
    data['c303d'] = c303d;
    data['c303e'] = c303e;
    data['c304a'] = c304a;
    data['c304b'] = c304b;
    data['c305a'] = c305a;
    data['c305b'] = c305b;
    data['c306a'] = c306a;
    data['c306b'] = c306b;
    data['c307a'] = c307a;
    data['c307b'] = c307b;
    data['c308a'] = c308a;
    data['c308b'] = c308b;
    data['c309'] = c309;
    data['c310'] = c310;
    data['c311'] = c311;
    data['c312'] = c312;
    data['c313'] = c313;
    data['c314'] = c314;
    data['c315a'] = c315a;
    data['c315b'] = c315b;
    data['c316a'] = c316a;
    data['c316b'] = c316b;
    data['c317a'] = c317a;
    data['c317b'] = c317b;
    data['c317c'] = c317c;
    data['c317d'] = c317d;
    data['c317e'] = c317e;
    data['c318'] = c318;
    data['c318a'] = c318a;
    data['c318b'] = c318b;
    data['c401'] = c401;
    data['c402'] = c402;
    data['c403'] = c403;
    data['c404'] = c404;
    data['c405'] = c405;
    data['c406'] = c406;
    data['totale_1'] = totale1;
    data['totale_2'] = totale2;
    data['totale_3'] = totale3;
    data['totale_4'] = totale4;
    data['note'] = note;
    data['utente_ins'] = utenteIns;
    data['utente_upd'] = utenteUpd;
    data['utente_del'] = utenteDel;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['pdmeddt'] = pdmeddt;
    data['dbs_status'] = dbsStatus;
    data['scala_hoen_yahr_id'] = scalaHoenYahrId;
    data['dbsontm'] = dbsontm;
    data['dbsofftm'] = dbsofftm;
    data['hrdbsoff'] = hrdbsoff;
    data['hrdbson'] = hrdbson;
    data['np4wdysknum'] = np4wdysknum;
    data['np4wdyskden'] = np4wdyskden;
    data['np4wdyskpct'] = np4wdyskpct;
    data['np4offnum'] = np4offnum;
    data['np4offden'] = np4offden;
    data['np4offpct'] = np4offpct;
    data['np4dystnnum'] = np4dystnnum;
    data['np4dystnden'] = np4dystnden;
    data['np4dystnpct'] = np4dystnpct;
    return data;
  }
}
