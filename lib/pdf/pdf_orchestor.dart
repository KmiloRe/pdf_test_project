part of pdf;

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

Future<pw.Widget> getImageconvencion() async {
  final img =
      await rootBundle.load('assets/images/convencionesinfestacion.png');
  final imageBytes = img.buffer.asUint8List();
  pw.Image image1 = pw.Image(pw.MemoryImage(imageBytes));
  return image1;
}

// Future<void> generatePdf(
//     {required MceVisit visit, required MceUser client}) async {
//   pw.Widget image = await getImage();
//   final pdf = pw.Document();
//   pdf.addPage(
//     pw.Page(
//       pageFormat: PdfPageFormat.letter,
//       build: (pw.Context context) {
//         return pw.Center(
//           child: pw.Column(
//             children: [
//               pdfHeader(image, '12/11/2023'),
//               pw.SizedBox(height: 10),
//               pdfHeaderContentTable(visit, client),
//               pw.SizedBox(height: 10),
//               fullWidthTextRow(
//                 textField: 'Áreas controladas',
//                 content: visit.controlledAreas.isEmpty
//                     ? "Punto de venta, carnicería, fruver, cajas, bodega, shut de basuras, baños, lockers, cafetín y monitoreo."
//                     : visit.controlledAreas.join(" "),
//               ),
//               pw.SizedBox(height: 10),
//               fullWidthTextRow(
//                 textField: 'Observaciones',
//                 content: visit.notes.isEmpty
//                     ? '''Se realiza el control integrado de plagas en las instalaciones en general; inspección y verificación, bajo métodos de aplicación de insecticida líquido en Solución Concentrada S.C o Emulsión Concentrada E.C por aspersión, insecticida en gel por dosificación en gotas y vapor de agua a una temperatura de 135 a 169 grados centígrados; a nivel de puntos estratégicos y/o críticos. Durante la intervención no se identificó presencia de plagas; insectos rastreros, voladores o roedores. Los vectores son controlados debido a los buenos hábitos higiénicos, locativos y distribución de objetos. Contribuyendo a la eficacia del programa de Manejo Integrado de Plagas.
//                       \nPara evitar una contaminación cruzada por favor realizar aseo profundo y desinfección al ambiente en áreas de producción antes de iniciar operaciones.'''
//                     : visit.notes,
//               ),
//               //coloredWidthBox(400),
//             ],
//           ),
//         ); // Center
//       },
//     ),
//   );
//   var savedFile = await pdf.save();
//   List<int> fileInts = List.from(savedFile);
//   html.AnchorElement(
//       href:
//           "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}")
//     ..setAttribute("download", "${DateTime.now().millisecondsSinceEpoch}.pdf")
//     ..click();
// }
