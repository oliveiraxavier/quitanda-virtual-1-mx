import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:quitanda_virtual_mx/src/config/custom_colors.dart';

import 'components/category_tile.dart';

class HomeTab extends StatefulWidget {

  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> categories = [
    'Frutas',
    'Grãos',
    'Verduras',
    'Temperos',
    'Cereais',
  ];

  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar  (
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text.rich(
          TextSpan(children: [
            TextSpan(
              text: 'Quitanda',
              style: TextStyle(
                color: CustomColors.customSwatchColor,
              ),
            ),
            TextSpan(
              text: ' online',
              style: TextStyle(
                color: CustomColors.customContrastColor,
              ),
            ),
          ]),
        ),
        actions: [
          //Icone carrinho topo
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 30,
            ),
            child: GestureDetector(
              onTap: () {

              },
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
                ),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          //Campo de pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Pesquise aqui...',
                prefixIcon: Icon(
                  Icons.search,
                  color: CustomColors.customContrastColor,
                  size: 30,
                ),
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),

          // Campo de pesquisa
          Container(
            padding: EdgeInsets.only(left: 6),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) {
                return CategoryTile(
                    onPressed: () {
                      setState((){
                        selectedCategory = categories[index];
                      });

                    },
                    category: categories[index],
                    isSelected: categories[index] == selectedCategory,
                );
              },
              separatorBuilder: (_, int index) => const SizedBox(width: 10,),
              itemCount: categories.length,
            ),
          ),
          // Categorias

          // Grid
        ],
      ),


    );
  }
}
