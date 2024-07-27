class TravelEntity {
  final String? id;
  final String? title;
  final String? description;
  final String? from;
  final String? to;
  final int? numberOfPersons;

  const TravelEntity({
    this.id,
    this.title,
    this.description,
    this.from,
    this.to,
    this.numberOfPersons,
  });

  factory TravelEntity.fromJson(Map<String, dynamic> json) {
    return TravelEntity(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      from: json['from'] as String?,
      to: json['to'] as String?,
      numberOfPersons: json['number_of_persons'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'from': from,
      'to': to,
      'number_of_persons': numberOfPersons,
    };
  }
}
