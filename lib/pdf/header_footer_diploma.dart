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

pw.Widget pdfdiplomaMiddlesection(
        pw.Widget image, MceVisit visit, MceUser client) =>
    pw.Row(children: [
      pw.Table(
        defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
        children: [
          pw.TableRow(
            children: [
              headerContentTextRow(
                textField: 'Cliente',
                content: client.name.isEmpty
                    ? 'Supermercado Merkepaisa'
                    : client.name,
                isPrimary: true,
              ),
            ],
          ),
          pw.TableRow(
            children: [
              headerContentTextRow(
                textField: 'Sede',
                content: client.location.isEmpty ? 'Caldas' : client.location,
              ),
            ],
          ),
          pw.TableRow(
            children: [
              headerContentTextRow(
                isPrimary: true,
                textField: 'Tipo de servicio',
                content: visit.serviceType.isEmpty
                    ? 'Control general'
                    : 'Control general de instalaciones',
              ),
            ],
          ),
          pw.TableRow(
            children: [
              headerContentTextRow(
                isPrimary: true,
                textField: 'Fecha de servicio',
                content: visit.date.isEmpty ? 'Hoy' : visit.date,
              ),
            ],
          ),
        ],
      ),
      pw.SizedBox(width: 520),
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(horizontal: 0),
        child: pw.Container(
          alignment: pw.Alignment.center,
          width: 60,
          child: image,
        ),
      ),
    ]);
