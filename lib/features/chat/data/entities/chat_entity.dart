class ChatEntity {
  final String id;
  final String sentUserId;
  final String sentUserName;
  final String? message;
  final String? imageUrl;
  final DateTime timestamp;

  ChatEntity({
    required this.id,
    required this.sentUserId,
    required this.sentUserName,
    this.message,
    this.imageUrl,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sentUserId': sentUserId,
      'sentUserName': sentUserName,
      'message': message,
      'imageUrl': imageUrl,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  static ChatEntity fromJson(Map<String, dynamic> json) {
    return ChatEntity(
      id: json['id'],
      sentUserId: json['sentUserId'],
      sentUserName: json['sentUserName'],
      message: json['message'],
      imageUrl: json['imageUrl'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  ChatEntity copyWith({
    String? id,
    String? sentUserId,
    String? sentUserName,
    String? message,
    String? imageUrl,
    DateTime? timestamp,
  }) {
    return ChatEntity(
      id: id ?? this.id,
      sentUserId: sentUserId ?? this.sentUserId,
      sentUserName: sentUserName ?? this.sentUserName,
      message: message ?? this.message,
      imageUrl: imageUrl ?? this.imageUrl,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
