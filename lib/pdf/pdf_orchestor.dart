part of pdf;

MceVisit visita = const MceVisit(
  id: '1',
  date: '12/11/2023',
  serviceType: 'Control de instalaciones',
  initialHour: '',
  endHour: '',
  verifiedBy: 'Andrea',
  verifyerPosition: 'Asistente',
  workerName: 'Jose Reyes',
  notes: 'Sin notas',
  controlledAreas: ['Área de carga', 'Cocina', 'Baños de hombre'],
  infestationGrades: {
    'moscas': '40',
    'cucarachas': '0',
    'roedores': '305',
    'otros': '2'
  },
  chemicalsApplied: [
    {'matamax': 1},
    {'Quimico 2': 3}
  ],
  higienicalRecomendations: ['Limpieza', 'Cocina limpia'],
  locationRecomendations: [
    'Trapear área de carga',
    'desengrasar cocina',
    'Desinfectar baños de hombre'
  ],
  visitPhotoList: [
    {'matamax': 1},
    {'Quimico 2': 3}
  ],
  initialPhotoUrl: 'https://cdn-icons-png.flaticon.com/512/29/29264.png',
  finalPhotoUrl: 'https://cdn-icons-png.flaticon.com/512/29/29264.png',
  isCompleted: true,
  visitsId: '1',
  clientName: 'Qbano unicentro',
  productPhotoUrl: 'https://cdn-icons-png.flaticon.com/512/29/29264.png',
);

MceUser client = const MceUser();

Future<pw.Widget> getImage() async {
  final img = await rootBundle.load('assets/images/MCELogo.png');
  final imageBytes = img.buffer.asUint8List();
  pw.Image image1 = pw.Image(pw.MemoryImage(imageBytes));
  return image1;
}

Future<pw.Widget> getImagesgs() async {
  final img = await rootBundle.load('assets/images/sgs.jpg');
  final imageBytes = img.buffer.asUint8List();
  pw.Image image1 = pw.Image(pw.MemoryImage(imageBytes));
  return image1;
}

Future<pw.Widget> getImagesfirma() async {
  final img = await rootBundle.load('assets/images/FirmaCarlos.png');
  final imageBytes = img.buffer.asUint8List();
  pw.Image image1 = pw.Image(pw.MemoryImage(imageBytes));
  return image1;
}

//! falta footer / pie de pagina
Future<Uint8List> _generatePdf(MceVisit visit, MceUser client) async {
  pw.Widget image = await getImage();
  pw.Widget imagefirma = await getImagesfirma();
  //? pw.Footer();
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.letter,
      margin: const pw.EdgeInsets.only(top: 10, left: 10, right: 10),
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(
            children: [
              pdfHeader(image, '12/11/2023'),
              pw.SizedBox(height: 10),
              pdfHeaderContentTable(visit, client),
              pw.SizedBox(height: 10),
              fullWidthTextRow(
                textField: 'Áreas controladas',
                content: visit.controlledAreas.isEmpty
                    ? "Punto de venta, carnicería, fruver, cajas, bodega, shut de basuras, baños, lockers, cafetín y monitoreo."
                    : visit.controlledAreas.join(", ") + ("."),
              ),

              // fullWidthTextRow(
              //   textField: 'Observaciones',
              //   content: visit.notes.isEmpty
              //       ? '''Se realiza el control integrado de plagas en las instalaciones en general; inspección y verificación, bajo métodos de aplicación de insecticida líquido en Solución Concentrada S.C o Emulsión Concentrada E.C por aspersión, insecticida en gel por dosificación en gotas y vapor de agua a una temperatura de 135 a 169 grados centígrados; a nivel de puntos estratégicos y/o críticos. Durante la intervención no se identificó presencia de plagas; insectos rastreros, voladores o roedores. Los vectores son controlados debido a los buenos hábitos higiénicos, locativos y distribución de objetos. Contribuyendo a la eficacia del programa de Manejo Integrado de Plagas.
              //       \nPara evitar una contaminación cruzada por favor realizar aseo profundo y desinfección al ambiente en áreas de producción antes de iniciar operaciones.'''
              //       : 'Se realiza el control integrado de plagas en las instalaciones en general; inspección y verificación, bajo métodos\nde aplicación de insecticida líquido en Solución Concentrada S.C o Emulsión Concentrada E.C por aspersión\n, insecticida en gel por dosificación en gotas y vapor de agua a una temperatura de 135 a 169 grados centígrados;\na nivel de puntos estratégicos y/o críticos. Durante la intervención no se identificó presencia de plagas; insectos\nrastreros, voladores o roedores. Los vectores son controlados debido a los buenos hábitos higiénicos, locativos y\ndistribución de objetos. Contribuyendo a la eficacia del programa de Manejo Integrado de Plagas.' /*visit.notes,*/,
              // ),

              pw.SizedBox(height: 10),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Wrap(alignment: pw.WrapAlignment.start, children: [
                  pw.Text(
                    "Observaciones:",
                    overflow: pw.TextOverflow.clip,
                    textAlign: pw.TextAlign.justify,
                    style: pw.TextStyle(
                      fontSize: 10,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.SizedBox(height: 20),
                  pw.Text(
                    'Se realiza el control integrado de plagas en las instalaciones en general; inspección y verificación, bajo métodos de aplicación de insecticida líquido en Solución Concentrada S.C o Emulsión Concentrada E.C por aspersión, insecticida en gel por dosificación en gotas y vapor de agua a una temperatura de 135 a 169 grados centígrados; a nivel de puntos estratégicos y/o críticos. Durante la intervención no se identificó presencia de plagas; insectos rastreros, voladores o roedores. Los vectores son controlados debido a los buenos hábitos higiénicos, locativos y distribución de objetos. Contribuyendo a la eficacia del programa de Manejo Integrado de Plagas.',
                    overflow: pw.TextOverflow.clip,
                    textAlign: pw.TextAlign.justify,
                    style: const pw.TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  pw.Text(
                    "Para evitar una contaminación cruzada por favor realizar aseo profundo y desinfección al ambiente en áreas de producción antes de iniciar operaciones.",
                    overflow: pw.TextOverflow.clip,
                    textAlign: pw.TextAlign.justify,
                    style: const pw.TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ]),
              ),
              pw.SizedBox(height: 20),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Wrap(alignment: pw.WrapAlignment.start, children: [
                  pw.Text(
                    "Convención de grados de infestación:",
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
              pdfinfestacion(),
              // pw.Padding(
              //   padding: const pw.EdgeInsets.symmetric(vertical: 0),
              //   child: pw.Container(
              //     alignment: pw.Alignment.topLeft,
              //     width: double.infinity,
              //     child: imageconvencion,
              //   ),
              // ),
              //coloredWidthBox(400),
              pw.SizedBox(height: 10),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Wrap(alignment: pw.WrapAlignment.start, children: [
                  pw.Text(
                    "Grado de infestación identificado por el técnico en control integrado de plagas:",
                    overflow: pw.TextOverflow.clip,
                    textAlign: pw.TextAlign.justify,
                    style: pw.TextStyle(
                      fontSize: 10,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ]),
              ),
              pw.SizedBox(height: 10),
              pdfinfestationgradeTable(visit, client),
              //! aqui pie de pagina
            ],
          ),
        ); // Center
      },
    ),
  );

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.letter,
      margin: const pw.EdgeInsets.only(top: 10, left: 10, right: 10),
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(
            children: [
              pw.SizedBox(height: 20),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Wrap(alignment: pw.WrapAlignment.start, children: [
                  pw.Text(
                    "Productos / Químicos aplicados:",
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
              pdfQuimicos(visit),
              pw.SizedBox(height: 20),
              pdflistRecomendaciones(visit),
            ],
          ),
        ); // Center
      },
    ),
  );

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.letter,
      margin: const pw.EdgeInsets.only(top: 10, left: 10, right: 10),
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(
            children: [
              pw.SizedBox(height: 20),
              pdffooter(imagefirma, visit),
            ],
          ),
        ); // Center
      },
    ),
  );
  // footer: (pw.Context context) {
  //     return pw.Container(
  //         alignment: pw.Alignment.centerRight,
  //         margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
  //         child: pw.Text(
  //             'Page ${context.pageNumber} of ${context.pagesCount}',
  //             style: pw.Theme.of(context)
  //                 .defaultTextStyle
  //                 .copyWith(color: PdfColors.grey)));
  //   };

  return pdf.save();
}

Future<Uint8List> _generateDiploma(MceVisit visit, MceUser client) async {
  pw.Widget image = await getImage();
  pw.Widget imagesgs = await getImagesgs();
  pw.Widget imagefirma = await getImagesfirma();
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.letter.landscape,
      margin: const pw.EdgeInsets.only(top: 10, left: 20, right: 15),
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(
            children: [
              pdfdiplomaHeader(image),
              pw.SizedBox(height: 20),
              pw.SizedBox(
                child: pw.Center(
                  child: pw.Text(
                    'CERTIFICADO DE FUMIGACIÓN',
                    style: pw.TextStyle(
                      fontSize: 22,
                      fontWeight: pw.FontWeight.bold,
                    ),
                    textAlign: pw.TextAlign.center,
                  ),
                ),
              ),
              pw.SizedBox(height: 40),
              pdfdiplomaMiddlesection(imagesgs, visit, client),
              //pdfHeaderContentTable(visit, client),
              pw.SizedBox(height: 80),
              pdfdiplomaFootersection(imagefirma, visit, client),
              pw.SizedBox(height: 10),
            ],
          ),
        ); // Center
      },
    ),
  );
  return pdf.save();
}
