part of 'friend_bloc.dart';

class FriendState extends Equatable {
  final DynamicBlocData<AllFriends> allFriends;

  FriendState({required this.allFriends});

  FriendState copyWith({
    DynamicBlocData<AllFriends>? allFriends,
  }) {
    return FriendState(
      allFriends: allFriends ?? this.allFriends,
    );
  }

  @override
  List<Object> get props => [
        allFriends.status,
      ];
}
