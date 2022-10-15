import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walking_tales/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomMultiLineTextField extends StatelessWidget {
  final TextInputAction? textInputAction;
  final String name;
  final bool? enabled;
  final FocusNode? node;
  final String? hint;
  final double? width;
  final String? initialValue;

  final String? Function(String?)? validatorFtn;
  final String? Function(String?)? onChangeFtn;

  const CustomMultiLineTextField({
    Key? key,
    this.enabled,
    this.initialValue,
    this.validatorFtn,
    this.onChangeFtn,
    this.width = double.infinity,
    this.textInputAction = TextInputAction.newline,
    this.node,
    required this.name,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));

    return SizedBox(
      width: AppDimensions.normalize(250),
      child: FormBuilderTextField(
        style: AppText.b2.cl(
          Colors.black,
        ),
        maxLines: 7,
        enabled: enabled ?? true,
        initialValue: initialValue,
        name: name,
        autofocus: false,
        textInputAction: textInputAction,
        keyboardType: TextInputType.multiline,
        textCapitalization: TextCapitalization.sentences,
        focusNode: node,
        decoration: InputDecoration(
          filled: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
          hintText: hint,
          hintStyle: AppText.b2.cl(Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: AppTheme.c.textSub!.withAlpha(100),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: AppTheme.c.primary,
              width: AppDimensions.normalize(0.75),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Colors.red.withAlpha(200),
              width: AppDimensions.normalize(0.75),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Colors.red.withAlpha(200),
              width: AppDimensions.normalize(0.75),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              width: AppDimensions.normalize(0.75),
              color: AppTheme.c.textSub!.withAlpha(100),
            ),
          ),
        ),
        validator: validatorFtn,
        onChanged: onChangeFtn,
      ),
    );
  }
}
