import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const _initialCameraPosition = CameraPosition(
      target: LatLng(25.7617, -80.1918),
      zoom: 11.5,
  );

  GoogleMapController _googleMapController;
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 5,
        title: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.title,
            children: [
              TextSpan(
                text: "Market",
                style: TextStyle(
                    color: Colors.green,
                    fontFamily: "comfortaa",
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
              TextSpan(
                text: "Town",
                style: TextStyle(color: Colors.grey, fontFamily: "comfortaa", fontSize: 20),
              ),
              TextSpan(
                text: "Map",
                style: TextStyle(color: Colors.grey, fontFamily: "comfortaa", fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        onMapCreated: (controller) => _googleMapController = controller,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
