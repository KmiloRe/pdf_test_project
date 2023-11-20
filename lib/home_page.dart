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

//Datos para hacer graficos
// const tableHeaders = [
//   'Mes',
//   'Cucaracha alemana',
//   'Mosquitos dengue',
//   'Result',
//   'Roedor',
// ];

// const tableHeaders2 = [
//   'Mes',
//   'Cucarachas',
//   'Moscas',
//   'Roedores',
//   'Otras plagas'
// ];

// const tableHeaders3 = [
//   'Tipo de servicio',
//   'Cucarachas',
//   'Moscas',
//   'Roedores',
//   'Otras plagas'
// ];

// const dataTable2 = [
//   ['Control general en instalaciones', 0, 0, 0, 0],
// ];

// const dataTable3 = [
//   [
//     'Control general en instalaciones',
//     'Sin evidencia',
//     'Sin evidencia',
//     'Sin evidencia',
//     'Sin evidencia'
//   ],
// ];

// const dataTable = [
//   ['Enero', 30, 35, 22, 12],
//   ['Febrero', 5, 10, 0, 3],
//   ['Marzo', 3, 5, 2, 1],
//   ['Abril', 10, 2, 1, 1],
//   ['Mayo', 0, 4, 0, 0],
//   ['Junio', 0, 0, 1, 1],
//   // ['Insurance', 250, 310],
// ];

// const baseColor = PdfColors.cyan;
// const secondColor = PdfColors.green400;
// const rowcolor = PdfColors.black;

// // Codigo para bar chart
// final chart1 = pw.Chart(
//   left: pw.Container(
//     alignment: pw.Alignment.topCenter,
//     margin: const pw.EdgeInsets.only(right: 5, top: 10),
//     child: pw.Transform.rotateBox(
//       angle: pi / 2,
//       child: pw.Text('Cantidad'),
//     ),
//   ),
//   title: pw.ChartLegend(
//     direction: pw.Axis.horizontal,
//     position: const pw.Alignment(0, 0),
//     decoration: pw.BoxDecoration(
//       color: PdfColors.white,
//       border: pw.Border.all(
//         color: PdfColors.black,
//         width: .5,
//       ),
//     ),
//   ),
//   grid: pw.CartesianGrid(
//     xAxis: pw.FixedAxis.fromStrings(
//       List<String>.generate(
//           dataTable.length, (index) => dataTable[index][0] as String),
//       marginStart: 30,
//       marginEnd: 35,
//       ticks: false, //palitos de x al titulo del mes
//     ),
//     yAxis: pw.FixedAxis(
//       [0, 5, 10, 15, 20, 25, 30, 35, 40, 45],
//       format: (v) => '\*$v',
//       divisions: true,
//       divisionsDashed: true,
//       /*  buildLabel: (value) {
//         return pw.Container(
//           color: baseColor,
//           child: pw.Text('test'),
//         );
//       }, */
//     ),
//   ),
//   //ubicación de cada barra de datos
//   datasets: [
//     pw.BarDataSet(
//       color: PdfColors.blue100,
//       legend: tableHeaders2[2],
//       width: 7,
//       offset: -15,
//       borderColor: baseColor,
//       data: List<pw.PointChartValue>.generate(
//         dataTable.length,
//         (i) {
//           final v = dataTable[i][2] as num;
//           return pw.PointChartValue(i.toDouble(), v.toDouble());
//         },
//       ),
//     ),
//     pw.BarDataSet(
//       color: PdfColors.amber100,
//       legend: tableHeaders2[1],
//       width: 7,
//       offset: -4,
//       borderColor: PdfColors.amber,
//       data: List<pw.PointChartValue>.generate(
//         dataTable.length,
//         (i) {
//           final v = dataTable[i][1] as num;
//           return pw.PointChartValue(i.toDouble(), v.toDouble());
//         },
//       ),
//     ),
//     pw.BarDataSet(
//       color: PdfColors.purple100,
//       legend: tableHeaders2[3],
//       width: 7,
//       offset: 7,
//       borderColor: PdfColors.purpleAccent,
//       data: List<pw.PointChartValue>.generate(
//         dataTable.length,
//         (i) {
//           final v = dataTable[i][3] as num;
//           return pw.PointChartValue(i.toDouble(), v.toDouble());
//         },
//       ),
//     ),
//     pw.BarDataSet(
//       color: PdfColors.green,
//       legend: tableHeaders2[4],
//       width: 7,
//       offset: 18,
//       borderColor: PdfColors.greenAccent,
//       data: List<pw.PointChartValue>.generate(
//         dataTable.length,
//         (i) {
//           final v = dataTable[i][4] as num;
//           return pw.PointChartValue(i.toDouble(), v.toDouble());
//         },
//       ),
//     ),
//   ],
// );

// //Tabla del final
// // Data table
// final table = pw.TableHelper.fromTextArray(
//   border: null,
//   headers: tableHeaders2,
//   data: List<List<dynamic>>.generate(
//     dataTable.length,
//     (index) => <dynamic>[
//       dataTable[index][0],
//       dataTable[index][1],
//       dataTable[index][2],
//       dataTable[index][3],
//       dataTable[index][4],
//       //(dataTable[index][1] as num) - (dataTable[index][2] as num),
//     ],
//   ),
//   headerStyle: pw.TextStyle(
//     color: PdfColors.white,
//     fontWeight: pw.FontWeight.bold,
//   ),
//   headerDecoration: const pw.BoxDecoration(
//     color: secondColor,
//   ),
//   rowDecoration: const pw.BoxDecoration(
//     border: pw.Border(
//       bottom: pw.BorderSide(
//         color: secondColor,
//         width: .5,
//       ),
//     ),
//   ),
//   cellAlignment: pw.Alignment.center,
//   cellAlignments: {0: pw.Alignment.centerLeft},
// );

// final table2 = pw.TableHelper.fromTextArray(
//   border: null,
//   headers: tableHeaders3,
//   data: List<List<dynamic>>.generate(
//     dataTable2.length,
//     (index) => <dynamic>[
//       dataTable2[index][0],
//       dataTable2[index][1],
//       dataTable2[index][2],
//       dataTable2[index][3],
//       dataTable2[index][4],
//       //dataTable2[index][0],
//       //(dataTable[index][1] as num) - (dataTable[index][2] as num),
//     ],
//   ),
//   headerStyle: pw.TextStyle(
//     color: PdfColors.white,
//     fontWeight: pw.FontWeight.bold,
//   ),
//   headerDecoration: const pw.BoxDecoration(
//     color: secondColor,
//   ),
//   rowDecoration: const pw.BoxDecoration(
//     border: pw.Border(
//       bottom: pw.BorderSide(
//         color: secondColor,
//         width: .5,
//       ),
//     ),
//   ),
//   cellAlignment: pw.Alignment.center,
//   cellAlignments: {0: pw.Alignment.centerLeft},
// );

// final table3 = pw.TableHelper.fromTextArray(
//   border: null,
//   headers: tableHeaders3,
//   data: List<List<dynamic>>.generate(
//     dataTable2.length,
//     (index) => <dynamic>[
//       dataTable3[index][0],
//       dataTable3[index][1],
//       dataTable3[index][2],
//       dataTable3[index][3],
//       dataTable3[index][4],
//       //dataTable2[index][0],
//       //(dataTable[index][1] as num) - (dataTable[index][2] as num),
//     ],
//   ),
//   headerStyle: pw.TextStyle(
//       color: PdfColors.white, fontWeight: pw.FontWeight.bold, fontSize: 10),
//   headerDecoration: const pw.BoxDecoration(
//     color: secondColor,
//   ),
//   cellStyle: const pw.TextStyle(
//     color: rowcolor,
//     fontSize: 10,
//   ),
//   rowDecoration: const pw.BoxDecoration(
//     border: pw.Border(
//       bottom: pw.BorderSide(
//         color: secondColor,
//         width: .5,
//       ),
//     ),
//   ),
//   cellAlignment: pw.Alignment.centerLeft,
//   cellAlignments: {0: pw.Alignment.centerLeft},
// );

// // Left curved line chart
// final chart2 = pw.Chart(
//   right: pw.ChartLegend(),
//   grid: pw.CartesianGrid(
//     xAxis: pw.FixedAxis([0, 1, 2, 3, 4, 5, 6]),
//     yAxis: pw.FixedAxis(
//       [0, 10, 20, 30, 40, 50],
//       divisions: true,
//     ),
//   ),
//   datasets: [
//     pw.LineDataSet(
//       legend: 'Expense',
//       drawSurface: true,
//       isCurved: true,
//       drawPoints: false,
//       color: baseColor,
//       data: List<pw.PointChartValue>.generate(
//         dataTable.length,
//         (i) {
//           final v = dataTable[i][2] as num;
//           return pw.PointChartValue(i.toDouble(), v.toDouble());
//         },
//       ),
//     ),
//   ],
// );

MceVisit visita = MceVisit(
  id: '1',
  date: '12/11/2023',
  serviceType: 'Control de instalaciones',
  initialHour: '',
  endHour: '',
   verifiedBy: 'Andrea',
  verifyerPosition: 'Asistente',
  workerName: 'Jose Reyes',
  notes: 'Sin notas',
  final List<String> controlledAreas;
  final Map<String, dynamic> infestationGrades;
  final List<Map<String, dynamic>> chemicalsApplied;
  final List<String> higienicalRecomendations;
  final List<String> locationRecomendations;
  final List<Map<String, dynamic>> visitPhotoList;
  final String initialPhotoUrl;
  final String finalPhotoUrl;
  isCompleted: true,
  visitsId: '1',
  clientName: 'Qbano unicentro',
  productPhotoUrl: 'https://cdn-icons-png.flaticon.com/512/29/29264.png',

);

class _MyHomePageState extends State<MyHomePage> {
  final pdf = pw.Document();
  late String paragraph;

  @override
  void initState() {
    paragraph = getParagraphFromMap(ourMap);
    super.initState();
  }

  void savePdf() async {
    final doc = await _generatePdf(PdfPageFormat.a4, 'Test');
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
        build: (format) => _generatePdf(format, 'Test'),
      ),
    );
  }

  pw.Text _getMinortitle(String x, pw.Font font) => pw.Text(
        x,
        textAlign: pw.TextAlign.left,
        style: pw.TextStyle(
          font: font,
          fontSize: 12,
          color: PdfColor.fromHex('53726A'),
        ),
      );

  pw.Widget _getTitle(String certifType, pw.Font font) => pw.Text(
        '$certifType',
        textAlign: pw.TextAlign.center,
        style: pw.TextStyle(
          font: font,
          fontSize: 32,
          color: PdfColor.fromHex('53726A'),
        ),
      );
  //
  pw.Widget _getCertificadotitle(String certifType, pw.Font font) => pw.Text(
        'Certificado de $certifType',
        textAlign: pw.TextAlign.center,
        style: pw.TextStyle(
          font: font,
          fontSize: 32,
          color: PdfColor.fromHex('53726A'),
        ),
      );

  pw.Text _getSubtitle(String text, pw.Font font) => pw.Text(
        text,
        textAlign: pw.TextAlign.center,
        style: pw.TextStyle(
          font: font,
          fontSize: 22,
          color: PdfColor.fromHex('53726A'),
        ),
      );

  pw.Text _getSmallBlackText(String text, pw.Font font) => pw.Text(
        text,
        style: pw.TextStyle(
          font: font,
          fontSize: 8,
          color: PdfColors.black,
        ),
      );

  //Metodos quemados

  pw.SizedBox _getTableItemroedores(
    String title,
    pw.Font titleFont,
    pw.Font contentFont,
  ) =>
      pw.SizedBox(
        width: 200,
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Text(
              title,
              style: pw.TextStyle(
                font: titleFont,
                // fontWeight: FontWeight.bold,
                fontSize: 10,
                color: PdfColors.black,
              ),
            ),
            pw.Text(
              '     Sin evidencia:  0',
              style: pw.TextStyle(
                font: contentFont,
                fontSize: 8,
                color: PdfColors.grey,
              ),
            ),
            pw.Text(
              '     Bajo: 1 a 5',
              style: pw.TextStyle(
                font: contentFont,
                fontSize: 8,
                color: PdfColors.grey,
              ),
            ),
            pw.Text(
              '     Medio: 5 a 10 ',
              style: pw.TextStyle(
                font: contentFont,
                fontSize: 8,
                color: PdfColors.grey,
              ),
            ),
            pw.Text(
              '     Alto: 11 en adelante',
              style: pw.TextStyle(
                font: contentFont,
                fontSize: 8,
                color: PdfColors.grey,
              ),
            )
          ],
        ),
      );

  pw.SizedBox _getQuimico(
    String producto,
    String docificacion,
    pw.Font titleFont,
    pw.Font contentFont,
  ) =>
      pw.SizedBox(
        width: 200,
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Text(
              producto,
              style: pw.TextStyle(
                font: titleFont,
                fontSize: 10,
                color: PdfColors.black,
              ),
            ),
            pw.Text(
              docificacion,
              style: pw.TextStyle(
                font: contentFont,
                fontSize: 10,
                color: PdfColors.black,
              ),
            )
          ],
        ),
      );

  pw.SizedBox _getTableItem(
    String title,
    String content,
    pw.Font titleFont,
    pw.Font contentFont,
  ) =>
      pw.SizedBox(
        width: 200,
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Text(
              title,
              style: pw.TextStyle(
                font: titleFont,
                fontSize: 12,
                color: PdfColors.grey,
              ),
            ),
            pw.Text(
              content,
              style: pw.TextStyle(
                font: contentFont,
                fontSize: 12,
                color: PdfColors.grey,
              ),
            )
          ],
        ),
      );

  Future<Uint8List> _generatePdf({required MceVisit visit, required MceUser client}) async {
  pw.Widget image = await getImage();
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.letter,
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
                    : visit.controlledAreas.join(" "),
              ),
              pw.SizedBox(height: 10),
              fullWidthTextRow(
                textField: 'Observaciones',
                content: visit.notes.isEmpty
                    ? '''Se realiza el control integrado de plagas en las instalaciones en general; inspección y verificación, bajo métodos de aplicación de insecticida líquido en Solución Concentrada S.C o Emulsión Concentrada E.C por aspersión, insecticida en gel por dosificación en gotas y vapor de agua a una temperatura de 135 a 169 grados centígrados; a nivel de puntos estratégicos y/o críticos. Durante la intervención no se identificó presencia de plagas; insectos rastreros, voladores o roedores. Los vectores son controlados debido a los buenos hábitos higiénicos, locativos y distribución de objetos. Contribuyendo a la eficacia del programa de Manejo Integrado de Plagas.
                      \nPara evitar una contaminación cruzada por favor realizar aseo profundo y desinfección al ambiente en áreas de producción antes de iniciar operaciones.'''
                    : visit.notes,
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

