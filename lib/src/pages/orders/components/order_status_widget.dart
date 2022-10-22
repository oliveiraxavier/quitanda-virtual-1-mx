import 'package:flutter/material.dart';
import 'package:quitanda_virtual_mx/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  OrderStatusWidget({Key? key, required this.status, required this.isOverdue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDot(
          isActive: true,
          title: 'Pedido confirmado',
        ),

        const _CustomDotDivider(),

        if (currentStatus == 1) ...[
          const _StatusDot(
            isActive: true,
            title: 'Pix Extornado',
            backgroundColor: Colors.orange,
          ),
        ] else if (isOverdue) ...[
          const _StatusDot(
            isActive: true,
            title: 'Pagamento pix vencido',
            backgroundColor: Colors.red,
          ),
        ] else ...[
          _StatusDot(
            isActive: currentStatus > 1,
            title: 'Pagamento',
          ),

          const _CustomDotDivider(),

          _StatusDot(
            isActive: currentStatus > 2,
            title: 'Preparando',
          ),

          const _CustomDotDivider(),

          _StatusDot(
            isActive: currentStatus > 3,
            title: 'Envio',
          ),

          const _CustomDotDivider(),

          _StatusDot(
            isActive: currentStatus > 4,
            title: 'Entregue',
          ),

        ],
      ],
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color? backgroundColor;

  const _StatusDot({
    Key? key,
    required this.isActive,
    required this.title,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icone Dot
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: backgroundColor ?? CustomColors.customSwatchColor,
            ),
            color: isActive
                ? (backgroundColor ?? CustomColors.customSwatchColor)
                : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(
          width: 5,
        ),
        //Texto
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class _CustomDotDivider extends StatelessWidget {
  const _CustomDotDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 2.5,
      ),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}
