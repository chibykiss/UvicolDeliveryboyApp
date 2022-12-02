import 'dart:convert';

import 'package:active_flutter_delivery_app/data_model/multi_order_map_data.dart';
import 'package:active_flutter_delivery_app/data_model/order_mini_response.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MultiOrderMap extends StatefulWidget {
  final List<Order> orders;

  const MultiOrderMap({Key key, this.orders}) : super(key: key);

  @override
  _MultiOrderMapState createState() => _MultiOrderMapState();
}

class _MultiOrderMapState extends State<MultiOrderMap> {
  BitmapDescriptor markerIcon;
  GoogleMapController _controller;
  bool location_initialized = false;

  setCustomMarker() async {
    markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/store_map_icon.png');
    setState(() {});
  }


  Iterable  _createMarker() {
    //print('lllllllllllllllllllllll ${widget.orders.length}');
    Iterable _markers = Iterable.generate(widget.orders.length, (index) {
      //print('lllllllllllllllllllllll ${widget.orders[index].lat}, ${widget.orders[index].lang}');
      return Marker(
          markerId: MarkerId(widget.orders[index].id.toString()),
          position: LatLng(
            widget.orders[index].lat,
            widget.orders[index].lang,
          ),
          infoWindow: InfoWindow(title: widget.orders[index].code),
        icon: markerIcon
      );
    });
    print("Marker length = ${_markers.length}");
      return _markers;

  }

int  getLength(){
    return widget.orders.length;
  }
  Iterable markers = [];

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    _controller.setMapStyle(value);

  }

  onPressCenterMap() async {
    _controller.moveCamera(CameraUpdate.newLatLng(LatLng(widget.orders.first.lat,widget.orders.first.lang)));
    setState(() {});
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      markers = _createMarker();
      location_initialized = true;
    });
    setCustomMarker();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          buildMapSection(),
        ],
      ),
    );
  }


  buildMapSection() {
    return Container(
      height: (MediaQuery.of(context).size.height - 184) + 10,
      child: location_initialized
          ? GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(widget.orders.first.lat,widget.orders.first.lang), zoom: 11.0, tilt: 0.0, bearing: 0),
        myLocationEnabled: true,
        trafficEnabled: true,
        markers:Set.from(markers),
        onMapCreated: _onMapCreated,
      )
          : Container(
          height: (MediaQuery.of(context).size.height - 184) + 10,
          child: Center(
            child: Text(
              "Loading Map . . .",
              style: TextStyle(color: Colors.red),
            ),
          )),
    );
  }
}
