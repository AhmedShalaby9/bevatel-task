import '../../domain/models/chat_model.dart';
import '../entities/chat_entity.dart';

class ChatMapper {
  static ChatModel fromEntity(ChatEntity entity) {
    return ChatModel(
      id: entity.id,
      message: entity.message,
      sentUserId: entity.sentUserId,
      sentUserName: entity.sentUserName,
      timestamp: entity.timestamp,
    );
  }

  static ChatEntity toEntity(ChatModel model) {
    return ChatEntity(
      id: model.id,
      message: model.message,
      sentUserId: model.sentUserId,
      sentUserName: model.sentUserName,
      timestamp: model.timestamp,
    );
  }
}
