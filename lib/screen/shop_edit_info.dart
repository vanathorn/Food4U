import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food4u/model/shop_model.dart';
import 'package:food4u/utility/my_constant.dart';
import 'package:food4u/utility/mystyle.dart';
import 'package:food4u/utility/myutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopEditInfo extends StatefulWidget {
  @override
  _ShopEditInfoState createState() => _ShopEditInfoState();
}

class _ShopEditInfoState extends State<ShopEditInfo> {
  String strConn;
  String loginName, loginMobile;
  double lat, lng, screen;
  ShopModel shopModel;
  String txtName, txtAddress, txtPhone;
  String _txtName, _txtAddress, _txtPhone, _shopImage;

  @override
  void initState() {
    super.initState();
    findUser();
  }

  Future<Null> findUser() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    setState(() {
      loginName = prefer.getString('pname');
      loginMobile = prefer.getString('pmobile');
      findStrConn();
    });
  }

  Future<Null> findStrConn() async {
    String _strConn = await MyUtil().findStrConn(context);
    strConn = _strConn;
    if (strConn != null) {
      readExistDataShop();
    }
  }

  Future<Null> readExistDataShop() async {
    String url = '${MyConstant().domain}/F4uApi/checkShop.aspx?strConn=' + strConn;
    await Dio().get(url).then((value) {
      var result = json.decode(value.data);
      for (var map in result) {
        setState(() {          
          shopModel = ShopModel.fromJson(map);
          _txtName = shopModel.thainame;
          _txtAddress = shopModel.address;
          _txtPhone = shopModel.phone;
          _shopImage = shopModel.shoppict;
          lat = double.parse(shopModel.lat);
          lng = double.parse(shopModel.lng);          
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: MyStyle().txtTH('แก้ไขข้อมูลร้าน ${shopModel.thainame}', Colors.white),
      ),
      body: shopModel== null 
        ? MyStyle().showProgress()
        : SingleChildScrollView(
        child: Column(
          children: [
            inputName(),
            //iputAddress(),
            //inputMobile(),
            //groupImage(),
            //(lat == null) ? MyStyle().showProgress() : buildMap(),
            //saveInfo()
          ],
        ),
      ),
    );
  }

  Widget inputName() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(top: 10),
        width: screen * 0.85,
        child: TextFormField(
          initialValue: _txtName,
          onChanged: (value) => txtName = value.trim(),
          decoration: InputDecoration(
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
  
}
