import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pay_buddy/const/http_status_code.dart';
import 'package:pay_buddy/modules/auth/model/user_token.dart';
import 'package:pay_buddy/router/custom_router/custom_route.dart';
import 'package:pay_buddy/service/context_service.dart';
import 'package:pay_buddy/service/value_handler.dart';
import 'package:pay_buddy/storage/local_preferences.dart';
import 'package:pay_buddy/utils/text_utils.dart';
import 'package:toastification/toastification.dart';

import '../../../const/color_const.dart';
import '../../../data/bloc_data_model/dynamic_data.dart';
import '../../../data/connection/connection_status.dart';
import '../../../data/model/api_return_model.dart';
import '../../../extension/hex_color.dart';
import '../../../router/router_name.dart';
import '../../../utils/pop_up_items.dart';
import '../repo/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(AuthState(
            authResponse: DynamicBlocData<ApiReturnModel>.init(),
            isCheckedTC: DynamicBlocData<bool>.init(value: true),
            verifyOTPResponse: DynamicBlocData<UserToken>.init())) {
    ConnectionStatus connectionStatus = ConnectionStatus.getInstance;

    on<AuthEvent>((event, emit) async {
      if (event is Register) {
        bool onlineStatus = await connectionStatus.checkConnection();
        if (onlineStatus) {
          emit(state.copyWith(authResponse: DynamicBlocData.loading()));
          ApiReturnModel? apiResp =
              await AuthRepo().getRegisterOTP(bodyData: event.user);
          if (apiResp?.statusCode == HttpStatusCodes.HTTP_201_CREATED) {
            emit(state.copyWith(
                authResponse:
                    DynamicBlocData<ApiReturnModel>.success(value: apiResp)));

            Map<String, String> data = {"email": event.user["email"]};

            BuildContext context = CurrentContext().context;
            if (context.mounted) {
              kIsWeb
                  ? context.goNamed(RouteName.verification,
                      pathParameters: data)
                  : context.pushNamed(RouteName.verification,
                      pathParameters: data);
            }
          } else {
            PopUpItems().toastfy(
                message:
                    ValueHandler().get_error_msg(value: apiResp?.message ?? ""),
                color: HexColor.fromHex(ColorConst.error100),
                type: ToastificationType.error);
            emit(state.copyWith(
                authResponse: DynamicBlocData<ApiReturnModel>.error(
                    message: apiResp?.message ?? "")));
          }
        } else {
          connectionStatus.connectionChange.listen((onlineStatus) {
            if (onlineStatus && state.authResponse.status == Status.init) {
              PopUpItems().toastfy(
                  message: "Your internet connection is interrupted.",
                  color: HexColor.fromHex(ColorConst.error100),
                  type: ToastificationType.error);
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

      if (event is VerifyOTP) {
        bool onlineStatus = await connectionStatus.checkConnection();
        if (onlineStatus) {
          emit(state.copyWith(verifyOTPResponse: DynamicBlocData.loading()));
          UserToken? apiResp =
              await AuthRepo().verifyOTP(bodyData: event.request);
          if (apiResp?.token != null) {
            emit(state.copyWith(
                verifyOTPResponse:
                    DynamicBlocData<UserToken>.success(value: apiResp)));

            await LocalPreferences().setString(
                key: LocalPreferences.token,
                value: jsonEncode(apiResp?.token ?? Token()));
            CustomRoute().clearAndNavigate(RouteName.dashboardView);
          } else {
            PopUpItems().toastfy(
                message: ValueHandler()
                    .get_error_msg(value: apiResp?.errorMessage ?? ""),
                color: HexColor.fromHex(ColorConst.error100),
                type: ToastificationType.error);
            emit(state.copyWith(
                verifyOTPResponse: DynamicBlocData<UserToken>.error(
                    message: apiResp?.errorMessage ?? "")));
          }
        } else {
          connectionStatus.connectionChange.listen((onlineStatus) {
            if (onlineStatus && state.authResponse.status == Status.init) {
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
