part of pdf;

pw.Widget pdfHeaderContentTable(MceVisit visit, MceUser client) {
  return pw.Table(
    defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
    children: [
      pw.TableRow(
        children: [
          headerContentTextRow(
            textField: 'Cliente',
            content:
                client.name.isEmpty ? 'Supermercado Merkepaisa' : client.name,
            isPrimary: true,
          ),
          headerContentTextRow(
            textField: 'Sede',
            content: client.location.isEmpty ? 'Caldas' : client.location,
          ),
          headerContentTextRow(
            textField: 'Dirección',
            content: 'Carrera 50# 125sur-234',
          ),
        ],
      ),
      pw.TableRow(
        children: [
          headerContentTextRow(
            textField: 'Teléfono',
            content:
                client.phoneNumber.isEmpty ? '448 18 18' : client.phoneNumber,
            isPrimary: true,
          ),
          headerContentTextRow(
            textField: 'Municipio',
            content: client.location.isEmpty ? 'Caldas' : client.location,
          ),
          headerContentTextRow(
            textField: 'Fecha',
            content:
                visit.date.isEmpty ? '12 de septiembre de 2023' : visit.date,
          ),
        ],
      ),
      pw.TableRow(
        children: [
          headerContentTextRow(
            textField: 'Tipo de Servicio',
            content: visit.serviceType.isEmpty
                ? 'Control general en instalaciones'
                : visit.serviceType,
            isPrimary: true,
          ),
          headerContentTextRow(
            textField: visit.initialHour.isEmpty
                ? 'Hora inicio servicio'
                : visit.initialHour,
            content: '10:00am',
          ),
          headerContentTextRow(
            textField:
                visit.endHour.isEmpty ? 'Hora final servicio' : visit.endHour,
            content: '12:00pm',
          ),
        ],
      ),
      pw.TableRow(
        children: [
          headerContentTextRow(
            textField: 'Nombre del técnico(a)',
            content: visit.workerName.isEmpty
                ? 'Carlos Echavarria'
                : visit.workerName,
            isPrimary: true,
          ),
        ],
      ),
    ],
  );
}

pw.Widget pdfinfestationgradeTable(MceVisit visit, MceUser client) {
  dynamic cucarachas;
  dynamic moscas;
  dynamic roedores;
  dynamic otros;
  if (visit.infestationGrades.isEmpty) {
    cucarachas = '.................................... Sin evidencia';
    moscas = '.................................... Sin evidencia';
    roedores = '.................................... Sin evidencia';
    otros = '.................................... Sin evidencia';
  } else {
    cucarachas = int.parse(visit.infestationGrades['cucarachas']);
    moscas = int.parse(visit.infestationGrades['moscas']);
    roedores = int.parse(visit.infestationGrades['roedores']);
    otros = int.parse(visit.infestationGrades['otros']);

    if (cucarachas == 0) {
      cucarachas =
          '................................................................................................................................................................................................ Sin evidencia';
    } else if (cucarachas < 51) {
      cucarachas =
          '......................................................................................................................................................................................................... Bajo';
    } else if (cucarachas < 101) {
      cucarachas =
          '........................................................................................................................................................................................................ Medio';
    } else {
      cucarachas =
          '......................................................................................................................................................................................................... Alto';
    }

    if (roedores == 0) {
      roedores =
          '............................................................................................................................................................................................................. Sin evidencia';
    } else if (roedores == 1) {
      roedores =
          '...................................................................................................................................................................................................................... Bajo';
    } else if (roedores < 5) {
      roedores =
          '..................................................................................................................................................................................................................... Medio';
    } else {
      roedores =
          '...................................................................................................................................................................................................................... Alto';
    }

    if (otros == 0) {
      otros =
          '................................................................................................................................................................................................................... Sin evidencia';
    } else if (otros < 51) {
      otros =
          '............................................................................................................................................................................................................................ Bajo';
    } else if (otros < 101) {
      otros =
          '........................................................................................................................................................................................................................... Medio';
    } else {
      otros =
          '............................................................................................................................................................................................................................ Alto';
    }
    if (moscas == 0) {
      moscas =
          '.................................................................................................................................................................................................................. Sin evidencia';
    } else if (moscas < 101) {
      moscas =
          '........................................................................................................................................................................................................................... Bajo';
    } else if (moscas < 3001) {
      moscas =
          '.......................................................................................................................................................................................................................... Medio';
    } else {
      moscas =
          '........................................................................................................................................................................................................................... Alto';
    }
  }

  return pw.Table(
    defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
    children: [
      pw.TableRow(
        children: [
          allblackNowidthlimitContentTextRow(
            textField: 'Cucaracha Alemana',
            content: cucarachas,
          ),
        ],
      ),
      pw.TableRow(
        children: [
          allblackNowidthlimitContentTextRow(
              textField: 'Moscas', content: moscas),
        ],
      ),
      pw.TableRow(
        children: [
          allblackNowidthlimitContentTextRow(
            textField: 'Roedores',
            content: roedores,
          ),
        ],
      ),
      pw.TableRow(
        children: [
          allblackNowidthlimitContentTextRow(
            textField: 'Otros',
            content: otros,
          ),
        ],
      ),
    ],
  );
}
