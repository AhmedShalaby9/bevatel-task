import '../../domain/models/chat_model.dart';
import '../entities/chat_entity.dart';

class ChatMapper {
  static ChatModel fromEntity(ChatEntity entity) {
    return ChatModel(
      id: entity.id,
      sentUserId: entity.sentUserId,
      sentUserName: entity.sentUserName,
      message: entity.message,
      imageUrl: entity.imageUrl,
      timestamp: entity.timestamp,
    );
  }

  static ChatEntity toEntity(ChatModel model) {
    return ChatEntity(
      id: model.id,
      sentUserId: model.sentUserId,
      sentUserName: model.sentUserName,
      message: model.message,
      imageUrl: model.imageUrl,
      timestamp: model.timestamp,
    );
  }
}
