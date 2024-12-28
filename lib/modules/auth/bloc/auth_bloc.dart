import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pay_buddy/data/model/common_response.dart';
import 'package:pay_buddy/service/value_handler.dart';
import 'package:toastification/toastification.dart';

import '../../../const/color_const.dart';
import '../../../data/bloc_data_model/dynamic_data.dart';
import '../../../data/connection/connection_status.dart';
import '../../../extension/hex_color.dart';
import '../../../router/custom_router/custom_route.dart';
import '../../../router/router_name.dart';
import '../../../utils/pop_up_items.dart';
import '../repo/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(AuthState(
            authResponse: DynamicBlocData<CommonResponse>.init(),
            isCheckedTC: DynamicBlocData<bool>.init(value: false))) {
    ConnectionStatus connectionStatus = ConnectionStatus.getInstance;

    on<AuthEvent>((event, emit) async {
      if (event is Register) {
        bool onlineStatus = await connectionStatus.checkConnection();
        if (onlineStatus) {
          emit(state.copyWith(authResponse: DynamicBlocData.loading()));
          CommonResponse? apiResp =
              await AuthRepo().getRegisterOTP(bodyData: event.user);
          if (apiResp?.success_message != null) {
            emit(state.copyWith(
                authResponse:
                    DynamicBlocData<CommonResponse>.success(value: apiResp)));
            CustomRoute().goto(RouteName.verification);
          } else {
            PopUpItems().toastfy(
                message: ValueHandler()
                    .get_error_msg(value: apiResp?.error_message ?? ""),
                color: HexColor.fromHex(ColorConst.error100),
                type: ToastificationType.error);
            emit(state.copyWith(
                authResponse: DynamicBlocData<CommonResponse>.error(
                    message: apiResp?.error_message ?? "")));
          }
        } else {
          connectionStatus.connectionChange.listen((onlineStatus) {
            if (onlineStatus && state.authResponse.status == Status.init) {
              // add(Register());
            }
          });
        }
      }

      if (event is IsCheckedTc) {
        bool onlineStatus = await connectionStatus.checkConnection();
        if (onlineStatus) {
          emit(state.copyWith(isCheckedTC: DynamicBlocData.loading()));

          emit(state.copyWith(
              isCheckedTC: DynamicBlocData.success(value: event.isChecked)));
        } else {
          connectionStatus.connectionChange.listen((onlineStatus) {
            if (onlineStatus && state.authResponse.status == Status.init) {
              add(const IsCheckedTc(isChecked: false));
            }
          });
        }
      }
    });
  }
}
