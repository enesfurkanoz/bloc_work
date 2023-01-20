import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import'core/theme/theme.dart';
import 'core/models/user.dart';
import 'core/const/box_names.dart';
import 'core/routing/router.dart';
void main() async {
  await Hive.initFlutter();
  await initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bloc Works',
      theme: theme,
      routerConfig: router,
    );
  }
}

Future<void> initHive() async {
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(RoleAdapter());
  await Hive.openBox<User>(userBOxNAme);
}