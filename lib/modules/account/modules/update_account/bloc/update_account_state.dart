part of 'update_account_bloc.dart';

class UpdateAccountState extends Equatable {
  final DynamicBlocData<UserModel> updatedUser;

  UpdateAccountState({ required this.updatedUser});

  UpdateAccountState copyWith({
    DynamicBlocData<UserModel>? updatedUser,
  }) {
    return UpdateAccountState(
      updatedUser: updatedUser ?? this.updatedUser,
    );
  }

  @override
  List<Object> get props => [
    updatedUser.status,
  ];
}