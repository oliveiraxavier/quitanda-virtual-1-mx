import 'package:flutter/material.dart';
import 'package:quitanda_virtual_mx/src/config/custom_colors.dart';
import 'package:quitanda_virtual_mx/src/models/item_model.dart';
import 'package:quitanda_virtual_mx/src/services/utils_services.dart';

import '../../product/product_screen.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;

  ItemTile({Key? key, required this.item}) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Conteudo
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (c) => ProductScreen(
                item: item,
              ),
            ));
          },
          child: Card(
            elevation: 3,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Imagem
                  Expanded(
                    child:
                        Hero(tag: item.imgUrl, child: Image.asset(item.imgUrl)),
                  ),
                  //Nome
                  Text(item.itemName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  //Preco - Unidade
                  Row(
                    children: [
                      Text(
                          utilsServices.priceToCurrency(item.price),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: CustomColors.customSwatchColor,
                          ),
                        ),

                      Text(
                      '/${item.unit}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    ]
                  ),
                ],
              ),
            ),
          ),
        ),

        //Icone add carrinho topo direita card
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                color: CustomColors.customSwatchColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: const Icon(Icons.add_shopping_cart_outlined,
                  color: Colors.white, size: 20),
            ),
          ),
        ),
      ],
    );
  }
}
