import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:walking_tales/cubits/user_stats/cubit.dart';
import 'package:walking_tales/models/stats.dart';

class AppProvider extends ChangeNotifier {
  static AppProvider state(BuildContext context) =>
      Provider.of<AppProvider>(context, listen: false);

  // keys
  final dietFormState = GlobalKey<FormBuilderState>();
  final loginFormState = GlobalKey<FormBuilderState>();
  final registerFormState = GlobalKey<FormBuilderState>();
  final challengeFormState = GlobalKey<FormBuilderState>();

  // bottom bar
  int bottomIndex = 0;
  bool _trackingStarted = false;
  int _userStepCount = 0;
  double _speed = 0;
  double _distanceTraveled = 0;
  List<LatLng> _polyCoordinates = [];
  setPolyCoordinates(List<LatLng> coor) {
    _polyCoordinates = coor;
    notifyListeners();
  }

  setDistanceTraveled(double distance) {
    _distanceTraveled = distance;
    notifyListeners();
  }

  int setUserStepCountAndSpeed(int val, double speed) {
    _userStepCount = val;
    _speed = speed;

    return _userStepCount;
  }

  get getSpeed => _speed;
  get getUserStepCount => _userStepCount;

  void setBottomIndex(int value) {
    bottomIndex = value;
    notifyListeners();
  }

  set setTrackingStatus(bool val) {
    _trackingStarted = val;
    notifyListeners();
  }

  get isTrackingStarted => _trackingStarted;

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

  String getAppropriateValue(int index) {
    switch (index) {
      case 0:
        return (_distanceTraveled / 1000).toStringAsFixed(1);
      case 1:
        return (_userStepCount * 0.035).ceilToDouble().toString();
      case 2:
        return ((_speed * 3600) / 1000).toStringAsFixed(1);
      default:
    }

    return "";
  }

  Future<void> resetCredentials(BuildContext context) async {
    Stats stats = Stats(
        id: DateTime.now().microsecondsSinceEpoch,
        checkedInAt: DateTime.now(),
        userStepCount: _userStepCount,
        speed: _speed,
        distanceTraveled: _distanceTraveled,
        caloriesBurned: double.parse(getAppropriateValue(1)).toInt(),
        polyCoordinates: _polyCoordinates);
    _trackingStarted = false;
    _userStepCount = 0;
    _speed = 0;
    _distanceTraveled = 0;
    _polyCoordinates = [];
    await BlocProvider.of<UserStatsCubit>(context).submitStats(stats);
    notifyListeners();
  }
}
