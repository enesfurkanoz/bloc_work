import 'package:go_router/go_router.dart';
import '../../pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../pages/cubits.dart';
final router = GoRouter(
  initialLocation: '/login',
  routes: <GoRoute>[
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginPAge(),
  ),
  GoRoute(
    path: '/signUp',
    builder: (context, state) =>  BlocProvider(
      create: (context) => SignUpCubit(),
      child: const SignUpPage(),
    ),
  ),
  GoRoute(
    path: '/',
    builder: (context, state) => const UserListPage(),
  )
]);
