import 'package:flutter/cupertino.dart';

class NavbarItemModel {
  final String label;
  final CustomPaint icon;
  final bool? isSelected;
  NavbarItemModel({
    required this.label,
    required this.icon,
    this.isSelected,
  });

  NavbarItemModel copyWith({
    String? label,
    CustomPaint? icon,
    bool? isSelected,
  }) {
    return NavbarItemModel(
      label: label ?? this.label,
      icon: icon ?? this.icon,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
