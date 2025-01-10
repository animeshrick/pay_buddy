part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final DynamicBlocData<ApiReturnModel> authResponse;
  final DynamicBlocData<UserToken> loginResponse;
  final DynamicBlocData<UserToken> verifyOTPResponse;
  final DynamicBlocData<bool> isLogin;
  final DynamicBlocData<bool> isCheckedTC;
  final DynamicBlocData<ApiReturnModel> resendOTP;

  AuthState({
    required this.authResponse,
    required this.loginResponse,
    required this.isCheckedTC,
    required this.isLogin,
    required this.verifyOTPResponse,
    required this.resendOTP,
  });

  AuthState copyWith({
    DynamicBlocData<ApiReturnModel>? authResponse,
    DynamicBlocData<UserToken>? loginResponse,
    DynamicBlocData<UserToken>? verifyOTPResponse,
    DynamicBlocData<bool>? isCheckedTC,
    DynamicBlocData<bool>? isLogin,
    DynamicBlocData<ApiReturnModel>? resendOTP,
  }) {
    return AuthState(
      authResponse: authResponse ?? this.authResponse,
      verifyOTPResponse: verifyOTPResponse ?? this.verifyOTPResponse,
      loginResponse: loginResponse ?? this.loginResponse,
      isCheckedTC: isCheckedTC ?? this.isCheckedTC,
      isLogin: isLogin ?? this.isLogin,
      resendOTP: resendOTP ?? this.resendOTP,
    );
  }

  @override
  List<Object> get props => [
        authResponse.status,
        isCheckedTC.status,
        verifyOTPResponse.status,
        loginResponse.status,
        isLogin.status,
    resendOTP.status,
      ];
}
