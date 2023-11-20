part of pdf;

pw.Widget pdfdiplomaHeader(pw.Widget image) => pw.Row(children: [
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(horizontal: 0),
        child: pw.Container(
          alignment: pw.Alignment.center,
          width: 120,
          child: image,
        ),
      ),
      pw.SizedBox(width: 20),
      pw.Column(children: [
        pw.SizedBox(height: 10),
        pw.SizedBox(
          width: 260,
          child: pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(
              'Mundo Control Expertos',
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
              textAlign: pw.TextAlign.center,
            ),
          ),
        ),
        pw.SizedBox(height: 20),
        pw.SizedBox(
          width: 260,
          child: pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(
              'Nit 9014313983',
              style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.normal,
              ),
              textAlign: pw.TextAlign.center,
            ),
          ),
        ),
        pw.SizedBox(
          width: 260,
          child: pw.Align(
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(
              'Dirección: Calle 58 # 35 - 94 Barrio Boston',
              style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.normal,
              ),
              textAlign: pw.TextAlign.center,
            ),
          ),
        ),
      ]),
    ]);





    // pw.Table(
    //   defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
    //   border: pw.TableBorder.all(
    //     width: 0.5,
    //   ),
    //   children: [
    //     pw.TableRow(
    //       children: [
    //         pw.Padding(
    //           padding: const pw.EdgeInsets.symmetric(horizontal: 10),
    //           child: pw.Container(
    //             alignment: pw.Alignment.center,
    //             width: 45,
    //             child: image,
    //           ),
    //         ),
    //         pw.SizedBox(
    //           width: 260,
    //           child: pw.Center(
    //             child: pw.Text(
    //               'Certificado M.I.P\nMundo Control Expertos',
    //               style: pw.TextStyle(
    //                 fontSize: 18,
    //                 fontWeight: pw.FontWeight.normal,
    //               ),
    //               textAlign: pw.TextAlign.center,
    //             ),
    //           ),
    //         ),
    //         pw.Center(
    //           child: pw.Table(
    //             defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
    //             border: pw.TableBorder.all(),
    //             children: [
    //               headerTextRow('Código: F - OP - 03'),
    //               headerTextRow('Versión: 03'),
    //               headerTextRow('Fecha de emisión:\n$date'),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ],
    // );
