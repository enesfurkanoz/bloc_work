import 'package:bloc_work/core/widgets/error_view.dart';
import 'package:bloc_work/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import '../../../core/extensions/context_extentions.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/login_cubit.dart';
class LoginPAge extends StatelessWidget {
  const LoginPAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          if(state is LoginLoading) {
            return const LoadingWidget();
          }else if(state is LoginError){
            return ErrorView(message: state.message);
          }
          else{
            return _buildLoginForm(context);
          }
        },
      )
    );
  }
  
  CustomScrollView _buildLoginForm(BuildContext context) {
    final usernameController = TextEditingController();
     final passwordController = TextEditingController();
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: context.heightFraction(3),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(color: Theme.of(context).primaryColor,),
          ),
        ),
        SliverToBoxAdapter(child: Padding(
          padding: context.pagePadding,
          child: Column(children: [
           const  Text('Please login your account!'),
             const SizedBox(height: 8,),
            Form(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                const SizedBox(height: 8,),
                 TextFormField(
                  controller: passwordController
                  ,decoration:const  InputDecoration(labelText: 'password'),),
                  const SizedBox(height: 8,),
                 Row(children: [Expanded(child: ElevatedButton(child: const Text('Login'),onPressed: () {
                    context.read<LoginCubit>().login(usernameController.text, passwordController.text, () {
                      context.go('/');
                    });
                 },))],)
              ],
            )),
            const SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Dont have an account?'),
                const SizedBox(width: 4,),
                InkWell(child: const Text('SignUp',style: TextStyle(color: Colors.amber),), onTap: () => context.go('/signUp'),)
              ],
            )
          ],),
        ),)
      ],
    );
  }
}