
import 'package:resettami_app/Screens/Pazienti/Visite/Anamnesi/Updrs/Common.dart';

class sezioneParteTerza {
  late Common com = const Common();

  List<String> exSezMain = [
    'c1a',
    'scala_hoen_yahr_id',
    'c213a',
    'c213b',
    'c213c',
    'c213c1',
    'pdmeddt',
    'dbs_status',
    'dbsontm',
    'dbsofftm',
    'hrdbson',
    'hrdbsoff'
  ];

  Map sezMain = {
    'c1a': 'Fonte primaria d\'informazione',
    'scala_hoen_yahr_id': 'Stadio Hoehn & Yahr',
    'c213a': '3A Il paziente è in terapia?',
    'c213b': '3B Stato clinico del paziente',
    'c213c': '3C Il paziente è in Levodopa',
    'c213c1':
    '3D Se è così, indicare i minuti trascorsi dall\'ultima somministrazione',
    'c318a': '3E La discinesia è presente',
    'c318b': '3F I movimenti hanno interferito con la valutazione?',
    'pdmeddt': 'Data ultima somm.zione farmaco PD',
    'dbs_status': 'Stato DBS',
    'dbsontm': 'Ora di accensione DBS prima dell\'esame',
    'dbsofftm': 'Ora di spegnimento DBS prima dell\'esame',
    'hrdbson': 'Tempo tra accensione DBS ed esame',
    'hrdbsoff': 'Tempo tra spegnimento DBS ed esame',
  };

  Map sezEloquio = {
    'c301': '3.1 Eloquio',
    'c302': '3.2 Mimica facciale',
  };

  Map sezRegidita = {
    'c303a': '3.3A Rigidità del collo',
    'c303b': '3.3B Rigidità del braccio destro',
    'c303c': '3.3C Rigidità del braccio sinistro',
    'c303d': '3.3D Rigidità della gamba destra',
    'c303e': '3.3E Rigidità della gamba sinistra',
  };

  Map sezMovRipMano = {
    'c304a': '3.4A Movimenti ripetuti dita mano destra',
    'c304b': '3.4B Movimenti ripetuti dita mano sinistra',
  };

  Map sezMovMano = {
    'c305a': '3.5A Movimenti della mano destra',
    'c305b': '3.5B Movimenti della mano sinistra',
  };

  Map sezPronoSup = {
    'c306a': '3.6A Movimenti prono-supinazione mano destra',
    'c306b': '3.6B Movimenti prono-supinazione mano sinistra',
  };

  Map sezMovRipPiede = {
    'c307a': '3.7A Movimenti ripetuti dita piede destro',
    'c307b': '3.7B Movimenti ripetuti dita piede sinistro',
  };

  Map sezAgGamba = {
    'c308a': '3.8A Agilità gamba destra',
    'c308b': '3.8B Agilità gamba sinistra',
  };

  Map sezAltro = {
    'c309': '3.9 Alzarsi dalla sedia',
    'c310': '3.10 Marcia',
    'c311': '3.11 Blocco della marcia',
    'c312': '3.12 Stabilità posturale',
    'c313': '3.13 Postura',
    'c314': '3.14 Spontaneità dei movimenti ( bradicinesia )',
  };

  Map sezTremPostMani = {
    'c315a': '3.15A Tremore posturale - mano destra',
    'c315b': '3.15B Tremore posturale - mano sinistra',
  };

  Map sezTremCineticoMani = {
    'c316a': '3.16A Tremore cinetico - mano destra',
    'c316b': '3.16B Tremore cinetico - mano sinistra',
  };

  Map sezAmpTremRip = {
    'c317a': '3.17A Ampiezza del tremore a riposo - braccio destro',
    'c317b': '3.17B Ampiezza del tremore a riposo - braccio sinistro',
    'c317c': '3.17C Ampiezza del tremore a riposo - gamba destra',
    'c317d': '3.17D Ampiezza del tremore a riposo - gamba sinistra',
    'c317e': '3.17E Ampiezza del tremore a riposo - labbra/mandibola',
  };

  Map sezContTremRip = {
    'c318': '3.18 Continuità del tremore a riposo',
  };

  Map sezioni = {
    "1": "Info Principali",
    "2": "Eloquio/Mimica facciale",
    "3": "Rigidità",
    "4": "3.4 Movimenti ripetuti dita mano",
    "5": "3.5 Movimenti della mano",
    "6": "3.6 Movimenti prono-supinazione",
    "7": "3.7 Movimenti ripetuti dita piede",
    "8": "3.8 Agilità gamba",
    "9": "Altro",
    "10": "3.15 Tremore posturale delle mani",
    "11": "3.16 Tremore cinetico delle mani",
    "12": "3.17 Ampiezza del tremore a riposo",
    "13": "3.18 Continuità del tremore a riposo",
  };

  Map getData(int index){
    Map ret = {};
    switch(index){
      case 0:
        ret = sezMain;
        break;
      case 1:
        ret = sezEloquio;
        break;
      case 2:
        ret = sezRegidita;
        break;
      case 3:
        ret = sezMovRipMano;
        break;
      case 4:
        ret = sezMovMano;
        break;
      case 5:
        ret = sezPronoSup;
        break;
      case 6:
        ret = sezMovRipPiede;
        break;
      case 7:
        ret = sezAgGamba;
        break;
      case 8:
        ret = sezAltro;
        break;
      case 9:
        ret = sezTremPostMani;
        break;
      case 10:
        ret = sezTremCineticoMani;
        break;
      case 11:
        ret = sezAmpTremRip;
        break;
      case 12:
        ret = sezContTremRip;
        break;
    }

    return ret;
  }


  
}

