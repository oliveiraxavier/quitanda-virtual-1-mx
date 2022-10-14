import 'package:flutter/material.dart';
import 'package:quitanda_virtual_mx/src/config/custom_colors.dart';
import 'package:quitanda_virtual_mx/src/models/item_model.dart';
import 'package:quitanda_virtual_mx/src/services/utils_services.dart';

import '../common_widgets/quantity_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.item}) : super(key: key);

  final ItemModel item;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utilsServices = UtilsServices();

  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        //Conteúdo
        children: [
          Column(
            children: [
              //Imagem
              Expanded(
                child: Hero(tag: widget.item.imgUrl, child: Image.asset(widget.item.imgUrl)),
              ),

              //Card
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(35),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade600,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //Nome - Quantidade
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.item.itemName,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 27),
                              ),
                            ),
                            QuantityWidget(
                              suffixText: widget.item.unit,
                              value: cartItemQuantity,
                              result: (quantity) {
                                setState(() {
                                  cartItemQuantity = quantity;
                                });
                              },
                            ),
                          ],
                        ),

                        // Preço
                        Text(
                          utilsServices.priceToCurrency(widget.item.price),
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.customSwatchColor,
                          ),
                        ),

                        //Descrição
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 100),
                            child: SingleChildScrollView(
                              child: Text(
                                widget.item.description,
                                style: const TextStyle(
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),

                        //Botão
                        SizedBox(
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            label: const Text(
                              'Adicionar ao carrinho',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            icon: const Icon(Icons.shopping_cart_outlined),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),

          //Botão voltar
          Positioned(
            top: 10,
            left: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
