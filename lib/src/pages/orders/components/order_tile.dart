import 'package:flutter/material.dart';
import 'package:quitanda_virtual_mx/src/models/order_model.dart';
import 'package:quitanda_virtual_mx/src/pages/orders/components/order_status_widget.dart';
import 'package:quitanda_virtual_mx/src/services/utils_services.dart';

import '../../../models/cart_item_model.dart';
import '../../common_widgets/payment_dialog.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  OrderTile({Key? key, required this.order}) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  bool get isExpandedCard =>
      order.status == 'pending_payment' &&
          order.overdueDateTime.isAfter(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          initiallyExpanded: isExpandedCard,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pedido: ${order.id}'),
              Text(
                utilsServices.formatDateTime(order.createdDateTime),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  //Lista de produtos
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items.map((orderItem) {
                          return _OrderItemTileWidget(
                              utilsServices: utilsServices,
                              orderItem: orderItem);
                        }).toList(),
                      ),
                    ),
                  ),

                  //Divisão
                  const VerticalDivider(
                    color: Colors.black12,
                    thickness: 1.5,
                    width: 8,
                  ),
                  //Status do pedido
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      isOverdue: order.overdueDateTime.isBefore(DateTime.now()),
                    ),
                  ),
                ],
              ),
            ),

            //Total
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 20,

                  //color:
                ),
                children: [
                  const TextSpan(
                    text: 'Total ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: utilsServices.priceToCurrency(order.total),
                  ),
                ],
              ),
            ),

            //Botao pagamento
            Visibility(
              visible: order.status == 'pending_payment' && order.overdueDateTime.isAfter(DateTime.now()),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                icon: Image.asset(
                  'assets/app_images/pix.png',
                  height: 25,
                ),
                label: const Text('Ver QR PIX'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return PaymentDialog(order: order);
                    }
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemTileWidget extends StatelessWidget {
  const _OrderItemTileWidget({
    Key? key,
    required this.utilsServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 3),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Text(orderItem.item.itemName)),
          Text(utilsServices.priceToCurrency(orderItem.totalPrice())),
        ],
      ),
    );
  }
}
