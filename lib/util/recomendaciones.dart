String getParagraphFromMap(Map<String, Map<String, dynamic>> info) {
  String response = '';
  info.forEach((key, value) {
    if (value['shouldPaint'] == true) {
      response += '${value['title']} ${value['content']}. ';
    }
  });

  return response;
}

Map<String, Map<String, dynamic>> ourMap = {
  'habits': {
    'title': 'Mejorar hábitos de distribución de objetos en',
    'content': 'los espacios cerrados',
    'shouldPaint': true,
  },
  'desechos': {
    'title': 'Limpiar desecho(s) de residuos(s) en',
    'content': 'los espacios cerrados',
    'shouldPaint': false,
  },
  'fisura': {
    'title': 'Realizar sellamiento de fisura (s) en',
    'content': 'poseta de lavado de utensilios de aseo',
    'shouldPaint': true,
  },
  'hueco': {
    'title': 'Realizar sellamiento de hueco (s) en',
    'content': 'lave de paso de gas en cocina',
    'shouldPaint': true,
  },
};
/* 
class Recomendaciones {
  const Recomendaciones({
    this.acumulacion = '',
    this.desechos = '',
    this.habitos = '',
    this.sellameintoMadrigueras = '',
    this.sellamientoFisura = '',
    this.sellamientoHueco = '',
    this.sellamientoLuz = '',
  });

  factory Recomendaciones.fromMap(Map<String, bool> info) {
    info.forEach((String key, bool value) {
      if (value) {}
    });
    return const Recomendaciones();
  }

  String get paragraph {
    String response = '';
    int iterator = 7; // number

    return response;
  }

  final String habitos;
  final String acumulacion;
  final String desechos;
  final String sellamientoFisura;
  final String sellamientoHueco;
  final String sellamientoLuz;
  final String sellameintoMadrigueras;

  // TODO (team): complete attr
}
 */