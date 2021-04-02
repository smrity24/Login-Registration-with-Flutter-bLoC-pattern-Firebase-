import 'package:driver_application/register/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterInitial) {
          return Center(child: Text('Waiting'));
        }
        if (state is RegisterLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is RegisterSucced) {
          return Container();
        }
        if (state is RegisterFailed) {
          return Center(child: Text(state.message));
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Sign Up', style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Text(
                    'Fill in the application form',
                    style: TextStyle(color: Color(0xFFbc6c25), fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                    textEditingController: emailController,
                    hintText: 'Email',
                    color: Color(0xFFdeaaff),
                  ),
                  size
                  CustomTextField(
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                    textEditingController: emailController,
                    hintText: 'Password',
                    color: Color(0xFFdeaaff),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final Color color;
  final TextInputType textInputType;
  final bool obscureText;
  const CustomTextField({
    Key key,
    this.hintText,
    this.textEditingController,
    this.color,
    this.textInputType,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
      ),
      padding: EdgeInsets.all(5.0),
      height: 65,
      child: TextField(
        obscureText: obscureText,
        controller: textEditingController,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          errorStyle: TextStyle(color: Colors.white),
          filled: true,
        ),
      ),
    );
  }
}
