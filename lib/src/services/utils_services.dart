import 'package:intl/intl.dart';

class UtilsServices {
  //R$ valor
  String priceToCurrency(double price) {
    NumberFormat valor = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return valor.format(price);
  }

}