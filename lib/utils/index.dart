import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

showSnack(BuildContext context) => (String message) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    };

String formatDate(DateTime date) {
  return DateFormat('yyyy-MM-dd kk:mm').format(date);
}

DateTime stringToDate([String date = '']) {
  return date.isNotEmpty ? DateTime.parse(date) : DateTime.now();
}
