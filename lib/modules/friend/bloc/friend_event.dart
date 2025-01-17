part of 'friend_bloc.dart';

sealed class FriendEvent extends Equatable {
  const FriendEvent();
}

class AllFriendsList extends FriendEvent {
  @override
  List<Object?> get props => [];
}
