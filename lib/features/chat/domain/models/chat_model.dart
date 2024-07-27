class ChatModel {
  final String id;
  final String sentUserId;
  final String sentUserName;
  final String? message;
  final String? imageUrl;
  final DateTime timestamp;

  ChatModel({
    required this.id,
    required this.sentUserId,
    required this.sentUserName,
    this.message,
    this.imageUrl,
    required this.timestamp,
  });
}
