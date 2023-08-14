import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pdf = pw.Document();

  @override
  void initState() {
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: PdfPreview(
        build: (format) => _generatePdf(format, 'Test'),
      ),
    );
  }

  pw.Widget _getTitlte(String certifType, pw.Font font) => pw.Text(
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

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _getTitlte('manejo integral de plagas', capriolaReg),
              pw.SizedBox(height: 20),
              pw.Center(child: _getSubtitle('Resumen', capriolaReg)),
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
                'Zona caliente, zona preparación, neveras, barra, cajas registradoras, zona de lavado',
                style: pw.TextStyle(
                  font: canterllReg,
                  fontSize: 10,
                  color: PdfColors.grey700,
                ),
              ),
              pw.SizedBox(height: 128),
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
              /*  pw.SizedBox(
                height: 30,
                child: pw.FlutterLogo(),
              ), */
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
