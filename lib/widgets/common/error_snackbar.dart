import 'package:flutter/material.dart';

class ErrorSnackbar extends StatelessWidget {
  final String message;
  const ErrorSnackbar(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('ddddddddddd');
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
    return const SizedBox.shrink();
  }
}
