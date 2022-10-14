import 'package:flutter/material.dart';
import 'package:quitanda_virtual_mx/src/pages/common_widgets/custom_text_field.dart';
import 'package:quitanda_virtual_mx/src/config/app_data.dart' as app_data;

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil do usuário',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          //email
          CustomTextField(
            icon: Icons.email,
            label: 'Email',
            initialValue: app_data.user.email,
            readOnly: true,
          ),

          //nome
          CustomTextField(
            icon: Icons.person,
            label: 'Nome',
            initialValue: app_data.user.name,
            readOnly: true,
          ),

          //celular
          CustomTextField(
            icon: Icons.phone,
            label: 'Telefone',
            initialValue: app_data.user.phone,
            readOnly: true,
          ),

          //cpf
          CustomTextField(
            icon: Icons.list_alt,
            label: 'CPF',
            isSecret: true,
            initialValue: app_data.user.cpf,
            readOnly: true,
          ),

          //Botão atualiza senha
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 18,
                ),
                side: const BorderSide(
                  color: Colors.green,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                updatePassword();
              },
              child: const Text(
                'Alterar senha',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return
           SingleChildScrollView(
           child: Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 80.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 16),
                          child: Text(
                            'Atualização de senha',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const CustomTextField(
                          icon: Icons.lock,
                          label: 'Senha Atual',
                          isSecret: true,
                        ),
                        const CustomTextField(
                          icon: Icons.lock_outline,
                          label: 'Nova senha',
                          isSecret: true,
                        ),
                        const CustomTextField(
                          icon: Icons.lock_outline,
                          label: 'Confirmar nova senha',
                          isSecret: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //Botão confirmação
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Salvar',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),

                              //textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Fechar dialog
                  Positioned(
                    top: 2,
                    right: 2,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.close,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
      },
    );
  }
}
