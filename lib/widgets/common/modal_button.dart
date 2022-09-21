import 'package:flutter/cupertino.dart';

class ModalButton extends StatelessWidget {
  const ModalButton(
      {Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);
  final String buttonText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: () => onPressed(),
      child: Text(buttonText),
    );
  }
}
