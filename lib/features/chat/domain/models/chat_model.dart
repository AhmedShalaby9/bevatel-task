import '../../data/entities/chat_entity.dart';

class ChatModel extends ChatEntity {
  ChatModel({
    required String id,
    required String sentUserId,
    required String sentUserName,
    required String message,
    required DateTime timestamp,
  }) : super(
    id: id,
    sentUserId: sentUserId,
    sentUserName: sentUserName,
    message: message,
    timestamp: timestamp,
  );

  factory ChatModel.fromEntity(ChatEntity entity) {
    return ChatModel(
      id: entity.id,
      sentUserId: entity.sentUserId,
      sentUserName: entity.sentUserName,
      message: entity.message,
      timestamp: entity.timestamp,
    );
  }
}
