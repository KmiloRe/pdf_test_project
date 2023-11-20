part of model;

@immutable
class MceVisit {
  const MceVisit({
    this.id = '',
    this.date = '',
    this.serviceType = '',
    this.initialHour = '',
    this.endHour = '',
    this.verifiedBy = '',
    this.verifyerPosition = '',
    this.workerName = '',
    this.notes = '',
    this.controlledAreas = const [],
    this.infestationGrades = const {},
    this.chemicalsApplied = const [],
    this.higienicalRecomendations = const [],
    this.locationRecomendations = const [],
    this.visitPhotoList = const [],
    this.initialPhotoUrl = '',
    this.finalPhotoUrl = '',
    this.isCompleted = false,
    this.visitsId = '',
    this.clientName = '',
    this.productPhotoUrl = '',
  });

  final String id;
  final String date;
  final String serviceType;
  final String initialHour;
  final String endHour;
  final String verifiedBy;
  final String verifyerPosition;
  final String workerName;
  final String notes;
  final List<String> controlledAreas;
  final Map<String, dynamic> infestationGrades;
  final List<Map<String, dynamic>> chemicalsApplied;
  final List<String> higienicalRecomendations;
  final List<String> locationRecomendations;
  final List<Map<String, dynamic>> visitPhotoList;
  final String initialPhotoUrl;
  final String finalPhotoUrl;
  final bool isCompleted;
  final String visitsId;
  final String clientName;
  final String productPhotoUrl;

  factory MceVisit.fromMap(Map<String, dynamic> data) {
    List<Map<String, dynamic>> chemicalsApplied = [];
    List<Map<String, dynamic>> visitPhotoList = [];

    if (data['chemicalsApplied'] != null) {
      chemicalsApplied = (data['chemicalsApplied'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList();
    }

    if (data['visitPhotoList'] != null) {
      visitPhotoList = (data['visitPhotoList'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList();
    }

    return MceVisit(
      id: data['id'] ?? '',
      date: data['date'] ?? '',
      serviceType: data['serviceType'] ?? '',
      initialHour: data['initialHour'] ?? '',
      endHour: data['endHour'] ?? '',
      verifiedBy: data['verifiedBy'] ?? '',
      verifyerPosition: data['verifyerPosition'] ?? '',
      workerName: data['workerName'] ?? '',
      notes: data['notes'] ?? '',
      controlledAreas: <String>[...data['controlledAreas'] ?? []],
      infestationGrades: {...data['infestationGrades'] ?? {}},
      chemicalsApplied: chemicalsApplied,
      higienicalRecomendations: <String>[
        ...data['higienicalRecomendations'] ?? []
      ],
      locationRecomendations: <String>[...data['locationRecomendations'] ?? []],
      visitPhotoList: visitPhotoList,
      initialPhotoUrl: data['initialPhotoUrl'] ?? '',
      finalPhotoUrl: data['finalPhotoUrl'] ?? '',
      isCompleted: data['isCompleted'] ?? false,
      visitsId: data['visitsId'] ?? '',
      clientName: data['clientName'] ?? '',
      productPhotoUrl: data['productPhotoUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'serviceType': serviceType,
      'initialHour': initialHour,
      'endHour': endHour,
      'verifiedBy': verifiedBy,
      'verifyerPosition': verifyerPosition,
      'workerName': workerName,
      'notes': notes,
      'controlledAreas': controlledAreas,
      'infestationGrades': infestationGrades,
      'chemicalsApplied': chemicalsApplied,
      'higienicalRecomendations': higienicalRecomendations,
      'locationRecomendations': locationRecomendations,
      'visitPhotoList': visitPhotoList,
      'initialPhotoUrl': initialPhotoUrl,
      'finalPhotoUrl': finalPhotoUrl,
      'isCompleted': isCompleted,
      'visitsId': visitsId,
      'clientName': clientName,
      'productPhotoUrl': productPhotoUrl,
    };
  }
}
