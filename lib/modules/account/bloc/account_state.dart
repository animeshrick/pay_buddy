part of 'account_bloc.dart';

class AccountState extends Equatable {
 final DynamicBlocData<bool> isLogout;

  AccountState({required this.isLogout});

 AccountState copyWith({
   DynamicBlocData<bool>? isLogout,
 }) {
   return AccountState(
     isLogout: isLogout ?? this.isLogout,
   );
 }

 @override
 List<Object> get props => [
   isLogout.status,
 ];
}