part of pdf;

pw.Widget pdfdiplomaHeader(pw.Widget image, String date) => pw.Row(children: [
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(horizontal: 0),
        child: pw.Container(
          alignment: pw.Alignment.center,
          width: 150,
          child: image,
        ),
      ),
      pw.Column(children: [
        pw.SizedBox(
          width: 260,
          child: pw.Center(
            child: pw.Text(
              'Mundo Control Expertos',
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.bold,
              ),
              textAlign: pw.TextAlign.center,
            ),
          ),
        ),
        pw.SizedBox(
          width: 260,
          child: pw.Center(
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
