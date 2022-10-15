import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walking_tales/configs/configs.dart';

class CustomTextField extends StatefulWidget {
  final String name;
  final TextEditingController? controller;
  final String? hint;
  final bool? isPass;
  final bool? enabled;
  final double? width;
  final String? label;

  final bool? autoFocus;
  final FocusNode? node;

  final Widget? prefixIcon;
  final bool? isSuffixIcon;
  final String? initialValue;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;

  final String? errorText;
  final String? Function(String?)? validatorFtn;
  final String? Function(String?)? onChangeFtn;
  final List<TextInputFormatter>? inputformatters;

  const CustomTextField({
    Key? key,
    this.node,
    this.label,
    this.enabled,
    this.errorText,
    this.autoFocus,
    this.prefixIcon,
    this.onChangeFtn,
    this.initialValue,
    this.validatorFtn,
    required this.name,
    this.controller,
    required this.hint,
    this.isPass = false,
    this.isSuffixIcon = false,
    required this.textInputType,
    this.inputformatters,
    this.width = double.infinity,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.sentences,
  }) : super(key: key);

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool show = false;

  @override
  void initState() {
    show = widget.isPass!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppText.b2b.cl(
              AppTheme.c.accent,
            ),
          ),
          Space.y,
        ],
        FormBuilderTextField(
          controller: widget.controller,
          inputFormatters: widget.inputformatters,
          style: AppText.b2,
          textCapitalization: widget.textCapitalization,
          enabled: widget.enabled ?? true,
          initialValue: widget.initialValue,
          name: widget.name,
          autofocus: widget.autoFocus ?? false,
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType,
          focusNode: widget.node,
          obscureText: show,
          decoration: InputDecoration(
            errorText: widget.errorText,
            prefixIcon: widget.isSuffixIcon! ? null : widget.prefixIcon,
            suffixIcon: widget.isPass!
                ? IconButton(
                    splashRadius: AppDimensions.normalize(8),
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    icon: Icon(
                      show ? Icons.visibility_off : Icons.visibility,
                      size: AppDimensions.normalize(7),
                    ),
                  )
                : null,
            filled: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
            hintText: widget.hint,
            hintStyle: AppText.b2.cl(Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                width: AppDimensions.normalize(0.75),
                color: AppTheme.c.textSub!.withAlpha(100),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppTheme.c.primary,
                width: AppDimensions.normalize(0.75),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.red.withAlpha(200),
                width: AppDimensions.normalize(0.75),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.red.withAlpha(200),
                width: AppDimensions.normalize(0.75),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                width: AppDimensions.normalize(0.75),
                color: AppTheme.c.textSub!.withAlpha(100),
              ),
            ),
          ),
          validator: widget.validatorFtn,
          onChanged: widget.onChangeFtn,
        ),
      ],
    );
  }
}
