import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/models/chat_model.dart';
import '../../domain/repo/i_chat_repo.dart';
import '../entities/chat_entity.dart';
 import '../mappers/chat_mapper.dart';

class ChatsRepoImpl extends IChatRepo {
  final FirebaseFirestore firestore;

  ChatsRepoImpl(this.firestore);

  @override
  Future<List<ChatModel>> getChats() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('chats').get();
      return snapshot.docs.map((doc) {
        return ChatMapper.fromEntity(ChatEntity.fromJson(doc.data() as Map<String, dynamic>));
      }).toList();
    } catch (e) {
      throw Exception('Error getting chats: $e');
    }
  }

  @override
  Future<void> addChat(ChatEntity chat) async {
    try {
      await firestore.collection('chats').add(chat.toJson());
    } catch (e) {
      throw Exception('Error adding chat: $e');
    }
  }

  @override
  Future<void> updateChat(ChatEntity chat) async {
    try {
      await firestore.collection('chats').doc(chat.id).update(chat.toJson());
    } catch (e) {
      throw Exception('Error updating chat: $e');
    }
  }

  @override
  Future<void> deleteChat(String chatId) async {
    try {
      await firestore.collection('chats').doc(chatId).delete();
    } catch (e) {
      throw Exception('Error deleting chat: $e');
    }
  }
}
