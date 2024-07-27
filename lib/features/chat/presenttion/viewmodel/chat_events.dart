import '../../data/entities/chat_entity.dart';

abstract class ChatEvent {}

class LoadChats extends ChatEvent {}

class AddChat extends ChatEvent {
  final ChatEntity chat;
  AddChat(this.chat);
}

class UpdateChat extends ChatEvent {
  final ChatEntity chat;
  UpdateChat(this.chat);
}

class DeleteChat extends ChatEvent {
  final String chatId;
  DeleteChat(this.chatId);
}
