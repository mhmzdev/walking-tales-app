import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:walking_tales/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:walking_tales/configs/app_theme.dart';
import 'package:walking_tales/configs/app_typography.dart';
import 'package:walking_tales/configs/app_typography_ext.dart';
import 'package:walking_tales/providers/user_location.dart';
import 'package:walking_tales/screens/tracking/widgets/step_counter.dart';
import 'package:walking_tales/widgets/circular_back_button.dart';

import '../../configs/space.dart';
import '../../providers/app_provider.dart';
import '../../utils/map_utils.dart';
import '../../widgets/primary_button.dart';
part 'widgets/bottom_bar.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  late Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  late UserLocationProvider userLocationProvider;
  StreamSubscription<LocationData>? stream;
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  late AppProvider app;
  LatLng lastKnownLocation = const LatLng(0, 0);
  double bottomPadding = 80;
  int userSteps = 0;
  setupMarkerAndCircle(LatLng userLocation) async {
    try {
      lastKnownLocation = userLocation;
      polylineCoordinates
          .add(LatLng(lastKnownLocation.latitude, lastKnownLocation.longitude));

      PolylineId polyID = const PolylineId(
        "userLocationTrack",
      );
      Polyline polyline = Polyline(
        startCap: Cap.roundCap,
        width: 5,
        endCap: Cap.roundCap,
        polylineId: polyID,
        color: Colors.red,
        points: polylineCoordinates,
      );

      setState(() {
        polylines[polyID] = polyline;
        MarkerId userMarker = const MarkerId('userLocation');

        markers[userMarker] = Marker(
            markerId: userMarker,
            position: LatLng(userLocation.latitude, userLocation.longitude),
            onTap: () {});
      });
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(userLocation.latitude, userLocation.longitude),
        zoom: MapUtils.getZoomLevel(1000),
      )));
    } catch (e) {
      debugPrint("Something Went Wrong\n ${e.toString()}");
    }
  }

  startListeningToUserLocation() async {
    try {
      Stream<LocationData>? locationStream =
          await MapUtils.getUserLocationStream();

      stream = locationStream!.listen((LocationData data) async {
        if (!mounted) return;
        userSteps = app.setUserStepCountAndSpeed(
            await MapUtils.getStepCount(
                userLocationProvider.userLocation!, data),
            data.speed!);

        setupMarkerAndCircle(LatLng(data.latitude!, data.longitude!));
      });
      stream!.onError((v) {
        debugPrint("stream Error$v");
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userLocationProvider = Provider.of<UserLocationProvider>(context);
    app = Provider.of<AppProvider>(context);
    if (mounted) {
      setupMarkerAndCircle(userLocationProvider.userLocation!);
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              padding: EdgeInsets.only(bottom: bottomPadding),
              compassEnabled: false,
              mapToolbarEnabled: false,
              initialCameraPosition: CameraPosition(
                target: const LatLng(
                  33.6843312,
                  72.9884995,
                ),
                zoom: MapUtils.getZoomLevel(1000),
              ),
              onMapCreated: (controller) {
                _controller.complete(controller);
                setState(() {
                  bottomPadding = 70;
                });
              },
              gestureRecognizers: {}..add(
                  Factory<OneSequenceGestureRecognizer>(
                    () => EagerGestureRecognizer(),
                  ),
                ),
              polylines: Set<Polyline>.of(polylines.values),
              markers: Set<Marker>.of(markers.values),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _BottomBar(onButtonPress: () async {
                if (stream != null) {
                  app.setDistanceTraveled(
                    MapUtils.getDistance(
                      userLocationProvider.userLocation!,
                      lastKnownLocation,
                    ),
                  );

                  userLocationProvider.userLocation = lastKnownLocation;
                  app.setPolyCoordinates(polylineCoordinates);
                  await stream!.cancel().then((value) =>
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.trackCompleted));
                } else {
                  polylines = {};
                  startListeningToUserLocation();
                }
              }),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: StepCounter(
                userSteps: userSteps,
              ),
            ),
            if (!app.isTrackingStarted)
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularBackButton(
                    color: AppTheme.c.primary,
                    iconColor: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
