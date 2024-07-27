import 'package:bloc/bloc.dart';
import '../../domain/models/chat_model.dart';
import '../../domain/repo/i_chat_repo.dart';
import 'chat_events.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final IChatRepo chatRepo;

  ChatBloc({required this.chatRepo}) : super(ChatInitial()) {
    on<LoadChats>(_onLoadChats);
    on<StreamChats>(_onStreamChats);
    on<AddChat>(_onAddChat);
    on<UpdateChat>(_onUpdateChat);
    on<DeleteChat>(_onDeleteChat);
    on<UploadImage>(_onUploadImage);
  }

  Future<void> _onLoadChats(LoadChats event, Emitter<ChatState> emit) async {
    emit(ChatLoading());
    try {
      final chats = await chatRepo.getChats(event.userId);
      emit(ChatLoaded(chats));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  void _onStreamChats(StreamChats event, Emitter<ChatState> emit) {
    emit(ChatLoading());
    try {
      chatRepo.streamChats(event.userId).listen((chats) {
        add(LoadChats(event.userId));
      });
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> _onAddChat(AddChat event, Emitter<ChatState> emit) async {
    try {
      if (state is ChatLoaded) {
        final List<ChatModel> updatedChats =
            List.from((state as ChatLoaded).chats);
        final newChat = ChatModel(
          id: event.chat.id,
          sentUserId: event.chat.sentUserId,
          sentUserName: event.chat.sentUserName,
          message: event.chat.message,
          imageUrl: event.chat.imageUrl,
          timestamp: event.chat.timestamp,
        );
        updatedChats.add(newChat);
        emit(ChatLoaded(updatedChats));

        // Add the chat to the repository (no need to wait for completion)
        chatRepo.addChat(event.chat);
      } else {
        emit(ChatError('Failed to add chat: No existing chat state.'));
      }
    } catch (e) {
      emit(ChatError('Failed to add chat: $e'));
    }
  }

  Future<void> _onUpdateChat(UpdateChat event, Emitter<ChatState> emit) async {
    try {
      await chatRepo.updateChat(event.chat);
      emit(ChatUpdated());
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> _onDeleteChat(DeleteChat event, Emitter<ChatState> emit) async {
    try {
      await chatRepo.deleteChat(event.chatId);
      emit(ChatDeleted());
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> _onUploadImage(
      UploadImage event, Emitter<ChatState> emit) async {
    try {
      final imageUrl = await chatRepo.uploadImage(event.filePath);
      final updatedChat = event.chat.copyWith(imageUrl: imageUrl);
      await chatRepo.addChat(updatedChat);
      emit(ChatImageUploaded());
      add(LoadChats(event.chat.sentUserId));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}
