import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/generated/i18n.dart';
import 'package:food_delivery_app/src/elements/ShoppingCartButtonWidget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldKey;

  LocationWidget({Key key, this.parentScaffoldKey}) : super(key: key);
  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
//GoogleMapController myController;
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center =
  const LatLng(23.8357481, 90.364877);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;

  static final CameraPosition initCameraPosition = CameraPosition(
    target: LatLng(23.8357481, 90.364877),
    zoom: 14.4746,
  );

  static final CameraPosition _kCompany = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(23.8357481, 90.364877),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void _pinHere() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Hello here',
          snippet: 'Super!',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCamMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.sort, color: Theme.of(context).hintColor),
          onPressed: () => widget.parentScaffoldKey.currentState.openDrawer(),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).location,
          style: Theme.of(context).textTheme.title.merge(TextStyle(letterSpacing: 1.3)),
        ),
        actions: <Widget>[
          new ShoppingCartButtonWidget(
              iconColor: Theme.of(context).hintColor, labelColor: Theme.of(context).accentColor),
        ],
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            initialCameraPosition: initCameraPosition,
            compassEnabled: true,
            markers: _markers,
            onCameraMove: _onCamMove,
          ),
          SizedBox(
            child: Center(
              child: Icon(
                Icons.add_location,
                size: 40.0,
                color: Theme.of(context).accentColor,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: FloatingActionButton.extended(
              onPressed: _goToTheLake,
              icon: Icon(Icons.people, color: Colors.black,),
              label: Text('To the Company', style: TextStyle(color: Colors.black),),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: FloatingActionButton.extended(
              onPressed: _pinHere,
              icon: Icon(Icons.add_location),
              label: Text('Pin Here'),
              backgroundColor: Theme.of(context).accentColor,
            ),
          )
        ],
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kCompany));
  }
}
