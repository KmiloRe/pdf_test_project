part of model;

@immutable
class MceUser {
  const MceUser({
    this.name = '',
    this.email = '',
    this.userId = '',
    this.documentList = const [],
    this.role = 'Client',
    this.documentNumber = '',
    this.phoneNumber = '',
    this.location = '',
    this.responsibleName = '',
    this.clientNumber = '',
    this.visitList = const [],
    this.clientAdminPermission = false,
  });

  final String name;
  final String email;
  final String userId;
  final String documentNumber;
  final String phoneNumber;
  final String location;
  final String responsibleName;
  final List<MceDocument> documentList;
  final List<MceVisit> visitList;
  final bool clientAdminPermission;
  final String clientNumber;
  final String role;

  factory MceUser.fromMap(Map<String, dynamic> data) {
    //VisitList no está aquí porque viene de otra colección
    List<MceDocument> documentList = [];

    if (data['documentList'] != null) {
      documentList = (data['documentList'] as List<dynamic>)
          .map((e) => MceDocument.fromMap(e as Map<String, dynamic>))
          .toList();
    }

    return MceUser(
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      userId: data['userId'] ?? '',
      documentList: documentList,
      role: 'client',
      documentNumber: data['documentNumber'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      location: data['location'] ?? '',
      responsibleName: data['responsibleName'] ?? '',
      clientNumber: data['clientNumber'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        //Tampoco está acá visitList porque no se guarda en la colección de usuarios
        'name': name,
        'email': email,
        'userId': userId,
        'role': 'client',
        'documentNumber': documentNumber,
        'phoneNumber': phoneNumber,
        'location': location,
        'responsibleName': responsibleName,
        'clientNumber': clientNumber,
      };

  MceUser copyWith({
    String? userId,
    String? name,
    String? email,
    List<MceDocument>? documentList,
    String? role,
    String? documentNumber,
    String? phoneNumber,
    String? location,
    String? responsibleName,
    String? clientNumber,
    List<MceVisit>? visitList,
    bool? clientAdminPermission,
  }) {
    return MceUser(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      documentList: documentList ?? this.documentList,
      role: role ?? this.role,
      documentNumber: documentNumber ?? this.documentNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      location: location ?? this.location,
      responsibleName: responsibleName ?? this.responsibleName,
      clientNumber: clientNumber ?? this.clientNumber,
      visitList: visitList ?? this.visitList,
      clientAdminPermission:
          clientAdminPermission ?? this.clientAdminPermission,
    );
  }
}
