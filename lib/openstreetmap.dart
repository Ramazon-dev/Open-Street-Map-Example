import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class OpenStreetMapPage extends StatefulWidget {
  const OpenStreetMapPage({Key? key}) : super(key: key);

  @override
  State<OpenStreetMapPage> createState() => _OpenStreetMapPageState();
}

MapController controller = MapController(
  initMapWithUserPosition: false,
  initPosition: GeoPoint(latitude: 41.3494548, longitude: 69.2171245),
  areaLimit: BoundingBox.fromGeoPoints(
    [
      GeoPoint(latitude: 41.3494548, longitude: 69.2171245),
    ],
  ),
);

class _OpenStreetMapPageState extends State<OpenStreetMapPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  List list = [
    41.3494548,
    41.3494934,
    41.270858,
    41.31319414345056,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Open Street Map Page",
        ),
      ),
      body: OSMFlutter(
        markerOption: MarkerOption(),
        onGeoPointClicked: (p0) {
          debugPrint("latlong: $p0");
          for (var i = 0; i < list.length; i++) {
            var lat = p0.latitude;
            var listoflats = list[i] == lat ? lat : 00;
            debugPrint("List lat: $listoflats");
          }
        },
        onLocationChanged: (p0) {
          debugPrint("Location changed $p0");
        },
        onMapIsReady: (p0) {
          debugPrint("Map is Ready $p0");
        },
        staticPoints: [
          StaticPositionGeoPoint(
            "21",
            MarkerIcon(
              iconWidget: IconButton(
                iconSize: 120,
                onPressed: () {
                  debugPrint("Tapped");
                },
                icon: Image.asset(
                  "assets/images/location.png",
                  fit: BoxFit.cover,
                  height: 120,
                  width: 120,
                ),
              ),
              // iconWidget: InkWell(
              //   onTap: () {
              //     debugPrint("tapped");
              //     showModalBottomSheet(
              //       context: context,
              //       builder: (context) {
              //         return Container();
              //       },
              //     );
              //   },
              //   child: Image.asset(
              //     "assets/images/location.png",
              //     fit: BoxFit.cover,
              //     height: 120,
              //     width: 120,
              //   ),
              // ),
            ),
            [
              GeoPoint(latitude: 41.3494548, longitude: 69.2171045),
              GeoPoint(latitude: 41.3494934, longitude: 69.2170573),
              GeoPoint(latitude: 41.270858, longitude: 69.187466),
              GeoPoint(
                  latitude: 41.31319414345056, longitude: 69.19151488615174),
              // GeoPoint(latitude: 41.3491048, longitude: 69.2175245),
            ],
          ),
        ],
        controller: controller,
        trackMyPosition: false,
        initZoom: 12,
        // minZoomLevel: 8,
        // maxZoomLevel: 14,
        // stepZoom: 1.0,
        // userLocationMarker: UserLocationMaker(
        //   personMarker: const MarkerIcon(
        //     icon: Icon(
        //       Icons.location_history_rounded,
        //       color: Colors.red,
        //       size: 48,
        //     ),
        //   ),
        //   directionArrowMarker: const MarkerIcon(
        //     icon: Icon(
        //       Icons.double_arrow,
        //       size: 48,
        //     ),
        //   ),
        // ),
        // roadConfiguration: RoadConfiguration(
        //   startIcon: const MarkerIcon(
        //     icon: Icon(
        //       Icons.person,
        //       size: 64,
        //       color: Colors.brown,
        //     ),
        //   ),
        //   roadColor: Colors.yellowAccent,
        // ),
        // markerOption: MarkerOption(
        //   defaultMarker: const MarkerIcon(
        //     icon: Icon(
        //       Icons.person_pin_circle,
        //       color: Colors.blue,
        //       size: 56,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
