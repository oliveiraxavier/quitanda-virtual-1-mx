
import 'package:quitanda_virtual_mx/src/models/item_model.dart';


ItemModel apple = ItemModel(
  description: 'A melhor maçã da região e que conta com o melhor preço de qualquer concorrente',
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Maçã',
  price: 5.5,
  unit: 'kg'
);

ItemModel grape = ItemModel(
    description: 'A melhor uva da região e que conta com o melhor preço de qualquer concorrente',
    imgUrl: 'assets/fruits/grape.png',
    itemName: 'Uva',
    price: 7.4,
    unit: 'kg'
);

ItemModel goiaba = ItemModel(
    description: 'A melhor goiaba da região e que conta com o melhor preço de qualquer concorrente',
    imgUrl: 'assets/fruits/goiaba.png',
    itemName: 'Goiaba',
    price: 7.4,
    unit: 'kg'
);

ItemModel kiwi = ItemModel(
    description: 'O melhor kiwi da região e que conta com o melhor preço de qualquer concorrente',
    imgUrl: 'assets/fruits/kiwi.png',
    itemName: 'Kiwi',
    price: 7.4,
    unit: 'kg'
);

ItemModel mamao = ItemModel(
    description: 'O melhor mamao da região e que conta com o melhor preço de qualquer concorrente',
    imgUrl: 'assets/fruits/mamao.png',
    itemName: 'Mamão',
    price: 7.4,
    unit: 'kg'
);

ItemModel manga = ItemModel(
    description: 'A melhor manga da região e que conta com o melhor preço de qualquer concorrente',
    imgUrl: 'assets/fruits/manga.png',
    itemName: 'Manga',
    price: 7.4,
    unit: 'kg'
);

List<ItemModel> items = [
  apple,
  grape,
  goiaba,
  kiwi,
  mamao,
  manga,
];

List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais',
];