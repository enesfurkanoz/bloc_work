
import 'package:bloc_work/core/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/const/box_names.dart';
part 'sign_up_states.dart';


class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(Initial());

  void signUp(String username, String email, String password) async {
    emit(Loading());
    try {
      final box = Hive.box<User>(userBOxNAme);
      await box.add(User(username, email, password, Role.user));
      emit(Success());
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}