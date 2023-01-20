import 'package:bloc_work/core/const/box_names.dart';
import 'package:bloc_work/core/models/user.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
part "login_states.dart";

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String username, String password, VoidCallback onSuccess){
    emit(LoginLoading());
    final users = Hive.box<User>(userBOxNAme).values.where((user) => user.username == username && user.password == password).toList();
    if(users.isEmpty) {
      emit(LoginError('Invalid username or password!!')); 
      return;
    }
    onSuccess();
  }
}