part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final DynamicBlocData<CommonResponse> authResponse;
  final DynamicBlocData<bool> isCheckedTC;

  AuthState({
    required this.authResponse,
    required this.isCheckedTC,
  });

  AuthState copyWith({
    DynamicBlocData<CommonResponse>? authResponse,
    DynamicBlocData<bool>? isCheckedTC,
  }) {
    return AuthState(
      authResponse: authResponse ?? this.authResponse,
      isCheckedTC: isCheckedTC ?? this.isCheckedTC,
    );
  }

  @override
  List<Object> get props => [
        authResponse.status,
    isCheckedTC.status,
      ];
}
