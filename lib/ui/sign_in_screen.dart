import 'package:driver_application/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginInitial) {
          return Center(child: Text('Waiting'));
        }
        if (state is LoginLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is LoginSucced) {
          return Container();
        }
        if (state is LoginFailed) {
          return Center(child: Text(state.message));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Sign In'),
            ),
          );
        },
      ),
    );
  }
}
