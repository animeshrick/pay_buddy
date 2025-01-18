import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toastification/toastification.dart';

import '../../../../../const/color_const.dart';
import '../../../../../data/bloc_data_model/dynamic_data.dart';
import '../../../../../data/connection/connection_status.dart';
import '../../../../../data/model/user_model.dart';
import '../../../../../extension/hex_color.dart';
import '../../../../../utils/pop_up_items.dart';
import '../repo/update_account_repo.dart';

part 'update_account_event.dart';
part 'update_account_state.dart';

class UpdateAccountBloc extends Bloc<UpdateAccountEvent, UpdateAccountState> {
  UpdateAccountBloc()
      : super(UpdateAccountState(
          updatedUser: DynamicBlocData.init(),
        )) {
    ConnectionStatus connectionStatus = ConnectionStatus.getInstance;
    on<UpdateAccountEvent>((event, emit) async {
      if (event is UpdatingAccount) {
        bool onlineStatus = await connectionStatus.checkConnection();
        if (onlineStatus) {
          emit(state.copyWith(updatedUser: DynamicBlocData.loading()));

          UserModel? updateUser =
              await UpdateAccountRepo().update_account(user: event.user);

          emit(state.copyWith(
              updatedUser: DynamicBlocData.success(value: updateUser)));
        } else {
          connectionStatus.connectionChange.listen((onlineStatus) {
            if (onlineStatus && state.updatedUser.status == Status.init) {
              PopUpItems().toastfy(
                  message: "Your internet connection is interrupted.",
                  color: HexColor.fromHex(ColorConst.error100),
                  type: ToastificationType.error);
            }
          });
        }
      }
    });
  }
}
