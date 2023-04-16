import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String locationMessage = "User Current Location is";
  late String lati;
  late String longi;

  Future<Position> _getlocation() async {
    bool _serviceEnabled;
    LocationPermission permission;
    //check the location service is enabled or not
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      return Future.error('Locator service are not enabled');
    }

    //check the permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permission are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Permission denied permanently, we can\'t request');
    }

    return Geolocator.getCurrentPosition();
  }

  //listen to location updates
  void _liveLocation() {
    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lati = position.latitude.toString();
      longi = position.longitude.toString();
      setState(() {
        locationMessage = 'Latitude: $lati , Longitude: $longi';
      });
    });
  }

  Future<void> _openMap(String lati, String longi) async{
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$lati,$longi';
    await canLaunchUrlString(googleUrl)
        ? await launchUrlString(googleUrl)
        : throw 'Could not launch $googleUrl';
  }

  int _index=0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavigationBar(destinations: [
          NavigationDestination(icon: Icon(Icons.home_filled), label: "Home"),
          NavigationDestination(icon: Icon(Icons.home_filled), label: "Home"),
          NavigationDestination(icon: Icon(Icons.home_filled), label: "Home"),
          NavigationDestination(icon: Icon(Icons.home_filled), label: "Home"),
        ],
          selectedIndex: _index,
          onDestinationSelected: (int value){
          setState(() {
            _index=value;
          });
          },
        ),
        body: Container(
          height: double.infinity,
          width: 100.w,
          child: Column(
            children: [
              Text(
                locationMessage,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              ElevatedButton(
                  onPressed: () {
                    _getlocation().then((value) {
                      lati = '${value.latitude}';
                      longi = '${value.longitude}';
                      setState(() {
                        locationMessage = 'Latitude: $lati , Longitude: $longi';
                      });
                      _liveLocation();
                    });
                  },
                  child: Text(
                    "Location",
                    style: TextStyle(fontSize: 17.sp, color: Colors.white),
                  )),
              ElevatedButton(
                  onPressed: () {
                    _openMap(lati,longi);
                  },
                  child: Text(
                    "Open Google Map",
                    style: TextStyle(fontSize: 17.sp, color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
