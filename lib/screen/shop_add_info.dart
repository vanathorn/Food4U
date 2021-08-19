import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food4u/utility/mystyle.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShopAddInfo extends StatefulWidget {
  @override
  _ShopAddInfoState createState() => _ShopAddInfoState();
}

class _ShopAddInfoState extends State<ShopAddInfo> {
  double screen;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: MyStyle().secondarycolor,
        title: MyStyle().txtTH('เพิ่มข้อมูลร้านค้าของคุณ', Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            inputName(),
            inputAddress(),
            inputMobile(),
            groupImage(),
            buildMap(),
            saveInfo()
          ],
        ),
      ),
    );
  }

  Widget saveInfo() {
    return Container(
      width:MediaQuery.of(context).size.width,
      height: 48,
      margin: EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
      child: ElevatedButton.icon(
        //style: ElevatedButton.styleFrom(
          //padding: EdgeInsets.all(2),
          //primary: Colors.green, // background
          //onPrimary: Colors.white, // foreground          
        //),
        onPressed: () {}, icon: Icon(Icons.save, color: Colors.white,), label: MyStyle().txtTH('บันทึกข้อมูล', Colors.white),
        style: ButtonStyle(
          //backgroundColor: MaterialStateProperty.all(MyStyle().primarycolor),
          padding: MaterialStateProperty.all(EdgeInsets.all(2)),
          //textStyle: MaterialStateProperty.all(TextStyle(fontSize: 24, color: Colors.black)),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return Color(0xffBFB372);
              return Colors.green; // Use the component's default.
            },
          ),  
        ),       
      ),
    );
  }

  Container buildMap() {
    LatLng latLng = LatLng(14.3092524, 100.6445401);
    CameraPosition cameraPosition = CameraPosition(target: latLng, zoom: 11.0);

    return Container(
      margin: EdgeInsets.only(top: 0, left: 15, right: 15),
      height: 300,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
      ),
    );
  }

  Row groupImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.add_a_photo,
              size: 48,
            ),
            onPressed: () {}),
        Container(
          width: screen * 0.5,
          child: Image.asset('images/myshop.png'),
        ),
        Container(
            margin: EdgeInsets.only(right: 15),
            child: IconButton(
                icon: Icon(
                  Icons.add_a_photo_outlined,
                  size: 48,
                ),
                onPressed: () {}))
      ],
    );
  }

  Widget inputName() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            width: screen * 0.85,
            child: TextField(
              decoration: InputDecoration(
                //hintStyle: TextStyle(color: MyStyle().hintcolor),
                //hintText: 'ชื่อร้าน',

                //labelStyle: TextStyle(
                //fontFamily: 'thaisanslite',
                //fontSize: 26,
                //fontWeight: FontWeight.normal,
                //color: Colors.white70,
                //),
                labelStyle: MyStyle().myLabelStyle(), labelText: 'ชื่อร้าน',
                prefixIcon: Icon(Icons.house, color: MyStyle().darkcolor),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().lightcolor),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().darkcolor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          )
        ],
      );

  Widget inputAddress() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            width: screen * 0.85,
            child: TextField(
              decoration: InputDecoration(
                labelStyle: MyStyle().myLabelStyle(),
                labelText: 'ที่อยู่ชื่อร้าน',
                prefixIcon:
                    Icon(Icons.location_city, color: MyStyle().darkcolor),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().lightcolor),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().darkcolor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          )
        ],
      );

  Widget inputMobile() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            width: screen * 0.85,
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelStyle: MyStyle().myLabelStyle(),
                labelText: 'ติดต่อร้าน',
                prefixIcon: Icon(Icons.phone, color: MyStyle().darkcolor),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().lightcolor),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().darkcolor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          )
        ],
      );
}
