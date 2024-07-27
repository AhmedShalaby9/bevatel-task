import '../../data/entities/chat_entity.dart';

class ChatModel extends ChatEntity {
  ChatModel({
    required String id,
    required String title,
    required String lastMessage,
    required String time,
  }) : super(id: id, title: title, lastMessage: lastMessage, time: time);

  factory ChatModel.fromEntity(ChatEntity entity) {
    return ChatModel(
      id: entity.id,
      title: entity.title,
      lastMessage: entity.lastMessage,
      time: entity.time,
    );
  }

  ChatEntity toEntity() {
    return ChatEntity(
      id: id,
      title: title,
      lastMessage: lastMessage,
      time: time,
    );
  }
}
