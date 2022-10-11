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
          Container(
            padding: const EdgeInsets.symmetric(
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Email
                const CustomTextField(
                    icon: Icons.email,
                    label: 'Email',
                ),

                //Senha
                const CustomTextField(
                  icon: Icons.lock,
                  label: 'Senha',
                  isSecret: true,
                ),

                //Botão entrar
                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                    ),
                    onPressed: () {},
                    child: const Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 16
                        ),
                    ),
                  ),
                ),

                //Esqueceu a senha
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: (){},
                      child: const Text(
                        'Esqueceu a senha',
                        style: TextStyle(
                            color: Colors.redAccent
                        ),
                      )
                  ),
                ),

                // Divisor
                Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.withAlpha(90),
                          thickness: 1,
                        ),
                      ),

                      //Texto "OU"
                      const Padding (
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('OU'),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.withAlpha(90),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),

                //Botão Criar conta
                SizedBox(
                  height: 45,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                        ),
                        side: const BorderSide(
                          width: 2,
                          color: Colors.green,
                        )
                      ),
                      onPressed: () {},
                      child: const Text(
                          'Criar conta',
                          style: TextStyle(
                              fontSize: 16
                          ),
                      ),
                  ),
                )

              ],
            ),
          ),

        ],
      ),
    );
  }
}