import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
class UtilsServices {
  //R$ valor
  String priceToCurrency(double price) {
    NumberFormat valor = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return valor.format(price);
  }

  String formatDateTime(DateTime dateTime, ) {
    initializeDateFormatting();

    DateFormat dateFormating = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormating.format(dateTime);
  }

}