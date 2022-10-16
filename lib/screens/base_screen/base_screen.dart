import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:walking_tales/configs/app_dimensions.dart';
import 'package:walking_tales/configs/app_theme.dart';
import 'package:walking_tales/providers/app_provider.dart';
import 'package:walking_tales/screens/dashboard/dashboard.dart';
import 'package:walking_tales/widgets/drawer/app_drawer.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen>
    with SingleTickerProviderStateMixin {
  static const Duration toggleDuration = Duration(milliseconds: 250);
  static const double maxSlide = 280;
  static const double minDragStartEdge = 60;
  static const double maxDragStartEdge = maxSlide - 16;
  late AnimationController _animationController;
  bool _canBeDragged = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _BaseScreenState.toggleDuration,
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final app = Provider.of<AppProvider>(context, listen: false);
      app.animationController = _animationController;
    });
  }

  void close() {
    _animationController.reverse();
  }

  void open() => _animationController.forward();

  void toggleDrawer() => _animationController.isCompleted ? close() : open();

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));

    return WillPopScope(
      onWillPop: () async {
        if (_animationController.isCompleted) {
          close();
          return false;
        }
        return true;
      },
      child: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        child: Scaffold(
          backgroundColor: AppTheme.c.primary,
          body: AnimatedBuilder(
            animation: _animationController,
            child: const DashboardScreen(),
            builder: (context, child) {
              double animValue = _animationController.value;
              final slideAmount = maxSlide * animValue;
              final contentScale = 1.0 - (0.3 * animValue);
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  const AppDrawer(),
                  Transform(
                    transform: Matrix4.identity()..translate(slideAmount - 80),
                    alignment: Alignment.center,
                    child: Container(
                      height: AppDimensions.size.height * 0.64,
                      width: AppDimensions.size.width * 0.66,
                      decoration: BoxDecoration(
                        color: const Color(0xffD9D9D9),
                        borderRadius: slideAmount != 0
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              )
                            : const BorderRadius.only(),
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.identity()
                      ..translate(slideAmount)
                      ..scale(contentScale, contentScale),
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: _animationController.isCompleted ? close : null,
                      child: ClipRRect(
                        borderRadius: slideAmount != 0
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                              )
                            : const BorderRadius.only(),
                        child: child,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = _animationController.isDismissed &&
        details.globalPosition.dx < minDragStartEdge;
    bool isDragCloseFromRight = _animationController.isCompleted &&
        details.globalPosition.dx > maxDragStartEdge;

    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta! / maxSlide;
      _animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    //I have no idea what it means, copied from Drawer
    double kMinFlingVelocity = 365.0;

    if (_animationController.isDismissed || _animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= kMinFlingVelocity) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value < 0.5) {
      close();
    } else {
      open();
    }
  }
}
