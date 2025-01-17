part of 'account_bloc.dart';

class AccountState extends Equatable {
 final DynamicBlocData<bool> isLogout;
 final DynamicBlocData<UserModel> userDetails;

  AccountState({required this.isLogout, required this.userDetails});

 AccountState copyWith({
   DynamicBlocData<bool>? isLogout,
   DynamicBlocData<UserModel>? userDetails,
 }) {
   return AccountState(
     isLogout: isLogout ?? this.isLogout,
     userDetails: userDetails ?? this.userDetails,
   );
 }

 @override
 List<Object> get props => [
   isLogout.status,
   userDetails.status,
 ];
}