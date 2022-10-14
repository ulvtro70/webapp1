import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Page1 extends StatefulWidget {
  Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  late final MapController _mapController;
  late final StreamSubscription<MapEvent> mapEventSubscription;

  LatLng? latLngCenter, latLngMouse;
  final pointSize = 40.0;
  final pointY = 200.0;

  // void updatePoint(MapEvent? event, BuildContext context) {
  //   final pointX = _getPointX(context);
  //   setState(() {
  //     latLng = _mapController.pointToLatLng(CustomPoint(pointX, pointY));
  //   });
  // }

  double _getPointX(BuildContext context) {
    return MediaQuery.of(context).size.width / 2;
  }

  void onMapEvent(MapEvent mapEvent) {
    if (mapEvent is MapEventMove) {
      setState(() {
        latLngCenter = mapEvent.center;
      });
    }

    if (mapEvent is MapEventTap) {
      setState(() {
        latLngMouse = mapEvent.tapPosition;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _mapController = MapController();
    mapEventSubscription = _mapController.mapEventStream.listen(onMapEvent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ElevatedButton(
                  onPressed: (() {
                    _mapController.move(LatLng(69.0, 18.0), 9);
                  }),
                  child: const Text('Flytt')),
              ElevatedButton(
                  onPressed: (() {
                    _mapController.move(LatLng(61.97, 9.26), 9);
                  }),
                  child: const Text('Flytt2')),
              Text(
                  'Center => Latitude:${latLngCenter?.latitude.toStringAsFixed(2)}, Longitude:${latLngCenter?.longitude.toStringAsFixed(2)}'),
              Text(
                  'Mouse => Latitude:${latLngMouse?.latitude.toStringAsFixed(2)}, Longitude:${latLngMouse?.longitude.toStringAsFixed(2)}'),
            ],
          ),
          Expanded(
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                center: LatLng(61.97, 9.26),
                zoom: 9,
              ),
              children: [
                TileLayer(
                  wmsOptions: WMSTileLayerOptions(
                    baseUrl: 'https://{s}.s2maps-tiles.eu/wms/?',
                    layers: ['s2cloudless-2018_3857'],
                  ),
                  subdomains: const ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'],
                  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  opacity: 1,
                ),
                TileLayer(
                  wmsOptions: WMSTileLayerOptions(
                    baseUrl:
                        'https://opencache.statkart.no/gatekeeper/gk/gk.open?',
                    layers: ['norgeskart_bakgrunn'],
                  ),
                  opacity: 0.5,
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                        point: LatLng(61.97, 9.26),
                        builder: (context) => Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: 12),
                                  shape: BoxShape.circle,
                                  color: Colors.redAccent),
                            ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
