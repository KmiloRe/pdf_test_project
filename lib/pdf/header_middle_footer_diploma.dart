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
              bigHeaderContentTextRow(
                textField: 'Cliente',
                content: client.name.isEmpty
                    ? 'Supermercado Merkepaisa'
                    : client.name,
                // isPrimary: true,
              ),
            ],
          ),
          pw.TableRow(
            children: [
              bigHeaderContentTextRow(
                textField: 'Sede',
                content: client.location.isEmpty ? 'Caldas' : client.location,
              ),
            ],
          ),
          pw.TableRow(
            children: [
              bigHeaderContentTextRow(
                //isPrimary: true,
                textField: 'Tipo de servicio',
                content: visit.serviceType.isEmpty
                    ? 'Control general'
                    : visit.serviceType,
              ),
            ],
          ),
          pw.TableRow(
            children: [
              bigHeaderContentTextRow(
                // isPrimary: true,
                textField: 'Fecha de servicio',
                content: visit.date.isEmpty ? 'Hoy' : visit.date,
              ),
            ],
          ),
          pw.TableRow(
            children: [
              bigHeaderContentTextRow(
                // isPrimary: true,
                textField: 'Áreas controladas',
                content: visit.controlledAreas.isEmpty
                    ? "Punto de venta, carnicería, fruver, cajas, bodega, shut de basuras, baños, lockers, cafetín y monitoreo."
                    : visit.controlledAreas.join(", "),
              ),
            ],
          ),
        ],
      ),
      pw.SizedBox(width: 100),
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(horizontal: 0),
        child: pw.Container(
          alignment: pw.Alignment.center,
          width: 400,
          child: image,
        ),
      ),
    ]);

pw.Widget pdfdiplomaFootersection(
        pw.Widget image, MceVisit visit, MceUser client) =>
    pw.Row(children: [
      pw.Table(
        defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
        children: [
          pw.TableRow(
            children: [
              diplomafooterTextRow(
                textField: 'Fecha de emisión certificado:',
                content: visit.date.isEmpty ? 'Hoy' : visit.date,
              ),
            ],
          ),
          pw.TableRow(
            children: [
              diplomafooterTextRow(
                textField: 'Código',
                content: 'F -OP -03v',
              ),
            ],
          ),
        ],
      ),
      pw.SizedBox(width: 400),
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(horizontal: 0),
        child: pw.Container(
          alignment: pw.Alignment.center,
          width: 200,
          child: image,
        ),
      ),
    ]);
