import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/repo/i_chat_repo.dart';
 import 'chat_events.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final IChatRepo chatRepo;

  ChatBloc({required this.chatRepo}) : super(ChatInitial()) {
    on<LoadChats>(_onLoadChats);
    on<AddChat>(_onAddChat);
    on<UpdateChat>(_onUpdateChat);
    on<DeleteChat>(_onDeleteChat);
  }

  Future<void> _onLoadChats(LoadChats event, Emitter<ChatState> emit) async {
    emit(ChatLoading());
    try {
      final chats = await chatRepo.getChats();
      emit(ChatLoaded(chats));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> _onAddChat(AddChat event, Emitter<ChatState> emit) async {
    try {
      await chatRepo.addChat(event.chat);
      emit(ChatAdded());
      add(LoadChats());
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> _onUpdateChat(UpdateChat event, Emitter<ChatState> emit) async {
    try {
      await chatRepo.updateChat(event.chat);
      emit(ChatUpdated());
      add(LoadChats());
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> _onDeleteChat(DeleteChat event, Emitter<ChatState> emit) async {
    try {
      await chatRepo.deleteChat(event.chatId);
      emit(ChatDeleted());
      add(LoadChats());
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}
