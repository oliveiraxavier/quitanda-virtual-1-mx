import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import '../../config/custom_colors.dart';
import 'components/category_tile.dart';
import 'package:quitanda_virtual_mx/src/config/app_data.dart' as app_data;

class HomeTab extends StatefulWidget {

  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

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

          // Categorias
          Container(
            padding: const EdgeInsets.only(left: 6),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) {
                return CategoryTile(
                    onPressed: () {
                      setState((){
                        selectedCategory = app_data.categories[index];
                      });

                    },
                    category: app_data.categories[index],
                    isSelected: app_data.categories[index] == selectedCategory,
                );
              },
              separatorBuilder: (_, int index) => const SizedBox(width: 10,),
              itemCount: app_data.categories.length,
            ),
          ),
          // Categorias

          // Grid  Produtos

          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.fromLTRB(16, 0, 16,16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 11.5,
              ),
              itemCount: app_data.items.length,
              itemBuilder: (_, index) {
                return Container(
                  color: Colors.red,
                );
              },
            ),
          ),
        ],
      ),


    );
  }
}
