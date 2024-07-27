class ChatEntity {
  final String id;
  final String title;
  final String lastMessage;
  final String time;

  ChatEntity({
    required this.id,
    required this.title,
    required this.lastMessage,
    required this.time,
  });

  factory ChatEntity.fromJson(Map<String, dynamic> json) {
    return ChatEntity(
      id: json['id'],
      title: json['title'],
      lastMessage: json['last_message'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'last_message': lastMessage,
      'time': time,
    };
  }
}
