part of 'account_bloc.dart';

sealed class AccountEvent extends Equatable {
  const AccountEvent();
}

class InitAccountPage extends AccountEvent {
  @override
  List<Object?> get props => [];
}

class Logout extends AccountEvent {
  @override
  List<Object?> get props => [];
}

class UserDetails extends AccountEvent {
  @override
  List<Object?> get props => [];
}
