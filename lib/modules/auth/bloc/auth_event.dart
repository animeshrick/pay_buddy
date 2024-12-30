part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

class Register extends AuthEvent {
  final  Map<String, dynamic> user;

  const Register({required this.user});

  @override
  List<Object?> get props => [];
}

class IsCheckedTc extends AuthEvent {
  final bool isChecked;

  const IsCheckedTc({required this.isChecked});

  @override
  List<Object?> get props => [];
}

class VerifyOTP extends AuthEvent {
  final  Map<String, dynamic> request;

  const VerifyOTP({required this.request});

  @override
  List<Object?> get props => [];
}
