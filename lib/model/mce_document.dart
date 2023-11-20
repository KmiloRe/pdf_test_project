part of model;

class MceDocument {
  const MceDocument({
    required this.title,
    required this.id,
    required this.date,
    required this.url,
  });

  final String title;
  final String id;
  final String date;
  final String url;

  factory MceDocument.fromMap(Map<String, dynamic>? data) => MceDocument(
        title: data?['title'] ?? '',
        id: data?['id'] ?? '',
        date: data?['date'] ?? '',
        url: data?['url'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'id': id,
        'url': url,
        'date': date,
      };
}
