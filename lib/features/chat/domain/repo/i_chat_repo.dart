import '../../data/entities/chat_entity.dart';
import '../models/chat_model.dart';

abstract class IChatRepo {
  Future<List<ChatModel>> getChats();
  Future<void> addChat(ChatEntity chat);
  Future<void> updateChat(ChatEntity chat);
  Future<void> deleteChat(String chatId);
}
