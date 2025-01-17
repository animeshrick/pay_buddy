import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pay_buddy/modules/friend/repo/friend_repo.dart';

import '../../../data/bloc_data_model/dynamic_data.dart';
import '../../../data/connection/connection_status.dart';
import '../model/all_friends_model.dart';

part 'friend_event.dart';
part 'friend_state.dart';

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  FriendBloc() : super(FriendState(allFriends: DynamicBlocData.init())) {
    ConnectionStatus connectionStatus = ConnectionStatus.getInstance;

    on<FriendEvent>((event, emit) async {
      if (event is AllFriendsList) {
        bool onlineStatus = await connectionStatus.checkConnection();
        if (onlineStatus) {
          emit(state.copyWith(allFriends: DynamicBlocData.loading()));

          AllFriends? friendsList = await FriendRepo().getAllFriends();

          if (friendsList != null &&
              friendsList.data?.friendList?.isNotEmpty == true) {
            emit(state.copyWith(
                allFriends: DynamicBlocData.success(value: friendsList)));

          } else {
            emit(state.copyWith(allFriends: DynamicBlocData.error()));
          }
        } else {
          connectionStatus.connectionChange.listen((onlineStatus) {
            if (onlineStatus && state.allFriends.status == Status.init) {
              add(AllFriendsList());
            }
          });
        }
      }
    });
  }
}
