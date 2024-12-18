import 'package:better_one/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthInputField extends StatefulWidget {
  const AuthInputField({
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
    this.floatingLabelBehavior,
    this.keyboardType,
  });
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final double? textFieldHeight;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final bool isItPassword;
  final TextInputAction? textInputAction;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool readOnly;
  final TextInputType? keyboardType;

  @override
  State<AuthInputField> createState() => _AuthInputFieldState();
}

class _AuthInputFieldState extends State<AuthInputField> {
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
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        floatingLabelBehavior: widget.floatingLabelBehavior,
        labelText: widget.labelText,
        hintText: widget.hintText,
        isDense: true,
        suffixIcon: widget.isItPassword
            ? MaterialButton(
                // color: Theme.of(context).primaryColor,
                splashColor: Theme.of(context).secondaryHeaderColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppMetrices.borderRadius1.r),
                    bottomRight: Radius.circular(AppMetrices.borderRadius1.r),
                  ),
                ),
                // icon
                onPressed: () {
                  setState(() {
                    isPasswordObsucred = !isPasswordObsucred;
                  });
                },
                child: isPasswordObsucred
                    ? Icon(
                        Icons.visibility_rounded,
                        color: Theme.of(context).primaryColorDark,
                      )
                    : Icon(
                        Icons.visibility_off_rounded,
                        color: Theme.of(context).primaryColorDark,
                      ),
              )
            : null,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        labelStyle: Theme.of(context).textTheme.bodySmall,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppMetrices.borderRadius1.r),
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
