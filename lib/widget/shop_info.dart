import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food4u/model/shop_model.dart';
import 'package:food4u/screen/shop_add_info.dart';
import 'package:food4u/screen/shop_edit_info.dart';
import 'package:food4u/utility/my_constant.dart';
import 'package:food4u/utility/mystyle.dart';
import 'package:food4u/utility/myutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';
//import 'package:url_launcher/url_launcher.dart';

class ShopInfo extends StatefulWidget {
  @override
  _ShopInfoState createState() => _ShopInfoState();
}

class _ShopInfoState extends State<ShopInfo> {
  ShopModel shopModel;
  String strConn;
  String loginName;
  double screen, lat, lng;
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    findStrConn();
  }

  Future<Null> findStrConn() async {
    String _strConn = await MyUtil().findStrConn(context);
    strConn = _strConn;
    if (strConn != null) {
      readDataShop();
    }
  }
    
  Future<Null> readDataShop() async {
    String url = '${MyConstant().domain}/F4uApi/checkShop.aspx?strConn=' + strConn;
    await Dio().get(url).then((value) {
      var result = json.decode(value.data);
      for (var map in result) {
        setState(() {
          shopModel = ShopModel.fromJson(map);
          lat = double.parse(shopModel.lat);
          lng = double.parse(shopModel.lng);
        });
      }
    });
  }

  void routeToShopInfo() {
    Widget widget = shopModel.thainame.isEmpty ? ShopAddInfo():ShopEditInfo();
    MaterialPageRoute mpageRoute = MaterialPageRoute(
      builder: (context) => widget,
    );
    Navigator.push(context, mpageRoute);
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Stack(
      children:<Widget>[
        shopModel == null
            ? MyStyle().showProgress()
            : (shopModel.thainame.isEmpty
                ? showNoData(context)
                : showShopData(context)),
        addEditInfo()
      ],
    );
  }

  Widget showNoData(BuildContext context) {
    return MyStyle().titleCenterTH(context, 'กรุณาใส่ข้อมูลร้านค้าของคุณ', 20, Colors.black);
  }

  Widget showShopData(BuildContext context) => Column(
    children: [
      //MyStyle().titleCenterTH(context, 'รายละเอียดร้าน ${shopModel.thainame}', 18, Colors.black),
      MyStyle().txtbrand('${shopModel.thainame}'),
      showImage(),
      Container (
        margin: EdgeInsets.only(left: screen*0.05),
        child: 
        Column(
          children: [
            Row(children:<Widget>[MyStyle().titleCenterTH(context, 'ที่อยู่ร้าน ${shopModel.thainame}', 18, Colors.blue)]),
            Row(children:<Widget>[Text(shopModel.address)]),                    //
            Row(children:<Widget>[Text(shopModel.phone)]),
          ],
        ),
      ),     
      showMap()      
    ],
  );

  Container showImage() {
    return Container(
      width: screen*0.9,
      child: Image.network(
        '${MyConstant().domain}/${MyConstant().imagepath}/${shopModel.shoppict}'
      ),
    );
  }

  Set<Marker> shopMarker() {
    //double lat = double.parse(shopModel.lat);
    //double lng = double.parse(shopModel.lng);
    return <Marker>[
      Marker(
        markerId: MarkerId('shopmarker'),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(
          title: 'ร้านของ ${shopModel.thainame}',
          snippet: 'ละติจูต=$lat, ลองติจูต=$lng'),
        //onTap: () => _openOnGoogleMapApp(lat, lng),
      )
    ].toSet();
  }

  //_openOnGoogleMapApp(double latitude, double longitude) async {
    //String googleUrl =
        //'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    //if (await canLaunch(googleUrl)) {
      //await launch(googleUrl);
    //} else {
      // Could not open the map.
    //}
  //}

  Widget showMap() {
    CameraPosition cameraPosition = CameraPosition(target: LatLng(lat, lng), zoom: 11.0);
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 5),//, left: 15, right: 15
        width: screen*0.9,
        child: GoogleMap(        
          initialCameraPosition: cameraPosition,
          mapType: MapType.normal,
          markers: shopMarker(),
          //onMapCreated: (controller){ },
          onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          }
        ),
      ), 
    );
  }

  Row addEditInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.end,//.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right:90.0, bottom: 15.0),
              child: FloatingActionButton(
                  child: Icon(Icons.edit),
                  onPressed: () {
                    //getLocation();
                    routeToShopInfo();
                  }),
            ),
          ],
        ),
      ],
    );
  }

  // Future<Null> getLocation() async {
    // var location = Location();
    // var currentLocation = await location.getLocation();
    // print('lat=$currentLocation.latitude, lng=$currentLocation.longitude');
  // }
}
