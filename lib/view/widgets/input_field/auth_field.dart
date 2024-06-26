import 'package:better_one/core/constants/constants.dart';
import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  const AuthField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.textFieldHeight,
    this.prefixIcon,
    this.validator,
    this.isItPassword = false,
    this.textInputAction,
    this.readOnly = false,
  });
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final double? textFieldHeight;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final bool isItPassword;
  final TextInputAction? textInputAction;

  final bool readOnly;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool isPasswordObsucred = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: widget.textInputAction,
      obscureText: widget.isItPassword && isPasswordObsucred,
      readOnly: widget.readOnly,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        isDense: true,
        suffixIcon: widget.isItPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordObsucred = !isPasswordObsucred;
                  });
                },
                icon: isPasswordObsucred
                    ? const Icon(Icons.visibility_rounded)
                    : const Icon(Icons.visibility_off_rounded),
              )
            : null,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        labelStyle: Theme.of(context).textTheme.bodySmall,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppMetrices.borderRadius1),
          borderSide: BorderSide(
            color: Theme.of(context).secondaryHeaderColor,
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        prefixIcon: widget.prefixIcon,
      ),
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            height: widget.textFieldHeight,
          ),
    );
  }
}
