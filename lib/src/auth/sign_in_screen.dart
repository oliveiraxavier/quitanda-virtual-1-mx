import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'components/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Column(
        children: [
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [

                  const Text.rich(
                      TextSpan(
                        style: TextStyle(
                            fontSize: 38,
                        ),
                        children: [
                          TextSpan(
                              text: 'Quitanda',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' online',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              )
                          )
                        ]
                      )

                  ),

                  //Categorias
                  SizedBox(
                    height: 30,
                    child: DefaultTextStyle(
                      //Tamanho do texto animado
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        pause: Duration.zero,
                        animatedTexts: [
                          FadeAnimatedText('Frutas'),
                          FadeAnimatedText('Verduras'),
                          FadeAnimatedText('Legumes'),
                          FadeAnimatedText('Carnes'),
                          FadeAnimatedText('Cereais'),
                          FadeAnimatedText('Laticínios'),
                          FadeAnimatedText('Te amo morecuda'),
                        ]),
                    ),
                  )
                ],
              )
          ),

          //Form
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