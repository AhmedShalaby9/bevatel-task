import '../../domain/models/chat_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<ChatModel> chats;
  ChatLoaded(this.chats);
}

class ChatError extends ChatState {
  final String message;
  ChatError(this.message);
}

class ChatAdded extends ChatState {}

class ChatUpdated extends ChatState {}

class ChatDeleted extends ChatState {}
