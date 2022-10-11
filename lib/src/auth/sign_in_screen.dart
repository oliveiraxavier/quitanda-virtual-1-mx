import 'package:flutter/material.dart';

import 'components/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: Column(
        children: [
          Expanded(
              child: Container(
                color: Colors.lightGreenAccent,
              )
          ),
          Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(35)
                  ),
                ),
                child: Column(
                  children: [
                    CustomTextField(
                        icon: Icons.email,
                        label: 'Email',
                    ),
                    CustomTextField(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                    ),
                  ],
                ),
              )
          ),

        ],
      ),
    );
  }
}