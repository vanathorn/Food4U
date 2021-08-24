//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui'; //FontFeature

class MyStyle {
  Color primarycolor = Color(0xffBFB372);
  Color secondarycolor = Color(0x0000ff);
  Color darkcolor = Color(0xff030342);
  Color lightcolor = Color(0xffeadd94);
  Color blackcolor = Color(0xff000000);
  Color whitecolor = Color(0xffffffff);
  Color hintcolor = Color(0xffb8bbbc);
  Color logocolor = Color(0xff0a0a77);

  Widget showProgress(){
    return Center(child: CircularProgressIndicator());
  }

  Widget txtbrandsty(String strtxt) => Text(strtxt,
      style: GoogleFonts.lato(
          fontStyle: FontStyle.normal,
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: primarycolor,
          fontFeatures: [
            FontFeature.enable('subs'),
          ]));

  Widget txtbrand(String strtxt) => Text(strtxt,
      style: TextStyle(
        fontFamily: 'Berdiri',
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: logocolor,
      ));

  Widget titleH1(String strtxt) => Text(strtxt,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: primarycolor,
      ));

  Widget titleH2(String strtxt) => Text(
        strtxt,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: primarycolor),
      );

  Widget titleH3(String strtxt) => Text(
        strtxt,
        style: TextStyle(fontSize: 16, color: primarycolor),
      );

  Widget titleDrawer(String strtxt) => Text(strtxt,
      style: GoogleFonts.kanit(
        fontStyle: FontStyle.normal,
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Color(0xff000000),
      ));

  Widget titleCenterTH(BuildContext context, String strtxt, double fsize, Color txtcolor) {
    return Center(
        child: Container(//width: MediaQuery.of(context).size.width*0.5,
          child: Text(strtxt,
              style: TextStyle(
                  fontFamily: 'thaisanslite', 
                  fontSize: fsize,
                  fontWeight: FontWeight.normal,
                  color: txtcolor
              )
          ),
        )
    );
  }
  //MyStyle().txtTH(strtxt, txtcolor)

  Widget subtitleDrawer(String strtxt) => Text(strtxt,
      style: GoogleFonts.kanit(
        fontStyle: FontStyle.normal,
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Colors.black45,
      ));

  Widget titleDark(String strtxt) => Text(strtxt,
      style: GoogleFonts.kanit(
        fontStyle: FontStyle.normal,
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Color(0xff000000),
      ));

  Widget subtitleDark(String strtxt) => Text(strtxt,
      style: GoogleFonts.kanit(
        fontStyle: FontStyle.normal,
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: Colors.black26,
      ));

  Widget titleLight(String strtxt) => Text(strtxt,
      style: GoogleFonts.kanit(
        fontStyle: FontStyle.normal,
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Color(0xffffffff),
      ));

  Widget subtitleLight(String strtxt) => Text(strtxt,
      style: GoogleFonts.kanit(
        fontStyle: FontStyle.normal,
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: Colors.white54,
      ));

  Widget txtstyle(String strtxt, Color txtcolor, double txtsize) => Text(strtxt,
      style: GoogleFonts.kanit(
        fontStyle: FontStyle.normal,
        fontSize: txtsize,
        fontWeight: FontWeight.normal,
        color: txtcolor,
      ));

  Widget signout(String strtxt) => Text(strtxt,
      style: GoogleFonts.kanit(
          fontStyle: FontStyle.normal,
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: Color(0xffffffff),
          fontFeatures: [
            FontFeature.enable('subs'),
          ]));

  Widget subSignout(String strtxt) => Text(strtxt,
      style: TextStyle(
        fontFamily: 'thaisanslite',
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: Colors.white70,
      ));

  Widget txtTH(String strtxt, Color txtcolor) => Text(strtxt,
      style: TextStyle(
        fontFamily: 'thaisanslite',
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: txtcolor,
      ));

  Widget txtTHRed(String strtxt) => Text(strtxt,
      style: TextStyle(
        fontFamily: 'thaisanslite',
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Colors.red.shade800,
      ));

  void get hintStyle => (GoogleFonts.kanit(
        fontStyle: FontStyle.normal,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Color(0xff000000),
      ));

  TextStyle errStyle() => TextStyle(
        fontFamily: 'thaisanslite',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      );

  TextStyle errStyleSymbol() => TextStyle(
        fontFamily: 'Holligate',
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.red.shade700,
      );

  TextStyle myLabelStyle() => TextStyle(
      fontFamily: 'thaisanslite',
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.black54,
    );
    
  BoxDecoration boxDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70,
      );

  BoxDecoration myBoxDrawer(String imgwall) {
    return BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/$imgwall'), fit: BoxFit.cover));
  }

  UserAccountsDrawerHeader builderUserAccountsDrawerHeader(
      name, email, imgwall) {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDrawer(imgwall),
      accountEmail: MyStyle().titleDrawer(email == null ? 'Email' : email),
      accountName: MyStyle().subtitleDrawer(name == null ? 'Name' : name),
      //***** name คือ email  Email คือ  user  *****
      currentAccountPicture: Image.asset('images/logo.png'),
    );
  }

  MyStyle();
}
