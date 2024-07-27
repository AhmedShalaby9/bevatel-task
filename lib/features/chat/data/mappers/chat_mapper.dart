import '../../domain/models/chat_model.dart';
import '../entities/chat_entity.dart';

class ChatMapper {
  static ChatModel fromEntity(ChatEntity entity) {
    return ChatModel(
      id: entity.id,
      title: entity.title,
      lastMessage: entity.lastMessage,
      time: entity.time,
    );
  }

  static ChatEntity toEntity(ChatModel model) {
    return ChatEntity(
      id: model.id,
      title: model.title,
      lastMessage: model.lastMessage,
      time: model.time,
    );
  }
}
