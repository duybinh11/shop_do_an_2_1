import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_do_an_2_1/HomePage/ui/HomePage.dart';

import '../bloc/login_bloc.dart';
import 'FormLogin.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/LoginPage';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is SLoginFail) {
            showDialog(
              context: context,
              builder: (context) =>
                  showdialogCustom(context, 'Thông Báo', 'Đăng nhập thất bại'),
            );
          }
          if (state is SLoginSuccess) {
            Navigator.pushReplacementNamed(context, HomePage.routeName);
          }
        },
        builder: (context, state) {
          if (state is SLoginLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset('assets/img/login.jpg')),
              const Expanded(child: FormLogin())
            ],
          );
        },
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

AlertDialog showdialogCustom(
    BuildContext context, String title, String content) {
  return AlertDialog(
    title: Text(
      title,
      style: const TextStyle(
          color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
    ),
    content: Text(
      content,
      style: const TextStyle(fontSize: 15),
    ),
    actions: [
      GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Text(
          'Đóng',
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
    ],
  );
}

AlertDialog showdialogLoading(BuildContext context) {
  return const AlertDialog(
    content: SizedBox(
        height: 100,
        width: 100,
        child: Center(child: CircularProgressIndicator())),
  );
}
