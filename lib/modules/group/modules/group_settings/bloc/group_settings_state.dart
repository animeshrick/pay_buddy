part of 'group_settings_bloc.dart';

class GroupSettingsState extends Equatable {
  final DynamicBlocData<bool> isShowMembers;

  const GroupSettingsState({
    required this.isShowMembers,
  });

  GroupSettingsState copyWith({
    DynamicBlocData<bool>? isShowMembers,
  }) {
    return GroupSettingsState(
      isShowMembers: isShowMembers ?? this.isShowMembers,
    );
  }

  @override
  List<Object> get props => [
        isShowMembers.status,
      ];
}
