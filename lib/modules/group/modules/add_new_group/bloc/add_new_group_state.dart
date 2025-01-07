part of 'add_new_group_bloc.dart';

class AddNewGroupState extends Equatable {
  final DynamicBlocData<List<CustomFile>> selectedFiles;

  const AddNewGroupState({
    required this.selectedFiles,
  });

  AddNewGroupState copyWith({
    DynamicBlocData<List<CustomFile>>? selectedFiles,
  }) {
    return AddNewGroupState(
      selectedFiles: selectedFiles ?? this.selectedFiles,
    );
  }

  @override
  List<Object> get props => [
        selectedFiles.status,
      ];
}
