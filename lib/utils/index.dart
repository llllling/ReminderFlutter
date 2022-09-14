import 'package:flutter/material.dart';

showSnack(BuildContext context) => (String message) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    };
