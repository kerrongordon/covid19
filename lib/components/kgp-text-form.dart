import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KgpTextForm extends StatelessWidget {
  final String labelText;
  final String prefixText;
  final Widget prefixIcon;
  final bool obscureText;
  final bool enabled;
  final String initialValue;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final String Function(String) validator;
  final void Function(String) onSaved;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final TextInputAction textInputAction;
  final void Function(String) onFieldSubmitted;
  final List<TextInputFormatter> inputFormatters;

  const KgpTextForm({
    Key key,
    @required this.labelText,
    @required this.prefixIcon,
    this.prefixText,
    this.validator,
    bool obscureText,
    @required this.keyboardType,
    this.onSaved,
    this.controller,
    this.initialValue,
    this.inputFormatters,
    this.onChanged,
    this.textInputAction,
    this.onFieldSubmitted,
    this.focusNode,
    this.enabled,
  })  : obscureText = obscureText ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned(
          top: -3.9,
          left: -3.8,
          right: -3.8,
          child: Card(
            child: Container(
              padding: const EdgeInsets.only(bottom: 48),
            ),
          ),
        ),
        TextFormField(
          key: key,
          autocorrect: true,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          inputFormatters: inputFormatters,
          focusNode: focusNode,
          controller: controller,
          autovalidate: false,
          validator: validator,
          autofocus: false,
          onSaved: onSaved,
          onChanged: onChanged,
          initialValue: initialValue,
          obscureText: obscureText,
          keyboardType: keyboardType,
          enabled: enabled,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color,
          ),
          decoration: InputDecoration(
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,
            helperText: ' ',
            prefixIcon: prefixIcon,
            fillColor: Theme.of(context).cardTheme.color,
            prefixText: prefixText,
            contentPadding: const EdgeInsets.all(0),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(30.0),
              ),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
