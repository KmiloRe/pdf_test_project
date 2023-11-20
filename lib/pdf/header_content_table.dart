part of pdf;

pw.Widget pdfHeaderContentTable(MceVisit visit, MceUser client) {
  return pw.Table(
    defaultVerticalAlignment: pw.TableCellVerticalAlignment.middle,
    children: [
      pw.TableRow(
        children: [
          headerContentTextRow(
            textField: 'Cliente',
            content:
                client.name.isEmpty ? 'Supermercado Merkepaisa' : client.name,
            isPrimary: true,
          ),
          headerContentTextRow(
            textField: 'Sede',
            content: client.location.isEmpty ? 'Caldas' : client.location,
          ),
          headerContentTextRow(
            textField: 'Dirección',
            content: 'Carrera 50# 125sur-234',
          ),
        ],
      ),
      pw.TableRow(
        children: [
          headerContentTextRow(
            textField: 'Teléfono',
            content:
                client.phoneNumber.isEmpty ? '448 18 18' : client.phoneNumber,
            isPrimary: true,
          ),
          headerContentTextRow(
            textField: 'Municipio',
            content: client.location.isEmpty ? 'Caldas' : client.location,
          ),
          headerContentTextRow(
            textField: 'Fecha',
            content:
                visit.date.isEmpty ? '12 de septiembre de 2023' : visit.date,
          ),
        ],
      ),
      pw.TableRow(
        children: [
          headerContentTextRow(
            textField: 'Tipo de Servicio',
            content: visit.serviceType.isEmpty
                ? 'Control general en instalaciones'
                : visit.serviceType,
            isPrimary: true,
          ),
          headerContentTextRow(
            textField: visit.initialHour.isEmpty
                ? 'Hora inicio servicio'
                : visit.initialHour,
            content: '10:00am',
          ),
          headerContentTextRow(
            textField:
                visit.endHour.isEmpty ? 'Hora final servicio' : visit.endHour,
            content: '12:00pm',
          ),
        ],
      ),
      pw.TableRow(
        children: [
          headerContentTextRow(
            textField: 'Nobre del técnico(a)',
            content: visit.workerName.isEmpty
                ? 'Carlos Echavarria'
                : visit.workerName,
            isPrimary: true,
          ),
        ],
      ),
    ],
  );
}
