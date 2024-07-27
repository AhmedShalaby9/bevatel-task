class ChatEntity {
  final String id;
  final String sentUserId;
  final String sentUserName;
  final String message;
  final DateTime timestamp;

  ChatEntity({
    required this.id,
    required this.sentUserId,
    required this.sentUserName,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sentUserId': sentUserId,
      'sentUserName': sentUserName,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  static ChatEntity fromJson(Map<String, dynamic> json) {
    return ChatEntity(
      id: json['id'],
      sentUserId: json['sentUserId'],
      sentUserName: json['sentUserName'],
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
