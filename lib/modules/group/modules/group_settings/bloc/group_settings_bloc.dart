import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../data/bloc_data_model/dynamic_data.dart';

part 'group_settings_event.dart';
part 'group_settings_state.dart';

class GroupSettingsBloc extends Bloc<GroupSettingsEvent, GroupSettingsState> {
  GroupSettingsBloc()
      : super(GroupSettingsState(
          isShowMembers: DynamicBlocData<bool>.init(value: true),
        )) {
    on<GroupSettingsEvent>((event, emit) {
      if (event is IsShowMembers) {
        emit(state.copyWith(isShowMembers: DynamicBlocData<bool>.loading()));

        emit(state.copyWith(
            isShowMembers: DynamicBlocData<bool>.success(value: event.isShow)));
      }
    });
  }
}
