import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quitanda_virtual_mx/src/pages/auth/sign_up_screen.dart';
import '../../config/custom_colors.dart';
import '../base/base_screen.dart';
import '../common_widgets/app_name_widget.dart';
import '../common_widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: mediaSize.height,
          width:  mediaSize.width,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [

                      // Nome do app

                      const AppNameWidget(
                        greenTitleColor: Colors.white,
                        textSize: 40,
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (c) {
                                return const BaseScreen();
                              })
                          );
                        },
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
                          child: Text(
                            'Esqueceu a senha',
                            style: TextStyle(
                                color: CustomColors.customContrastColor
                            ),
                          )
                      ),
                    ),

                    // Divisor
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
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
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (c) {
                                return SignUpScreen();
                              })
                            );
                          },
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
        ),
      ),
    );
  }
}