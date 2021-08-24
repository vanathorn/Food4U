import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food4u/utility/my_constant.dart';
import 'package:food4u/utility/mystyle.dart';
import 'package:food4u/utility/myutil.dart';
import 'package:food4u/utility/dialig.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  double screen;
  bool redeye = true;
  String user, mobile, password, choosetype;
  //final client = Dio();

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().primarycolor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyStyle().titleLight('หน้าหลัก'),
            Container(
              child: MyStyle().txtstyle('ลงทะเบียนใหม่', Color(0xff0a0a77), 18),
              padding: EdgeInsetsDirectional.only(top: 0),
            )
            //Container(child: new Center(child: MyStyle().tpadding: EdgeInsets.fromLTRB(1.0, 2.0, 3.0, 4.0)
            //ex. padding: EdgeInsetsDirectional.only(start: 100, top: 0)
            //ex. padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            //ex. padding: EdgeInsets.fromLTRB(left, 2.0, 3.0, 4.0);
            //ex. margin: EdgeInsets.symmetric(horizontal: 70.0)
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
              center: Alignment(0, -0.33),
              radius: 1.0,
              colors: <Color>[Colors.white, MyStyle().lightcolor]),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildLogo(),
                MyStyle().txtbrand('Food4U'),
                buildUser(),
                buildPassword(),
                buildMobile(),
                buildMemberType(),
                userRadio(),
                //shopRadio(),
                riderRadio(),
                buildRegister(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildLogo() {
    return Container(width: screen * 0.25, child: MyUtil().showLogo());
  }

  Text buildMemberType(){
    return MyStyle().txtstyle('ประเภทสมาขิก', MyStyle().primarycolor, 20);
  }
  //User Radio
  Widget userRadio() => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget> [
      Container(
        width: screen * 0.75,
        margin: EdgeInsets.only(top: 0),
        child: Row (
          children: <Widget> [
            Transform.scale(
              scale: 1.8,
              child :
                Radio(value: 'U', groupValue: choosetype, 
                  onChanged: (value) {setState(() {choosetype = value;});},              
              ),
            ),
            MyStyle().titleDark('ผู้สั่งอาหาร'),
          ],
        ),
      )
    ],
  );   
    
  //Shop Radio
  Widget shopRadio() => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget> [
      Container(
        width: screen * 0.75,
        margin: EdgeInsets.only(top: 5),
        child: Row (
          children: <Widget> [ 
            Transform.scale(
              scale: 1.8,
              child : Radio(value: 'S', groupValue: choosetype, 
                      onChanged: (value) {setState(() {choosetype = value;});},),
            ),
            MyStyle().titleDark('เจ้าของร้านอาหาร'),
          ],
        ),
      )
    ],
  );   

  //Rider Radio
  Widget riderRadio() => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget> [
      Container(
        width: screen * 0.75,
        margin: EdgeInsets.only(top: 5),
        child: Row (
          children: <Widget> [ 
            Transform.scale(
              scale: 1.8,
              child : Radio(value: 'R', groupValue: choosetype, 
                        onChanged: (value) {setState(() {choosetype = value;});},),
            ),
            MyStyle().titleDark('ผู้ส่งอาหาร'),
          ],
        ),
      )
    ],
  );   
      
  Container buildUser() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70,
      ),
      margin: EdgeInsets.only(top: 5),
      width: screen * 0.75, height : 64,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => user = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().hintcolor, fontSize: 15),
          hintText: 'ชื่อ',
          prefixIcon: Icon(Icons.person, color: MyStyle().darkcolor),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().lightcolor),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().darkcolor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        cursorColor: Color(0xffffffff),
        style: GoogleFonts.kanit(
            fontStyle: FontStyle.normal,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Color(0xff000000)),
      ),
    );
  }

  Container buildMobile() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white70,
    ),
    margin: EdgeInsets.only(top: 8),
    width: screen * 0.75, height : 64,
    child: TextField(
      keyboardType: TextInputType.number,
      onChanged: (value) => mobile = value.trim(),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: MyStyle().hintcolor, fontSize: 15),
        hintText: 'มือถือ',
        prefixIcon: Icon(Icons.mobile_friendly, color: MyStyle().darkcolor),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().lightcolor),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyStyle().darkcolor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      cursorColor: Color(0xffffffff),
      style: GoogleFonts.kanit(
          fontStyle: FontStyle.normal,
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Color(0xff000000)),
    ),
  );
}

  Container buildPassword() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70,
      ),
      margin: EdgeInsets.only(top: 8),
      width: screen * 0.75, height : 64,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        obscureText: redeye,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().hintcolor, fontSize: 15),
          hintText: 'รหัส',
          prefixIcon: Icon(Icons.lock, color: MyStyle().darkcolor),
          suffixIcon: IconButton(
            icon: redeye
                ? Icon(Icons.remove_red_eye)
                : Icon(Icons.remove_red_eye_outlined),
            onPressed: () {
              setState(() {
                redeye = !redeye;
              });
            },
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().lightcolor),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().darkcolor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        cursorColor: Color(0xffffffff),
        style: GoogleFonts.kanit(
            fontStyle: FontStyle.normal,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Color(0xff000000)),
      ),
    );
  }

  Container buildRegister() {
    return Container(
        margin: EdgeInsets.only(top: 10),
        width: screen * 0.75,
        height: 48,
        child: ElevatedButton(
          onPressed: () {
            if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true) || (mobile?.isEmpty ?? true)) {
              alertDialog(context, 'ระบุข้อมูลทุกช่อง');
            } else {
              if ((choosetype?.isEmpty ?? true)){
                  alertDialog(context, 'เลือกประเภทสมาชิก');
              }else{                         
                if (mobile.length !=10){
                  alertDialog(context, '!เบอร์ไม่ถูกต้อง ('+mobile+')');
                }else{
                  checkUser();
                }
              }
            }
          },
          child: MyStyle().titleLight('ลงทะเบียน'),
          style: ElevatedButton.styleFrom(
              primary: MyStyle().darkcolor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ));
  } 
  
  Future<Null> checkUser() async {
    String url = '${MyConstant().domain}F4uApi/JsonCheckMobile.aspx?Mobile='+mobile;
    try{
      Response response = await Dio().get(url);
      //print('*****response =  $response');
      //alertDialog(context, response.toString().trim());
      if (response.toString().trim()=='[]'){
        registerTread();
      }else{
        alertDialog(context, mobile +' ถูกลงทะเบียนแล้ว');
      }
    }catch(e){
      alertDialog(context, '!ไม่สามารถติดต่อ Server ได้'); 
    }
  }

  Future<Null> registerTread() async {
    String url='${MyConstant().domain}/F4uApi/insertUser.aspx?Name='+user+'&Psw='+password+'&Mobile='+mobile+'&cType='+choosetype;
    try{      
      Response response = await Dio().get(url);
      print('*****response =  $response');
      if (response.toString() == ''){
        Navigator.pop(context);
      }else{
        alertDialog(context, response.toString());
      }
    }catch(e){
      alertDialog(context, '!ไม่สามารถติดต่อ Serverได้'); //'!ไม่สามารถติดต่อ Serverได้'
    }
  }


}
