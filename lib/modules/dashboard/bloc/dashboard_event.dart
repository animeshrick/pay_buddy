part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();
}


class PageChangeEvent extends DashboardEvent {
  final int index;

  const PageChangeEvent({required this.index});

  @override
  List<Object?> get props => [];
}