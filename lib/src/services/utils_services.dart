import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:quitanda_virtual_mx/src/config/custom_colors.dart';
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

  void showToast({required String message, bool isError = false, bool isWarning = false}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: isError ? Colors.red : (isWarning ? Colors.amber.shade500 : CustomColors.customSwatchColor),
        textColor: Colors.white,
        fontSize: 14.0
    );
  }
}