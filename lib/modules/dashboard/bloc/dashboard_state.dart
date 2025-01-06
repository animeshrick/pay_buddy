part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final DynamicBlocData<int> changedIndex;

  const DashboardState({required this.changedIndex});

  DashboardState copyWith({DynamicBlocData<int>? changedIndex}) {
    return DashboardState(changedIndex: changedIndex ?? this.changedIndex);
  }

  @override
  List<Object> get props => [
        changedIndex.status,
      ];
}
