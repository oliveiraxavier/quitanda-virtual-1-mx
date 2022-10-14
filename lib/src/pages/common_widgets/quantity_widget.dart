import 'package:flutter/material.dart';
import 'package:quitanda_virtual_mx/src/config/custom_colors.dart';

class QuantityWidget extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function(int quantity) result;

  const QuantityWidget({
    Key? key,
    required this.suffixText,
    required this.value,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 2,
            blurRadius: .5,
          ),
        ],
      ),
      child: Row(
        children: [
          //Botão remover
          _QuantityButton(
            iconColor: Colors.grey,
            iconData: Icons.remove,
            onPressed: () {
              if (value == 1) {
                return;
              }
              result(value - 1);
            },
          ),

          //Texto com a quantidade entre os botões
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              '$value$suffixText',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //Botão add
          _QuantityButton(
            iconColor: CustomColors.customSwatchColor,
            iconData: Icons.add,
            onPressed: () => result(value + 1),
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final Color iconColor;
  final IconData iconData;
  final VoidCallback onPressed;

  const _QuantityButton({
    Key? key,
    required this.iconColor,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(50),
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: iconColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            iconData,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
