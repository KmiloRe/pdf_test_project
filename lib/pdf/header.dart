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
                width: 45,
                child: image,
              ),
            ),
            pw.SizedBox(
              width: 260,
              child: pw.Center(
                child: pw.Text(
                  'Certificado M.I.P\nMundo Control Expertos',
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
                  headerTextRow('Fecha de emisión:\n$date'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
