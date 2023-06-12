class sezioneParteQuarta {
  late List<String> exSez1 = ['np4wdysknum', 'np4wdyskden', 'np4wdyskpct'];
  late List<String> exSez3 = ['np4offnum', 'np4offden', 'np4offpct'];
  late List<String> exSez6 = ['np4dystnnum', 'np4dystnden', 'np4dystnpct'];

  late Map sezioni = {
    "1": "Sezione 4.1",
    "2": "Sezione 4.2",
    "3": "Sezione 4.3",
    "4": "Sezione 4.4",
    "5": "Sezione 4.5",
    "6": "Sezione 4.6",
  };

  late Map sez1 = {
    'c401': 'Tempo trascorso con discinesie',
    'np4wdysknum': 'Numeratore (Numero ore discinesia)',
    'np4wdyskden': 'Denominatore (Numero ore sveglio)',
    'np4wdyskpct': '% Punteggio',
  };

  late Map sez2 = {
    'c402': 'Impatto funzionale delle discinesie',
  };

  late Map sez3 = {
    'c403': 'Tempo trascorso in fase OFF',
    'np4offnum': 'Numeratore (numero ore in stato OFF)',
    'np4offden': 'Denominatore (Numero ore sveglio)',
    'np4offpct': 'Camminare ed equilibrio',
  };

  late Map sez4 = {
    'c404': 'Impatto funzionale delle fluttuazioni motorie',
  };

  late Map sez5 = {
    'c405': 'Complessità delle fluttuazioni motorie',
  };

  late Map sez6 = {
    'c406': 'Distonia dolorosa in fase OFF',
    'np4dystnnum': 'Numeratore (numero ore in OFF)',
    'np4dystnden': 'Denominatore (Numero ore sveglio)',
    'np4dystnpct': '% Punteggio',
  };

  Map getData(int index){
    Map ret = {};
    switch(index){
      case 0:
        ret = sez1;
        break;
      case 1:
        ret = sez2;
        break;
      case 2:
        ret = sez3;
        break;
      case 3:
        ret = sez4;
        break;
      case 4:
        ret = sez5;
        break;
      case 5:
        ret = sez6;
        break;
    }

    return ret;
  }

  List<String> getExSezioni(int index){
    List<String> ret = [];
    switch(index){
      case 0:
        ret = exSez1;
        break;
      case 2:
        ret = exSez3;
        break;
      case 5:
        ret = exSez6;
        break;
    }
    return ret;
  }


}