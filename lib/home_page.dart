import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:pdf_test_project/util/data.dart';
import 'package:pdf_test_project/util/recomendaciones.dart';
import 'package:printing/printing.dart';
import 'dart:math';
import 'dart:typed_data';

import 'package:pdf_test_project/model/model.dart';
import 'package:pdf_test_project/pdf/pdf.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

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
  infestationGrades: {'moscas': 40, 'cucarachas': 1, 'roedores': 2, 'otros': 3},
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

class _MyHomePageState extends State<MyHomePage> {
  final pdf = pw.Document();
  late String paragraph;

  @override
  void initState() {
    paragraph = getParagraphFromMap(ourMap);
    super.initState();
  }

  void savePdf() async {
    final doc = await _generatePdf(visita, client);
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/example.pdf');
    await file.writeAsBytes(doc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   centerTitle: true,
      //   title: Text(widget.title),
      // ),
      body: PdfPreview(
        build: (format) => _generatePdf(visita, client),
      ),
    );
  }

  // pw.Text _getMinortitle(String x, pw.Font font) => pw.Text(
  //       x,
  //       textAlign: pw.TextAlign.left,
  //       style: pw.TextStyle(
  //         font: font,
  //         fontSize: 12,
  //         color: PdfColor.fromHex('53726A'),
  //       ),
  //     );

  // pw.Widget _getTitle(String certifType, pw.Font font) => pw.Text(
  //       '$certifType',
  //       textAlign: pw.TextAlign.center,
  //       style: pw.TextStyle(
  //         font: font,
  //         fontSize: 32,
  //         color: PdfColor.fromHex('53726A'),
  //       ),
  //     );
  // //
  // pw.Widget _getCertificadotitle(String certifType, pw.Font font) => pw.Text(
  //       'Certificado de $certifType',
  //       textAlign: pw.TextAlign.center,
  //       style: pw.TextStyle(
  //         font: font,
  //         fontSize: 32,
  //         color: PdfColor.fromHex('53726A'),
  //       ),
  //     );

  // pw.Text _getSubtitle(String text, pw.Font font) => pw.Text(
  //       text,
  //       textAlign: pw.TextAlign.center,
  //       style: pw.TextStyle(
  //         font: font,
  //         fontSize: 22,
  //         color: PdfColor.fromHex('53726A'),
  //       ),
  //     );

  // pw.Text _getSmallBlackText(String text, pw.Font font) => pw.Text(
  //       text,
  //       style: pw.TextStyle(
  //         font: font,
  //         fontSize: 8,
  //         color: PdfColors.black,
  //       ),
  //     );

  // //Metodos quemados

  // pw.SizedBox _getTableItemroedores(
  //   String title,
  //   pw.Font titleFont,
  //   pw.Font contentFont,
  // ) =>
  //     pw.SizedBox(
  //       width: 200,
  //       child: pw.Row(
  //         mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: pw.CrossAxisAlignment.center,
  //         children: [
  //           pw.Text(
  //             title,
  //             style: pw.TextStyle(
  //               font: titleFont,
  //               // fontWeight: FontWeight.bold,
  //               fontSize: 10,
  //               color: PdfColors.black,
  //             ),
  //           ),
  //           pw.Text(
  //             '     Sin evidencia:  0',
  //             style: pw.TextStyle(
  //               font: contentFont,
  //               fontSize: 8,
  //               color: PdfColors.grey,
  //             ),
  //           ),
  //           pw.Text(
  //             '     Bajo: 1 a 5',
  //             style: pw.TextStyle(
  //               font: contentFont,
  //               fontSize: 8,
  //               color: PdfColors.grey,
  //             ),
  //           ),
  //           pw.Text(
  //             '     Medio: 5 a 10 ',
  //             style: pw.TextStyle(
  //               font: contentFont,
  //               fontSize: 8,
  //               color: PdfColors.grey,
  //             ),
  //           ),
  //           pw.Text(
  //             '     Alto: 11 en adelante',
  //             style: pw.TextStyle(
  //               font: contentFont,
  //               fontSize: 8,
  //               color: PdfColors.grey,
  //             ),
  //           )
  //         ],
  //       ),
  //     );

  // pw.SizedBox _getQuimico(
  //   String producto,
  //   String docificacion,
  //   pw.Font titleFont,
  //   pw.Font contentFont,
  // ) =>
  //     pw.SizedBox(
  //       width: 200,
  //       child: pw.Row(
  //         mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: pw.CrossAxisAlignment.center,
  //         children: [
  //           pw.Text(
  //             producto,
  //             style: pw.TextStyle(
  //               font: titleFont,
  //               fontSize: 10,
  //               color: PdfColors.black,
  //             ),
  //           ),
  //           pw.Text(
  //             docificacion,
  //             style: pw.TextStyle(
  //               font: contentFont,
  //               fontSize: 10,
  //               color: PdfColors.black,
  //             ),
  //           )
  //         ],
  //       ),
  //     );

  // pw.SizedBox _getTableItem(
  //   String title,
  //   String content,
  //   pw.Font titleFont,
  //   pw.Font contentFont,
  // ) =>
  //     pw.SizedBox(
  //       width: 200,
  //       child: pw.Row(
  //         mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: pw.CrossAxisAlignment.center,
  //         children: [
  //           pw.Text(
  //             title,
  //             style: pw.TextStyle(
  //               font: titleFont,
  //               fontSize: 12,
  //               color: PdfColors.grey,
  //             ),
  //           ),
  //           pw.Text(
  //             content,
  //             style: pw.TextStyle(
  //               font: contentFont,
  //               fontSize: 12,
  //               color: PdfColors.grey,
  //             ),
  //           )
  //         ],
  //       ),
  //     );

  Future<Uint8List> _generatePdf(MceVisit visit, MceUser client) async {
    pw.Widget image = await getImage();
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
                pw.SizedBox(height: 10),
                fullWidthTextRow(
                  textField: 'Observaciones',
                  content: visit.notes.isEmpty
                      ? '''Se realiza el control integrado de plagas en las instalaciones en general; inspección y verificación, bajo métodos de aplicación de insecticida líquido en Solución Concentrada S.C o Emulsión Concentrada E.C por aspersión, insecticida en gel por dosificación en gotas y vapor de agua a una temperatura de 135 a 169 grados centígrados; a nivel de puntos estratégicos y/o críticos. Durante la intervención no se identificó presencia de plagas; insectos rastreros, voladores o roedores. Los vectores son controlados debido a los buenos hábitos higiénicos, locativos y distribución de objetos. Contribuyendo a la eficacia del programa de Manejo Integrado de Plagas.
                      \nPara evitar una contaminación cruzada por favor realizar aseo profundo y desinfección al ambiente en áreas de producción antes de iniciar operaciones.'''
                      : visit.notes,
                ),

                pw.Text(
                  'Se realiza el control integrado de plagas en las instalaciones en general; inspección y verificación, bajo métodos de aplicación de  productos químicos y no químicos, para el control de plagas, en las áreas de producción, almacenamiento, oficinas, baños, comedores, zonas verdes, etc.',
                  style: const pw.TextStyle(
                    fontSize: 10,
                    color: PdfColors.grey700,
                  ),
                ),
                //coloredWidthBox(400),
              ],
            ),
          ); // Center
        },
      ),
    );
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
}
