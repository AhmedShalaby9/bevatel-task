import '../../data/entities/chat_entity.dart';

abstract class ChatEvent {}

class LoadChats extends ChatEvent {
  final String userId;

  LoadChats(this.userId);
}

class AddChat extends ChatEvent {
  final ChatEntity chat;
  final String userId;

  AddChat(this.chat, this.userId);
}

class UpdateChat extends ChatEvent {
  final ChatEntity chat;

  UpdateChat(this.chat);
}

class DeleteChat extends ChatEvent {
  final String chatId;
  final String userId;

  DeleteChat(this.chatId, this.userId);
}

class StreamChats extends ChatEvent {
  final String userId;

  StreamChats(this.userId);
}
