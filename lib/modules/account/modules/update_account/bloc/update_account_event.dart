part of 'update_account_bloc.dart';

sealed class UpdateAccountEvent extends Equatable {
  const UpdateAccountEvent();
}


class UpdatingAccount extends UpdateAccountEvent {
  final UserModel user;

  UpdatingAccount({required this.user});
  @override
  List<Object?> get props => [];
}