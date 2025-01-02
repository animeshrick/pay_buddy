import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/bloc_data_model/dynamic_data.dart';
import '../../../data/connection/connection_status.dart';

part 'landing_event.dart';

part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc()
      : super(LandingState(

          pageIndex: DynamicBlocData<int>.init(value: 0),
        )) {
    ConnectionStatus connectionStatus = ConnectionStatus.getInstance;
    on<LandingEvent>((event, emit) async {
      if (event is ChangeIndex) {
        emit(state.copyWith(pageIndex: DynamicBlocData.loading()));
        emit(state.copyWith(
            pageIndex: DynamicBlocData<int>.success(value: event.index)));
      }
    });
  }
}
