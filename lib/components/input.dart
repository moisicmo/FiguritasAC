import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputComponent extends StatelessWidget {
  final IconData? icon;
  final String labelText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final TextEditingController controllerText;
  final List<TextInputFormatter>? inputFormatters;
  final Function() onEditingComplete;
  final Function(String) validator;
  final bool obscureText;
  final Function()? onTap;
  final IconData? iconOnTap;
  final TextCapitalization textCapitalization;
  final Function(String)? onChanged;
  final Function()? onTapInput;
  final bool? stateAutofocus;
  const InputComponent(
      {Key? key,
      required this.labelText,
      required this.keyboardType,
      required this.textInputAction,
      this.focusNode,
      required this.controllerText,
      this.inputFormatters,
      required this.onEditingComplete,
      required this.validator,
      this.icon,
      this.obscureText = false,
      this.onTap,
      this.iconOnTap,
      this.textCapitalization = TextCapitalization.none,
      this.onChanged,
      this.onTapInput,
      this.stateAutofocus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: stateAutofocus!,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.center,
      style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'ubuntu'),
      focusNode: focusNode,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      validator: (text) => validator(text!),
      controller: controllerText,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onTap: onTapInput,
      
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: InkWell(
            onTap: onTap,
            child: Icon(
              iconOnTap,
            ),
          )),
    );
  }
}
