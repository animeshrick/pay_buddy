part of 'group_settings_bloc.dart';

sealed class GroupSettingsEvent extends Equatable {
  const GroupSettingsEvent();
}


class IsShowMembers extends GroupSettingsEvent {
  final bool isShow;

  const IsShowMembers({required this.isShow});

  @override
  List<Object?> get props => [];
}