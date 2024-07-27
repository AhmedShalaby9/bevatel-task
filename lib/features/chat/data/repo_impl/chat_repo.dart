import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../domain/models/chat_model.dart';
import '../../domain/repo/i_chat_repo.dart';
import '../entities/chat_entity.dart';
import '../mappers/chat_mapper.dart';

class ChatsRepoImpl extends IChatRepo {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  ChatsRepoImpl(this.firestore, this.storage);

  @override
  Future<List<ChatModel>> getChats(String userId) async {
    try {
      QuerySnapshot snapshot = await firestore.collection('chats').doc(userId).collection('messages').get();
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
      await firestore.collection('chats').doc(chat.sentUserId).collection('messages').add(chat.toJson());
    } catch (e) {
      throw Exception('Error adding chat: $e');
    }
  }

  @override
  Future<void> updateChat(ChatEntity chat) async {
    try {
      await firestore.collection('chats').doc(chat.sentUserId).collection('messages').doc(chat.id).update(chat.toJson());
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

  Future<String> uploadImage(String path) async {
    File file = File(path);
    try {
      TaskSnapshot snapshot = await storage.ref().child('chat_images/${file.uri.pathSegments.last}').putFile(file);
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      throw Exception('Error uploading image: $e');
    }
  }

  Stream<List<ChatModel>> streamChats(String userId) {
    return firestore.collection('chats').doc(userId).collection('messages').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ChatMapper.fromEntity(ChatEntity.fromJson(doc.data() as Map<String, dynamic>));
      }).toList();
    });
  }
}
