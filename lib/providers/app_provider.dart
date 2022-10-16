import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class AppProvider extends ChangeNotifier {
  static AppProvider state(BuildContext context) =>
      Provider.of<AppProvider>(context, listen: false);

  // keys
  final loginFormState = GlobalKey<FormBuilderState>();
  final registerFormState = GlobalKey<FormBuilderState>();

  // bottom bar
  int bottomIndex = 0;

  void setBottomIndex(int value) {
    bottomIndex = value;
    notifyListeners();
  }

  // drawer controller
  late AnimationController _animationController;
  AnimationController get animationController => _animationController;

  set animationController(AnimationController animationController) {
    _animationController = animationController;

    notifyListeners();
  }

  TickerFuture toggleDrawer() => animationController.isCompleted
      ? animationController.reverse()
      : animationController.forward();
}
