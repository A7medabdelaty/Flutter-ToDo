import 'package:first_project/shared/components/components.dart';
import 'package:flutter/material.dart';

var usernameController = TextEditingController();
var passwordController = TextEditingController();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  defaultInputField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Email can\'t be empty';
                        }
                        return null;
                      },
                      controller: usernameController,
                      keyboardType: TextInputType.emailAddress,
                      onSubmit: (value) {},
                      label: 'Email Address',
                      prefixIcon: Icons.email),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultInputField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Password can\'t be empty';
                      }
                      return null;
                    },
                    controller: passwordController,
                    obscureText: isPassword,
                    keyboardType: TextInputType.visiblePassword,
                    label: 'Password',
                    prefixIcon: Icons.lock,
                    suffixAction: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    onSubmit: (value) {},
                    suffixIcon:
                        isPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultButton(
                      text: 'Login',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      }),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                          onPressed: () {}, child: const Text('Register Now'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
