part of 'account_bloc.dart';

sealed class AccountEvent extends Equatable {
  const AccountEvent();
}


class Logout extends AccountEvent {
  @override
  List<Object?> get props => [];
}