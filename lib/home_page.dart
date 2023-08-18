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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//Datos para hacer graficos
const tableHeaders = [
  'Mes',
  'Cucaracha alemana',
  'Mosquitos dengue',
  'Result',
  'Roedor',
];

const tableHeaders2 = [
  'Mes',
  'Cucarachas',
  'Moscas',
  'Roedores',
  'Otras plagas'
];

const tableHeaders3 = [
  'Tipo de servicio',
  'Cucarachas',
  'Moscas',
  'Roedores',
  'Otras plagas'
];

const dataTable2 = [
  ['Control general en instalaciones', 0, 0, 0, 0],
];

const dataTable3 = [
  [
    'Control general en instalaciones',
    'Sin evidencia',
    'Sin evidencia',
    'Sin evidencia',
    'Sin evidencia'
  ],
];

const dataTable = [
  ['Enero', 30, 35, 22, 12],
  ['Febrero', 5, 10, 0, 3],
  ['Marzo', 3, 5, 2, 1],
  ['Abril', 10, 2, 1, 1],
  ['Mayo', 0, 4, 0, 0],
  ['Junio', 0, 0, 1, 1],
  // ['Insurance', 250, 310],
];

// Some summary maths
final budget = dataTable
    .map((e) => e[1] as num)
    .reduce((value, element) => value + element);
final expense = dataTable
    .map((e) => e[2] as num)
    .reduce((value, element) => value + element);

const baseColor = PdfColors.cyan;
const secondColor = PdfColors.green400;
const rowcolor = PdfColors.black;

// Codigo para bar chart
final chart1 = pw.Chart(
  left: pw.Container(
    alignment: pw.Alignment.topCenter,
    margin: const pw.EdgeInsets.only(right: 5, top: 10),
    child: pw.Transform.rotateBox(
      angle: pi / 2,
      child: pw.Text('Cantidad'),
    ),
  ),
  title: pw.ChartLegend(
    direction: pw.Axis.horizontal,
    position: const pw.Alignment(0, 0),
    decoration: pw.BoxDecoration(
      color: PdfColors.white,
      border: pw.Border.all(
        color: PdfColors.black,
        width: .5,
      ),
    ),
  ),
  grid: pw.CartesianGrid(
    xAxis: pw.FixedAxis.fromStrings(
      List<String>.generate(
          dataTable.length, (index) => dataTable[index][0] as String),
      marginStart: 30,
      marginEnd: 35,
      ticks: false, //palitos de x al titulo del mes
    ),
    yAxis: pw.FixedAxis(
      [0, 5, 10, 15, 20, 25, 30, 35, 40, 45],
      format: (v) => '\*$v',
      divisions: true,
      divisionsDashed: true,
      /*  buildLabel: (value) {
        return pw.Container(
          color: baseColor,
          child: pw.Text('test'),
        );
      }, */
    ),
  ),
  //ubicación de cada barra de datos
  datasets: [
    pw.BarDataSet(
      color: PdfColors.blue100,
      legend: tableHeaders2[2],
      width: 7,
      offset: -15,
      borderColor: baseColor,
      data: List<pw.PointChartValue>.generate(
        dataTable.length,
        (i) {
          final v = dataTable[i][2] as num;
          return pw.PointChartValue(i.toDouble(), v.toDouble());
        },
      ),
    ),
    pw.BarDataSet(
      color: PdfColors.amber100,
      legend: tableHeaders2[1],
      width: 7,
      offset: -4,
      borderColor: PdfColors.amber,
      data: List<pw.PointChartValue>.generate(
        dataTable.length,
        (i) {
          final v = dataTable[i][1] as num;
          return pw.PointChartValue(i.toDouble(), v.toDouble());
        },
      ),
    ),
    pw.BarDataSet(
      color: PdfColors.purple100,
      legend: tableHeaders2[3],
      width: 7,
      offset: 7,
      borderColor: PdfColors.purpleAccent,
      data: List<pw.PointChartValue>.generate(
        dataTable.length,
        (i) {
          final v = dataTable[i][3] as num;
          return pw.PointChartValue(i.toDouble(), v.toDouble());
        },
      ),
    ),
    pw.BarDataSet(
      color: PdfColors.green,
      legend: tableHeaders2[4],
      width: 7,
      offset: 18,
      borderColor: PdfColors.greenAccent,
      data: List<pw.PointChartValue>.generate(
        dataTable.length,
        (i) {
          final v = dataTable[i][4] as num;
          return pw.PointChartValue(i.toDouble(), v.toDouble());
        },
      ),
    ),
  ],
);

//Tabla del final
// Data table
final table = pw.TableHelper.fromTextArray(
  border: null,
  headers: tableHeaders2,
  data: List<List<dynamic>>.generate(
    dataTable.length,
    (index) => <dynamic>[
      dataTable[index][0],
      dataTable[index][1],
      dataTable[index][2],
      dataTable[index][3],
      dataTable[index][4],
      //(dataTable[index][1] as num) - (dataTable[index][2] as num),
    ],
  ),
  headerStyle: pw.TextStyle(
    color: PdfColors.white,
    fontWeight: pw.FontWeight.bold,
  ),
  headerDecoration: const pw.BoxDecoration(
    color: secondColor,
  ),
  rowDecoration: const pw.BoxDecoration(
    border: pw.Border(
      bottom: pw.BorderSide(
        color: secondColor,
        width: .5,
      ),
    ),
  ),
  cellAlignment: pw.Alignment.center,
  cellAlignments: {0: pw.Alignment.centerLeft},
);

final table2 = pw.TableHelper.fromTextArray(
  border: null,
  headers: tableHeaders3,
  data: List<List<dynamic>>.generate(
    dataTable2.length,
    (index) => <dynamic>[
      dataTable2[index][0],
      dataTable2[index][1],
      dataTable2[index][2],
      dataTable2[index][3],
      dataTable2[index][4],
      //dataTable2[index][0],
      //(dataTable[index][1] as num) - (dataTable[index][2] as num),
    ],
  ),
  headerStyle: pw.TextStyle(
    color: PdfColors.white,
    fontWeight: pw.FontWeight.bold,
  ),
  headerDecoration: const pw.BoxDecoration(
    color: secondColor,
  ),
  rowDecoration: const pw.BoxDecoration(
    border: pw.Border(
      bottom: pw.BorderSide(
        color: secondColor,
        width: .5,
      ),
    ),
  ),
  cellAlignment: pw.Alignment.center,
  cellAlignments: {0: pw.Alignment.centerLeft},
);

final table3 = pw.TableHelper.fromTextArray(
  border: null,
  headers: tableHeaders3,
  data: List<List<dynamic>>.generate(
    dataTable2.length,
    (index) => <dynamic>[
      dataTable3[index][0],
      dataTable3[index][1],
      dataTable3[index][2],
      dataTable3[index][3],
      dataTable3[index][4],
      //dataTable2[index][0],
      //(dataTable[index][1] as num) - (dataTable[index][2] as num),
    ],
  ),
  headerStyle: pw.TextStyle(
      color: PdfColors.white, fontWeight: pw.FontWeight.bold, fontSize: 10),
  headerDecoration: const pw.BoxDecoration(
    color: secondColor,
  ),
  cellStyle: const pw.TextStyle(
    color: rowcolor,
    fontSize: 10,
  ),
  rowDecoration: const pw.BoxDecoration(
    border: pw.Border(
      bottom: pw.BorderSide(
        color: secondColor,
        width: .5,
      ),
    ),
  ),
  cellAlignment: pw.Alignment.centerLeft,
  cellAlignments: {0: pw.Alignment.centerLeft},
);

// Left curved line chart
final chart2 = pw.Chart(
  right: pw.ChartLegend(),
  grid: pw.CartesianGrid(
    xAxis: pw.FixedAxis([0, 1, 2, 3, 4, 5, 6]),
    yAxis: pw.FixedAxis(
      [0, 10, 20, 30, 40, 50],
      divisions: true,
    ),
  ),
  datasets: [
    pw.LineDataSet(
      legend: 'Expense',
      drawSurface: true,
      isCurved: true,
      drawPoints: false,
      color: baseColor,
      data: List<pw.PointChartValue>.generate(
        dataTable.length,
        (i) {
          final v = dataTable[i][2] as num;
          return pw.PointChartValue(i.toDouble(), v.toDouble());
        },
      ),
    ),
  ],
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

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final pw.Font capriolaReg = await PdfGoogleFonts.capriolaRegular();
    final pw.Font canterllReg = await PdfGoogleFonts.cantarellRegular();

    //final footer = await rootBundle.loadString('assets/footer.png');

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _getCertificadotitle('manejo integral de plagas', capriolaReg),
              pw.SizedBox(height: 20),
              pw.Center(
                child: pw.Text(
                  'Visita durante el año en curso número 7',
                  style: pw.TextStyle(
                    font: capriolaReg,
                    fontSize: 8,
                    color: PdfColors.black,
                  ),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.SizedBox(
                height: 150,
                child: pw.Row(
                  //Este row completo ha de ser reutilizado
                  //en los otros certificados
                  mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                  children: [
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                      children: [
                        _getTableItem(
                          'Fecha',
                          '23 de agosto de 2023',
                          canterllReg,
                          capriolaReg,
                        ),
                        _getTableItem(
                          'Hora de inicio',
                          '9:30am',
                          canterllReg,
                          capriolaReg,
                        ),
                        _getTableItem(
                          'Hora final',
                          '11:30am',
                          canterllReg,
                          capriolaReg,
                        ),
                        _getTableItem(
                          'Duración',
                          '2 horas',
                          canterllReg,
                          capriolaReg,
                        ),
                      ],
                    ),
                    pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                      children: [
                        _getTableItem(
                          'Ciente',
                          'Pollos Frisby',
                          canterllReg,
                          capriolaReg,
                        ),
                        _getTableItem(
                          'Teléfono',
                          '3203994060',
                          canterllReg,
                          capriolaReg,
                        ),
                        _getTableItem(
                          'Email',
                          'firisberto@frisby.com',
                          canterllReg,
                          capriolaReg,
                        ),
                        _getTableItem(
                          'Dirección',
                          'Calle 35 #23-45',
                          canterllReg,
                          capriolaReg,
                        ),
                        _getTableItem(
                          'Municipio',
                          '23 de agosto de 2023',
                          canterllReg,
                          capriolaReg,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'Observaciones generales',
                textAlign: pw.TextAlign.left,
                style: pw.TextStyle(
                  font: capriolaReg,
                  fontSize: 12,
                  color: PdfColor.fromHex('53726A'),
                ),
              ),
              pw.SizedBox(height: 8),
              pw.Text(
                'Se realiza el control integrado de plagas en las instalaciones en general; inspección y verificación, bajo métodos de aplicación de  productos químicos y no químicos, para el control de plagas, en las áreas de producción, almacenamiento, oficinas, baños, comedores, zonas verdes, etc.',
                style: pw.TextStyle(
                  font: canterllReg,
                  fontSize: 10,
                  color: PdfColors.grey700,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'Convención de grados de infestación',
                textAlign: pw.TextAlign.left,
                style: pw.TextStyle(
                  font: capriolaReg,
                  fontSize: 12,
                  color: PdfColor.fromHex('53726A'),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  //Este row completo ha de ser reutilizado
                  //en los otros certificados
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    _getTableItemroedores(
                      '                  Insectos rastreros ',
                      canterllReg,
                      capriolaReg,
                    ),
                  ],
                ),
              ),
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  //Este row completo ha de ser reutilizado
                  //en los otros certificados
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    _getTableItemroedores(
                      '                  Insectos voladores',
                      canterllReg,
                      capriolaReg,
                    ),
                  ],
                ),
              ),
              pw.SizedBox(
                height: 20,
                child: pw.Row(
                  //Este row completo ha de ser reutilizado
                  //en los otros certificados
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    _getTableItemroedores(
                      '                  Roedores                ',
                      canterllReg,
                      capriolaReg,
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 30),
              table2,
              pw.SizedBox(height: 40),
              // pw.Container(
              //   decoration: pw.BoxDecoration(
              //     color: secondColor,
              //   ),
              //   child: pw.Column(children: [
              //     pw.Row(),
              //     pw.Row(children: [
              //       pw.Center(
              //           child: _getSmallBlackText(
              //               'mundocontrolexpertos@gmail.com', capriolaReg)),
              //     ]),
              //     pw.Divider(thickness: 4, color: PdfColors.white),
              //     pw.Row(),
              //   ]),
              // ),
              /*  pw.SizedBox(
                height: 30,
                child: pw.FlutterLogo(),
              ), */
              //Imagen
              // pw.Center(
              //     child: pw.SvgImage(
              //         svg: footer, width: 100, colorFilter: PdfColors.grey)),
            ],
          );
        },
      ),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              table3,
              //QUIMICOS
              pw.SizedBox(height: 20),
              pw.Text(
                'Productos y/o químicos aplicados ó instalados',
                textAlign: pw.TextAlign.left,
                style: pw.TextStyle(
                  font: capriolaReg,
                  fontSize: 12,
                  color: PdfColor.fromHex('53726A'),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.SizedBox(
                height: 25,
                child: pw.Row(
                  //Este row completo ha de ser reutilizado
                  //en los otros certificados
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    _getQuimico(
                      '                                             Producto',
                      '                                          Doscificacion',
                      capriolaReg,
                      capriolaReg,
                    ),
                  ],
                ),
              ),
              pw.SizedBox(
                height: 25,
                child: pw.Row(
                  //Este row completo ha de ser reutilizado
                  //en los otros certificados
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    _getQuimico(
                      '                                      Gel k4',
                      '                                           0.6 gr por 3 punto de aplicación',
                      canterllReg,
                      canterllReg,
                    ),
                  ],
                ),
              ),
              pw.SizedBox(
                height: 25,
                child: pw.Row(
                  //Este row completo ha de ser reutilizado
                  //en los otros certificados
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    _getQuimico(
                      '                                      Tenopa S.C',
                      '                                  0.5 gr por 5 punto de aplicación',
                      canterllReg,
                      canterllReg,
                    ),
                  ],
                ),
              ),
              pw.SizedBox(
                height: 25,
                child: pw.Row(
                  //Este row completo ha de ser reutilizado
                  //en los otros certificados
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    _getQuimico(
                      '                                      Murder S.C',
                      '                                  1 gr por 5 punto de aplicación',
                      canterllReg,
                      canterllReg,
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                'Recomendaciones',
                textAlign: pw.TextAlign.left,
                style: pw.TextStyle(
                  font: capriolaReg,
                  fontSize: 12,
                  color: PdfColor.fromHex('53726A'),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Text(
                paragraph,
                textAlign: pw.TextAlign.left,
                style: pw.TextStyle(
                  font: canterllReg,
                  fontSize: 10,
                  color: PdfColors.grey700,
                ),
              ),
              //lo ultimo
              pw.SizedBox(height: 250),
              //TODO (any): Buscar forma de poner esto como un footer fijo que se agregue siempre al final de la página
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Text(
                        'Verificador/a',
                        style: pw.TextStyle(
                          font: capriolaReg,
                          fontSize: 12,
                          color: PdfColor.fromHex('53726A'),
                        ),
                      ),
                      pw.SizedBox(height: 22),
                      pw.Text(
                        'Carolina Marín',
                        style: pw.TextStyle(
                          font: capriolaReg,
                          fontSize: 12,
                          color: PdfColors.grey,
                        ),
                      ),
                      pw.Text(
                        'Auxiliar de cocina',
                        style: pw.TextStyle(
                          font: canterllReg,
                          fontSize: 8,
                          color: PdfColors.grey,
                        ),
                      ),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Carlos Alberto Echavarría A.',
                        style: pw.TextStyle(
                          font: capriolaReg,
                          fontSize: 12,
                          fontWeight: pw.FontWeight.normal,
                          color: PdfColors.black,
                        ),
                      ),
                      //TODO (camilo, sebas): agregar firma (SVG)
                      pw.Text(
                        'Gerente',
                        style: pw.TextStyle(
                          font: capriolaReg,
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
    pdf.addPage(
      pw.Page(
        pageFormat: format,
        //theme: theme,
        build: (context) {
          // Page layout
          return pw.Column(
            children: [
              pw.Center(child: _getTitle('Tendencias', capriolaReg)),
              pw.Divider(thickness: 4, color: PdfColors.grey),
              pw.SizedBox(height: 20),
              pw.Center(
                  child: _getSubtitle('Historico de plagas', capriolaReg)),
              pw.Center(
                  child: _getSmallBlackText('Ultimos 6 Meses', capriolaReg)),
              pw.SizedBox(height: 20),

              pw.Expanded(flex: 3, child: chart1),

              pw.Divider(),
              pw.SizedBox(height: 20),
              pw.Center(
                  child: _getSubtitle('Tendencia de plagas', capriolaReg)),
              pw.SizedBox(height: 20),
              table,
              //pw.Expanded(flex: 2, child: chart2),
              pw.SizedBox(height: 30),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Expanded(
                      child: pw.Column(children: [
                    pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      padding: const pw.EdgeInsets.only(bottom: 10),
                      child: pw.Text(
                        'Expense By Sub-Categories',
                        style: const pw.TextStyle(
                          color: baseColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    pw.Text(
                      'Total expenses are broken into different categories for closer look into where the money was spent.',
                      textAlign: pw.TextAlign.justify,
                    )
                  ])),
                  pw.SizedBox(width: 10),
                  pw.Expanded(
                    child: pw.Column(
                      children: [
                        pw.Container(
                          alignment: pw.Alignment.centerLeft,
                          padding: const pw.EdgeInsets.only(bottom: 10),
                          child: pw.Text(
                            'Spent vs. Saved',
                            style: const pw.TextStyle(
                              color: baseColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        pw.Text(
                          'Budget was originally \$$budget. A total of \$$expense was spent on the month of January which exceeded the overall budget by \$${expense - budget}',
                          textAlign: pw.TextAlign.justify,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        //theme: theme,
        build: (context) {
          const chartColors = [
            PdfColors.blue300,
            PdfColors.green300,
            PdfColors.amber300,
            PdfColors.pink300,
            PdfColors.cyan300,
            PdfColors.purple300,
            PdfColors.lime300,
          ];

          return pw.Column(
            children: [
              pw.Flexible(
                child: pw.Chart(
                  title: pw.Text(
                    'Expense breakdown',
                    style: const pw.TextStyle(
                      color: baseColor,
                      fontSize: 20,
                    ),
                  ),
                  grid: pw.PieGrid(),
                  datasets:
                      List<pw.Dataset>.generate(dataTable.length, (index) {
                    final data = dataTable[index];
                    final color = chartColors[index % chartColors.length];
                    final value = (data[2] as num).toDouble();
                    final pct = (value / expense * 100).round();
                    return pw.PieDataSet(
                      legend: '${data[0]}\n$pct%',
                      value: value,
                      color: color,
                      legendStyle: const pw.TextStyle(fontSize: 10),
                    );
                  }),
                ),
              ),
              //chart2,
              table,
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}

/* List<String> products = [
      'ROdeores',
      'Item 1',
      'otro item',
      'nuevo item',
      'mosquitos'
    ];

    pw.Widget _contentTable(pw.Context context) {
      const tableHeaders = [
        'SKU#',
        'Item Description',
        'Price',
        'Quantity',
        'Total'
      ];

      return pw.TableHelper.fromTextArray(
        border: null,
        cellAlignment: pw.Alignment.centerLeft,
        headerDecoration: pw.BoxDecoration(
          borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
        ),
        headerHeight: 25,
        cellHeight: 40,
        cellAlignments: {
          0: pw.Alignment.centerLeft,
          1: pw.Alignment.centerLeft,
          2: pw.Alignment.centerRight,
          3: pw.Alignment.center,
          4: pw.Alignment.centerRight,
        },
        headerStyle: pw.TextStyle(
          fontSize: 10,
          fontWeight: pw.FontWeight.bold,
        ),
        cellStyle: const pw.TextStyle(
          fontSize: 10,
        ),
        rowDecoration: pw.BoxDecoration(
          border: pw.Border(
            bottom: pw.BorderSide(
              width: .5,
            ),
          ),
        ),
        headers: List<String>.generate(
          tableHeaders.length,
          (col) => tableHeaders[col],
        ),
        data: List<List<String>>.generate(
          products.length,
          (row) => List<String>.generate(
            tableHeaders.length,
            (col) => products[row],
          ),
        ),
      );
    }
 */
