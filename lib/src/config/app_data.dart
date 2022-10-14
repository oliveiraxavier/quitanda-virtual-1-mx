import 'package:quitanda_virtual_mx/src/models/cart_item_model.dart';
import 'package:quitanda_virtual_mx/src/models/item_model.dart';

ItemModel abacaxi = ItemModel(
    description:
        'O melhor abacaxi da região e que conta com o melhor preço de qualquer concorrente',
    imgUrl: 'assets/fruits/abacaxi.png',
    itemName: 'Abacaxi',
    price: 7.4,
    unit: 'un');

ItemModel maca = ItemModel(
    description:
        'A melhor maçã da região e que conta com o melhor preço de qualquer concorrente',
    imgUrl: 'assets/fruits/maca.png',
    itemName: 'Maçã',
    price: 5.5,
    unit: 'kg');

ItemModel goiaba = ItemModel(
    description:
        'A melhor goiaba da região e que conta com o melhor preço de qualquer concorrente',
    imgUrl: 'assets/fruits/goiaba.png',
    itemName: 'Goiaba',
    price: 7.4,
    unit: 'kg');

ItemModel kiwi = ItemModel(
    description:
        'O melhor kiwi da região e que conta com o melhor preço de qualquer concorrente',
    imgUrl: 'assets/fruits/kiwi.png',
    itemName: 'Kiwi',
    price: 7.4,
    unit: 'kg');

ItemModel mamao = ItemModel(
    description:
        'O melhor mamao da região e que conta com o melhor preço de qualquer concorrente',
    imgUrl: 'assets/fruits/mamao.png',
    itemName: 'Mamão',
    price: 7.4,
    unit: 'kg');

ItemModel manga = ItemModel(
    description:
        'A melhor manga da região e que conta com o melhor preço de qualquer concorrente',
    imgUrl: 'assets/fruits/manga.png',
    itemName: 'Manga',
    price: 7.4,
    unit: 'kg');

ItemModel uva = ItemModel(
    description:
        'A melhor uva da região e que conta com o melhor preço de qualquer concorrente',
    imgUrl: 'assets/fruits/grape.png',
    itemName: 'Uva',
    price: 7.4,
    unit: 'kg');

List<ItemModel> items = [
  abacaxi,
  goiaba,
  kiwi,
  maca,
  mamao,
  manga,
  uva,
];

List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais',
];

List<CartItemModel> cartItems = [
  CartItemModel(
    item: maca,
    quantity: 2,
  ),
  CartItemModel(
    item: abacaxi,
    quantity: 1,
  ),
  CartItemModel(
    item: goiaba,
    quantity: 1,
  ),
];
