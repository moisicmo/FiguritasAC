import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool stateLoading;
  const ButtonComponent({Key? key, required this.text, required this.onPressed, this.stateLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 200,
        padding: const EdgeInsets.symmetric(vertical: 19),
        disabledColor: Colors.grey,
        onPressed: onPressed,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          stateLoading
              ? Center(
                  child: Image.asset(
                  'assets/images/load.gif',
                  fit: BoxFit.cover,
                  height: 20,
                ))
              : Text(text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
        ]));
  }
}

class ButtonWhiteComponent extends StatelessWidget {
  final String text;
  final Color? colorText;
  final Function()? onPressed;
  const ButtonWhiteComponent({Key? key, required this.text, required this.onPressed, this.colorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
