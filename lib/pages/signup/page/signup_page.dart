import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/auth_app_bar.dart';
import '../../../core/extensions/context_extentions.dart';
import '../cubit/sign_up_cubit.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/error_view.dart';
import 'package:go_router/go_router.dart';
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          if (state is Loading ) {
            return const LoadingWidget();
          }else if(state is Success) {
            return _buildSuccess(context);
          }else if(state is Error){
            return ErrorView(message: state.message);
          }else{
            return _buildForm(context);
          }
        },
      ),
    );
  }
  Widget _buildSuccess(BuildContext context){
    return Center(child: Column(
      children: [
        const Text('Successfull!!',style:TextStyle(color: Colors.green),),
        ElevatedButton(onPressed: () => context.go('/login'), child: const Text('Go to Login Page')),
      ],
    ));
  }
  CustomScrollView _buildForm(BuildContext context) {
        final usernameController = TextEditingController();
     final emailController = TextEditingController();
      final passwordController = TextEditingController();
    return CustomScrollView(
      slivers: [
        const AuthAppBar(),
        SliverToBoxAdapter(child: Padding(
          padding: context.pagePadding,
          child: Column(children: [
            const Text('Please Create Acoount!'),
             const SizedBox(height: 8,),
            Form(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                const SizedBox(height: 8,),
                TextFormField(controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 8,),
                 TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'password'),),
                  const SizedBox(height: 8,),
                 Row(children: [Expanded(child: ElevatedButton(child: const Text('Sign Up'),onPressed: () {
                  context.read<SignUpCubit>().signUp(usernameController.text, emailController.text, passwordController.text);
                 },))],)
              ],
            )),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const   Text('Have an account?'),
                const  SizedBox(width: 4,),
                InkWell(child: const Text('Log In',style: TextStyle(color: Colors.amber),) ,onTap: () => context.go('/login'),)
              ],
            )
          ],),
        ),)
      ],
    );
  }
}