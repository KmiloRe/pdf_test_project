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
    cucarachas =
        '................................................................................................................................................................................................ Sin evidencia';
    moscas =
        '...................................................................................................................................................................................................................... Sin evidencia';
    roedores =
        '.................................................................................................................................................................................................................... Sin evidencia';
    otros =
        '.......................................................................................................................................................................................................................... Sin evidencia';
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
          '.................................................................................................................................................................................................................... Sin evidencia';
    } else if (roedores == 1) {
      roedores =
          '............................................................................................................................................................................................................................. Bajo';
    } else if (roedores < 5) {
      roedores =
          '............................................................................................................................................................................................................................ Medio';
    } else {
      roedores =
          '............................................................................................................................................................................................................................. Alto';
    }

    if (otros == 0) {
      otros =
          '.......................................................................................................................................................................................................................... Sin evidencia';
    } else if (otros < 51) {
      otros =
          '................................................................................................................................................................................................................................... Bajo';
    } else if (otros < 101) {
      otros =
          '.................................................................................................................................................................................................................................. Medio';
    } else {
      otros =
          '................................................................................................................................................................................................................................... Alto';
    }
    if (moscas == 0) {
      moscas =
          '...................................................................................................................................................................................................................... Sin evidencia';
    } else if (moscas < 101) {
      moscas =
          '............................................................................................................................................................................................................................... Bajo';
    } else if (moscas < 3001) {
      moscas =
          '.............................................................................................................................................................................................................................. Medio';
    } else {
      moscas =
          '............................................................................................................................................................................................................................... Alto';
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

pw.Widget pdfinfestacion() => pw.Table(
      defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
      border: pw.TableBorder.all(
        width: 0.5,
      ),
      children: [
        pw.TableRow(
          children: [
            pw.Center(
              child: pw.Table(
                defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
                border: pw.TableBorder.all(),
                children: [
                  headerTextRow('Tipo de vector'),
                  subtextTextRow('Insectos rastreros'),
                  subtextTextRow('Insectos voladores'),
                  subtextTextRow('Roedores'),
                ],
              ),
            ),
            pw.Center(
              child: pw.Table(
                defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
                border: pw.TableBorder.all(),
                children: [
                  headerTextRow('Sin evidencia'),
                  subtextTextRow('0'),
                  subtextTextRow('0'),
                  subtextTextRow('0'),
                ],
              ),
            ),
            pw.Center(
              child: pw.Table(
                defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
                border: pw.TableBorder.all(),
                children: [
                  headerTextRow('Bajo'),
                  subtextTextRow('Insectos rastreros'),
                  subtextTextRow('Insectos voladores'),
                  subtextTextRow('Roedores'),
                ],
              ),
            ),
            pw.Center(
              child: pw.Table(
                defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
                border: pw.TableBorder.all(),
                children: [
                  headerTextRow('Medio'),
                  subtextTextRow('Entre 51 y 100'),
                  subtextTextRow('Entre 101 y 300'),
                  subtextTextRow('Entre 2 y 4'),
                ],
              ),
            ),
            pw.Center(
              child: pw.Table(
                defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
                border: pw.TableBorder.all(),
                children: [
                  headerTextRow('Alto'),
                  subtextTextRow('101 en adelante'),
                  subtextTextRow('301 en adelante'),
                  subtextTextRow('5 en adelante'),
                ],
              ),
            ),
          ],
        ),
      ],
    );

pw.Widget pdfQuimicos(MceVisit visit) => pw.Table(
      defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
      border: pw.TableBorder.all(
        width: 0.5,
      ),
      children: [
        pw.TableRow(
          children: [
            pw.Center(
              child: pw.Table(
                defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
                border: pw.TableBorder.all(),
                children: [
                  headerTextRow('Nombre'),
                ],
              ),
            ),
            pw.Center(
              child: pw.Table(
                defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
                border: pw.TableBorder.all(),
                children: [
                  headerTextRow('Tipo'),
                ],
              ),
            ),
            pw.Center(
              child: pw.Table(
                defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
                border: pw.TableBorder.all(),
                children: [
                  headerTextRow('Método'),
                ],
              ),
            ),
            pw.Center(
              child: pw.Table(
                defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
                border: pw.TableBorder.all(),
                children: [
                  headerTextRow('Dosificación'),
                ],
              ),
            ),
            pw.Center(
              child: pw.Table(
                defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
                border: pw.TableBorder.all(),
                children: [
                  headerTextRow('Grado toxicidad'),
                ],
              ),
            ),
          ],
        ),
        ...List.generate(
          visit.chemicalsApplied.length,
          (index) => pw.TableRow(
            children: [
              headerContentTextRow(
                textField: 'Cliente',
                content: '',
              ),
              tableContentTextRow('ds'),
              headerContentTextRow(
                textField: 'Sede',
                content: '',
              ),
              headerContentTextRow(
                textField: 'Dirección',
                content: 'Carrera 50# 125sur-234',
              ),
            ],
          ),
        ),
        pw.TableRow(
          children: [
            headerContentTextRow(
              textField: 'Cliente',
              content: '',
            ),
            headerContentTextRow(
              textField: 'Sede',
              content: '',
            ),
            headerContentTextRow(
              textField: 'Dirección',
              content: 'Carrera 50# 125sur-234',
            ),
          ],
        ),
      ],
    );

pw.Widget pdflistRecomendaciones(MceVisit visit) => pw.Column(
      children: [
        pw.Align(
          alignment: pw.Alignment.topLeft,
          child: pw.Wrap(alignment: pw.WrapAlignment.start, children: [
            pw.Text(
              "Recomendaciones higiénicas generales:",
              overflow: pw.TextOverflow.clip,
              textAlign: pw.TextAlign.justify,
              style: pw.TextStyle(
                fontSize: 10,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ]),
        ),
        pw.SizedBox(height: 20),
        pw.Align(
          alignment: pw.Alignment.topLeft,
          child: pw.Wrap(alignment: pw.WrapAlignment.start, children: [
            pw.Text(
              "Recomendaciones locativas generales:",
              overflow: pw.TextOverflow.clip,
              textAlign: pw.TextAlign.justify,
              style: pw.TextStyle(
                fontSize: 10,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ]),
        ),
        pw.SizedBox(height: 20),
        pw.Align(
          alignment: pw.Alignment.topLeft,
          child: pw.Wrap(alignment: pw.WrapAlignment.start, children: [
            pw.Text(
              "Recomendaciones sugeridas por el tecnico en control integrado de plagas:",
              overflow: pw.TextOverflow.clip,
              textAlign: pw.TextAlign.justify,
              style: pw.TextStyle(
                fontSize: 10,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ]),
        ),
      ],
    );
