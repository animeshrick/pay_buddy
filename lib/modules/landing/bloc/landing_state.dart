part of 'landing_bloc.dart';

//ignore: must_be_immutable
class LandingState extends Equatable {
  DynamicBlocData<int> pageIndex;

  LandingState({
    required this.pageIndex,
  });

  LandingState copyWith(
      {
      DynamicBlocData<int>? pageIndex}) {
    return LandingState(
        pageIndex: pageIndex ?? this.pageIndex);
  }

  @override
  List<Object> get props => [ pageIndex.status];
}
