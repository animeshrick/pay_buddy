import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/bloc_data_model/dynamic_data.dart';
import '../utils/dashboard_utils.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc()
      : super(DashboardState(
            changedIndex: DynamicBlocData.init(
                value: DashboardUtils.instance.currentPageIndex))) {
    on<DashboardEvent>((event, emit) {
      if (event is PageChangeEvent) {
        emit(DashboardState(changedIndex: DynamicBlocData.loading()));
        DashboardUtils.instance.currentPageIndex = event.index;
        emit(DashboardState(
            changedIndex: DynamicBlocData.success(
                value: DashboardUtils.instance.currentPageIndex)));
      }
    });
  }
}
