import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pay_buddy/data/bloc_data_model/dynamic_data.dart';
import 'package:pay_buddy/data/model/user_model.dart';
import 'package:pay_buddy/modules/account/repo/account_repo.dart';
import 'package:pay_buddy/service/value_handler.dart';
import 'package:pay_buddy/storage/local_preferences.dart';
import 'package:pay_buddy/storage/user_preference.dart';
import 'package:pay_buddy/widget/loading_widget.dart';

import '../../../data/connection/connection_status.dart';
import '../../../router/custom_router/custom_route.dart';
import '../../../router/router_name.dart';
import '../../../service/context_service.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc()
      : super(AccountState(
          isLogout: DynamicBlocData.init(value: false),
          userDetails: DynamicBlocData<UserModel>.init(),
        )) {
    ConnectionStatus connectionStatus = ConnectionStatus.getInstance;

    on<AccountEvent>((event, emit) async {
      if (event is Logout) {
        bool onlineStatus = await connectionStatus.checkConnection();
        if (onlineStatus) {
          emit(state.copyWith(isLogout: DynamicBlocData.loading()));
          showLoading();
          emit(state.copyWith(isLogout: DynamicBlocData.success(value: true)));

          await LocalPreferences().clearKey(key: LocalPreferences.token);
          CustomRoute().clearAndNavigate(RouteName.auth);

          BuildContext context = CurrentContext().context;
          if (context.mounted) {
            Navigator.pop(context);
          }
        } else {
          connectionStatus.connectionChange.listen((onlineStatus) {
            if (onlineStatus && state.isLogout.status == Status.init) {
              add(Logout());
            }
          });
        }
      } else if (event is UserDetails) {
        bool onlineStatus = await connectionStatus.checkConnection();
        if (onlineStatus) {
          emit(state.copyWith(userDetails: DynamicBlocData.loading()));

          UserModel? userDetailsResp = await AccountRepo().getUserDetails();

          if (ValueHandler().isTextNotEmptyOrNull(userDetailsResp?.id)) {
            emit(state.copyWith(
                userDetails: DynamicBlocData.success(value: userDetailsResp)));
            await UserPreference()
                .saveData(userModel: userDetailsResp ?? UserModel());
          } else {
            emit(state.copyWith(userDetails: DynamicBlocData.error()));
          }
        } else {
          connectionStatus.connectionChange.listen((onlineStatus) {
            if (onlineStatus && state.isLogout.status == Status.init) {
              add(UserDetails());
            }
          });
        }
      }
    });
  }
}
