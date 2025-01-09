part of 'add_new_group_bloc.dart';

class AddNewGroupState extends Equatable {
  final DynamicBlocData<List<CustomFile>> selectedFiles;
  final DynamicBlocData<List<String>> selectedFriends;

  const AddNewGroupState({
    required this.selectedFiles,
    required this.selectedFriends,
  });

  AddNewGroupState copyWith({
    DynamicBlocData<List<CustomFile>>? selectedFiles,
    DynamicBlocData<List<String>>? selectedFriends,
  }) {
    return AddNewGroupState(
      selectedFiles: selectedFiles ?? this.selectedFiles,
      selectedFriends: selectedFriends ?? this.selectedFriends,
    );
  }

  @override
  List<Object> get props => [
        selectedFiles.status,
        selectedFriends.status,
      ];
}
