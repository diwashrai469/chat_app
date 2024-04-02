part of 'private_chat_cubit.dart';

sealed class PrivateChatState {}

final class PrivateChatInitial extends PrivateChatState {}

final class PrivateChatLoadingState extends PrivateChatState {}

final class PrivateChatErrorState extends PrivateChatState {}

class PrivateChatLoadedState extends PrivateChatState {
  List allUserData;
  PrivateChatLoadedState({required this.allUserData});
}
