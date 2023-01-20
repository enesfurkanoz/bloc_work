part of 'sign_up_cubit.dart';

abstract class SignUpState{}
class Success extends SignUpState {}
class Error extends SignUpState {
  final String message;
  Error(this.message);
}
class Loading extends SignUpState {}
class Initial extends SignUpState {}