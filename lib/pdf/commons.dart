part of pdf;

pw.TableRow headerTextRow(String text) => pw.TableRow(
      children: [
        pw.SizedBox(
          height: 30,
          child: pw.Center(
            child: pw.Text(
              text,
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                fontSize: 8,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );

pw.TableRow subtextTextRow(String text) => pw.TableRow(
      children: [
        pw.SizedBox(
          height: 30,
          child: pw.Center(
            child: pw.Text(
              text,
              textAlign: pw.TextAlign.center,
              style: const pw.TextStyle(
                fontSize: 9,
              ),
            ),
          ),
        ),
      ],
    );

pw.Widget headerContentTextRow(
        {required String textField,
        required String content,
        bool isPrimary = false}) =>
    pw.SizedBox(
      width: isPrimary ? 140 : 100,
      height: 30,
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: [
          pw.ConstrainedBox(
            constraints: pw.BoxConstraints(
              maxWidth: isPrimary ? 140 : 100,
            ),
            child: pw.Text(
              "$textField:",
              overflow: pw.TextOverflow.clip,
              textAlign: pw.TextAlign.start,
              style: pw.TextStyle(
                fontSize: 9,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.SizedBox(
            width: 5,
          ),
          pw.ConstrainedBox(
            constraints: pw.BoxConstraints(
              maxWidth: isPrimary ? 140 : 100,
            ),
            child: pw.Text(
              content,
              overflow: pw.TextOverflow.clip,
              textAlign: pw.TextAlign.start,
              style: const pw.TextStyle(
                fontSize: 8,
              ),
            ),
          ),
        ],
      ),
    );

pw.Widget tableContentTextRow(
  String textField,
) =>
    pw.SizedBox(
      width: double.infinity,
      height: 30,
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: [
          pw.ConstrainedBox(
            constraints: const pw.BoxConstraints(
              maxWidth: double.infinity,
            ),
            child: pw.Text(
              textField,
              overflow: pw.TextOverflow.clip,
              textAlign: pw.TextAlign.start,
              style: const pw.TextStyle(
                fontSize: 9,
              ),
            ),
          ),
          pw.SizedBox(
            width: 5,
          ),
        ],
      ),
    );

pw.Widget allblackNowidthlimitContentTextRow({
  required String textField,
  required String content,
}) =>
    pw.SizedBox(
      width: double.infinity,
      height: 30,
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: [
          pw.ConstrainedBox(
            constraints: const pw.BoxConstraints(
              maxWidth: double.infinity,
            ),
            child: pw.Text(
              "$textField:",
              overflow: pw.TextOverflow.clip,
              textAlign: pw.TextAlign.start,
              style: pw.TextStyle(
                fontSize: 8,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.SizedBox(
            width: 5,
          ),
          pw.ConstrainedBox(
            constraints: const pw.BoxConstraints(
              maxWidth: double.infinity,
            ),
            child: pw.Text(
              content,
              overflow: pw.TextOverflow.clip,
              textAlign: pw.TextAlign.start,
              style: pw.TextStyle(
                fontSize: 8,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

pw.Widget bigHeaderContentTextRow(
        {required String textField,
        required String content,
        bool isPrimary = false}) =>
    pw.SizedBox(
      width: isPrimary ? 140 : 300,
      height: 30,
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        children: [
          pw.ConstrainedBox(
            constraints: pw.BoxConstraints(
              maxWidth: isPrimary ? 140 : 200,
            ),
            child: pw.Text(
              "$textField:",
              overflow: pw.TextOverflow.clip,
              textAlign: pw.TextAlign.start,
              style: pw.TextStyle(
                fontSize: 13,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
          pw.SizedBox(
            width: 5,
          ),
          pw.ConstrainedBox(
            constraints: pw.BoxConstraints(
              maxWidth: isPrimary ? 140 : 200,
            ),
            child: pw.Text(
              content,
              overflow: pw.TextOverflow.clip,
              textAlign: pw.TextAlign.start,
              style: const pw.TextStyle(
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );

pw.Widget coloredWidthBox(double widthSize) => pw.Container(
      width: widthSize,
      height: 20,
      decoration: const pw.BoxDecoration(
        color: PdfColors.grey300,
      ),
    );

pw.Widget fullWidthTextRow(
        {required String textField, required String content}) =>
    pw.Align(
      alignment: pw.Alignment.topLeft,
      child: pw.Wrap(
        alignment: pw.WrapAlignment.start,
        children: [
          pw.Text(
            "$textField:",
            overflow: pw.TextOverflow.clip,
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(
              fontSize: 10,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(
            width: 5,
          ),
          pw.Text(
            content,
            overflow: pw.TextOverflow.clip,
            textAlign: pw.TextAlign.justify,
            style: const pw.TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );

pw.Widget diplomafooterTextRow(
        {required String textField, required String content}) =>
    pw.SizedBox(
      child: pw.Wrap(
        alignment: pw.WrapAlignment.start,
        children: [
          pw.Text(
            "$textField:",
            overflow: pw.TextOverflow.clip,
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(
              fontSize: 8,
              fontWeight: pw.FontWeight.normal,
            ),
          ),
          pw.SizedBox(
            width: 5,
          ),
          pw.Text(
            content,
            overflow: pw.TextOverflow.clip,
            textAlign: pw.TextAlign.justify,
            style: const pw.TextStyle(
              fontSize: 8,
            ),
          ),
        ],
      ),
    );

pw.Widget signaturefooter(
        {required String textField, required String content}) =>
    pw.Align(
      alignment: pw.Alignment.topLeft,
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            "____________________________",
            overflow: pw.TextOverflow.clip,
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(
              fontSize: 10,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Text(
            "$textField:",
            overflow: pw.TextOverflow.clip,
            textAlign: pw.TextAlign.justify,
            style: const pw.TextStyle(
              fontSize: 10,
            ),
          ),
          pw.Text(
            content,
            overflow: pw.TextOverflow.clip,
            textAlign: pw.TextAlign.justify,
            style: pw.TextStyle(
              fontSize: 10,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
        ],
      ),
    );
