import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:intl/intl.dart';

class MyUtilClass {
  List<int> convertBase64ToImage(String _base64) {
    Uint8List bytes = base64.decode(_base64);
    return bytes;
  }

  String getCurrentDate() {
    DateTime now = DateTime.now();
    return DateFormat('dd/MM/yyyy').format(now);
  }

  String getCurrentTime() {
    DateTime now = DateTime.now();
    return DateFormat('hh:mm a').format(now);
  }

  String getCurrentTimeWithSeconds() {
    DateTime now = DateTime.now();
    return DateFormat('hh:mm:ss a').format(now);
  }

  Future<bool> isInternetAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  String checkNull(String value) {
    return value ?? "";
  }
}

String capitalizeWord(String value) {
  return value.isNotEmpty ? value[0].toUpperCase() + value.substring(1) : value;
}
