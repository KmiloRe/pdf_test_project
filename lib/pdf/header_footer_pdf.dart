part of pdf;

pw.Widget pdfHeader(pw.Widget image, String date) => pw.Table(
      defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
      border: pw.TableBorder.all(
        width: 0.5,
      ),
      children: [
        pw.TableRow(
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: 10),
              child: pw.Container(
                alignment: pw.Alignment.center,
                width: 30,
                child: image,
              ),
            ),
            pw.SizedBox(
              width: 260,
              child: pw.Center(
                child: pw.Text(
                  'CERTIFICADO M.I.P\nMUNDO CONTROL EXPERTOS',
                  style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.normal,
                  ),
                  textAlign: pw.TextAlign.center,
                ),
              ),
            ),
            pw.Center(
              child: pw.Table(
                defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
                border: pw.TableBorder.all(),
                children: [
                  headerTextRow('Código: F - OP - 03'),
                  headerTextRow('Versión: 03'),
                  headerTextRow('Fecha: 06/10/2021'),
                ],
              ),
            ),
          ],
        ),
      ],
    );

pw.Widget pdffooter(pw.Widget image, MceVisit visit) => pw.Row(children: [
      pw.Table(
        defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
        children: [
          pw.TableRow(
            children: [
              pw.SizedBox(width: 20),
              pw.Column(children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(horizontal: 0),
                  child: pw.Container(
                    alignment: pw.Alignment.center,
                    width: 200,
                    child: image,
                  ),
                ),
                signaturefooter(
                  //isPrimary: true,
                  textField: visit.verifiedBy.isEmpty ? '' : visit.verifiedBy,
                  content: visit.verifyerPosition.isEmpty
                      ? 'Verificador@ en el lugar'
                      : visit.verifyerPosition,
                ),
              ]),
              pw.SizedBox(width: 150),
              pw.Column(children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(horizontal: 0),
                  child: pw.Container(
                    alignment: pw.Alignment.center,
                    width: 200,
                    child: image,
                  ),
                ),
                signaturefooter(
                  //isPrimary: true,
                  textField: 'CARLOS ALBERTO ECHAVARRIA A.',
                  content: 'Gerente',
                ),
              ]),
              pw.SizedBox(width: 20),
            ],
          ),
        ],
      ),
    ]);
