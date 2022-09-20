import 'package:flutter/cupertino.dart';

class ModalButton extends StatelessWidget {
  const ModalButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      this.disabledColor = CupertinoColors.quaternarySystemFill})
      : super(key: key);
  final String buttonText;
  final Function onPressed;
  final Color disabledColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      disabledColor: disabledColor,
      onPressed: onPressed(),
      child: Text(buttonText),
    );
  }
}
