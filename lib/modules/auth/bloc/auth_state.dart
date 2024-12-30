part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final DynamicBlocData<CommonResponse> authResponse;
  final DynamicBlocData<UserToken> verifyOTPResponse;
  final DynamicBlocData<bool> isCheckedTC;

  AuthState({
    required this.authResponse,
    required this.isCheckedTC,
    required this.verifyOTPResponse,
  });

  AuthState copyWith({
    DynamicBlocData<CommonResponse>? authResponse,
    DynamicBlocData<UserToken>? verifyOTPResponse,
    DynamicBlocData<bool>? isCheckedTC,
  }) {
    return AuthState(
      authResponse: authResponse ?? this.authResponse,
      verifyOTPResponse: verifyOTPResponse ?? this.verifyOTPResponse,
      isCheckedTC: isCheckedTC ?? this.isCheckedTC,
    );
  }

  @override
  List<Object> get props => [
        authResponse.status,
        isCheckedTC.status,
        verifyOTPResponse.status,
      ];
}
