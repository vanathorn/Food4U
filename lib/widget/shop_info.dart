import 'package:flutter/material.dart';
import 'package:food4u/screen/shop_add_info.dart';
import 'package:food4u/utility/mystyle.dart';

class ShopInfo extends StatefulWidget {
  @override
  _ShopInfoState createState() => _ShopInfoState();
}

class _ShopInfoState extends State<ShopInfo> {
  void routeToShopInfo(){
    MaterialPageRoute mpageRoute = MaterialPageRoute(builder: (context) => ShopAddInfo(),
    );
    Navigator.push(context, mpageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MyStyle()
            .titleCenterTH(context, 'กรุณาใส่ข้อมูลของร้านของคุณ', 24, Colors.black),
        addEditInfo()
      ],
    );
  }

  Row addEditInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(margin: EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: FloatingActionButton(
                child: Icon(Icons.edit), 
                onPressed: () {
                  routeToShopInfo();
                }          
              ),
            ),
          ],
        ),
      ],
    );
  }

}
