// ignore_for_file: prefer_const_constructors, prefer_collection_literals

import 'package:e_commerce_app/controller/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  TextEditingController address = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List item = ['ບ້ານ', 'ສະຖານທີ່ທຳງານ'];
  var dropDownValue = 'ບ້ານ';
  final LocationController locationController = Get.put(LocationController());
  double? lat, lng;
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    findLatLng();
  }

  Future<LocationData?> getCurrentLocation() async {
    Location? location = Location();
    try {
      return await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        // Permission denied
      }
      return null;
    }
  }

  Set<Marker> myMarKer() {
    return <Marker>[
      Marker(
        markerId: MarkerId('MarkerId'),
        position: LatLng(lat!, lng!),
        //icon: _markerIcon!,
        infoWindow:
            InfoWindow(title: 'This is a Title', snippet: 'this is a snippet'),
      ),
    ].toSet();
  }

  Future<void> findLatLng() async {
    Position? position = await findPosition();
    setState(() {
      lat = position!.latitude;
      lng = position.longitude;
    });
    print('lat=======> $lat,lng ========>$lng');
  }

  Future<Position?> findPosition() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition();
      return position;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('ເພີ່ມທີ່ຢູ່ຈັດສົ່ງ'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ສະຖານທີ່ຈັດສົ່ງ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                    controller: address,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    maxLines: 3,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'ທີ່ຢູ່ຫ້າມວ່າງ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'ບ້ານ ເມືອງ ແຂວງ',
                        border: OutlineInputBorder())),
                SizedBox(height: 10),
                Text(
                  'ປະເພດສະຖານທີ່ຈັດສົ່ງ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton(
                        value: dropDownValue,
                        isExpanded: true,
                        underline: SizedBox(),
                        items: item.map((items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropDownValue = value as String;
                          });
                        }),
                  ),
                ),
                SizedBox(height: 10),
                lat == null
                    ? CircularProgressIndicator()
                    : Container(
                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                        ),
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: LatLng(lat!, lng!),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () => locationController.addLocation(
          address: address.text,
          type: dropDownValue.toString(),
          lat: lat!,
          lng: lng!,
        ),
        child: Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.purple),
          child: Center(
            child: Text(
              "ເພີ່ມທີ່ຢູ່ຈັດສົ່ງ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
