import 'package:flutter/material.dart';
import 'package:quitanda_virtual_mx/src/config/custom_colors.dart';
import 'package:quitanda_virtual_mx/src/models/item_model.dart';
import 'package:quitanda_virtual_mx/src/services/utils_services.dart';
import '../../product/product_screen.dart';

class ItemTile extends StatefulWidget {
  final ItemModel item;
  final void Function(GlobalKey) cartAnimationMethod;

  const ItemTile({
      Key? key,
      required this.item,
      required this.cartAnimationMethod
  }) : super(key: key);

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  final GlobalKey imageGk = GlobalKey();

  final UtilsServices utilsServices = UtilsServices();

  IconData tileIcon = Icons.add_shopping_cart_outlined;

  Future<void> switchIcon() async {
    setState(() => tileIcon = Icons.check);

    await Future.delayed(const Duration (milliseconds: 1500));

    setState(() => tileIcon = Icons.add_shopping_cart_outlined);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Conteudo
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (c) => ProductScreen(
                  item: widget.item,
                ),
              )
            );
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
                    child: Hero(
                        tag: widget.item.imgUrl,
                        child: Container(
                            key: imageGk,
                            child: Image.asset(widget.item.imgUrl)
                        )
                    ),
                  ),
                  //Nome
                  Text(
                    widget.item.itemName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //Preco - Unidade
                  Row(children: [
                    Text(
                      utilsServices.priceToCurrency(widget.item.price),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: CustomColors.customSwatchColor,
                      ),
                    ),
                    Text(
                      '/${widget.item.unit}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),

        //Icone add carrinho topo direita card
        Positioned(
          top: 4,
          right: 4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Material(
              child: InkWell(
                borderRadius: const BorderRadius.only(),
                onTap: () {
                  switchIcon();
                  widget.cartAnimationMethod(imageGk);
                },
                child: Ink(
                  height: 40,
                  width: 35,
                  decoration: BoxDecoration(
                    color: CustomColors.customSwatchColor,
                  ),
                  child: Icon(
                    tileIcon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
