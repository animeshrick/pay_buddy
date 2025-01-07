part of 'add_new_group_bloc.dart';

sealed class AddNewGroupEvent extends Equatable {
  const AddNewGroupEvent();
}

class PickFile extends AddNewGroupEvent {
  const PickFile({required this.files});

  final List<CustomFile> files;

  @override
  List<Object?> get props => [];
}

class UpdatePickFile extends AddNewGroupEvent {
  const UpdatePickFile({required this.files});

  final List<CustomFile> files;

  @override
  List<Object?> get props => [];
}

class RemoveImageAtIndex extends AddNewGroupEvent {
  const RemoveImageAtIndex({required this.index});

  final int index;

  @override
  List<Object?> get props => [];
}
