import 'package:flutter/material.dart';
import 'package:food4u/utility/mystyle.dart';
import 'package:google_fonts/google_fonts.dart';

Future<Null> alertDialog(BuildContext context, String subtitle) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        leading: Image.asset('images/exclaim.png'),
        title: Container(
          margin: EdgeInsets.only(top: 16),
          child: Text('! ข้อผิดพลาด', style: MyStyle().errStyle(),)
        ),
        subtitle: MyStyle().subtitleDark('')
      ),
      children: [        
        SingleChildScrollView(
          child: Column(            
              children: [Center(child: MyStyle().titleDark(subtitle))]
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Ok',
            style: GoogleFonts.kanit(
              fontStyle: FontStyle.normal,
              fontSize: 28,
              fontWeight: FontWeight.normal,
              color: Color(0xff000000),
            ),
          ),
        )
      ]
    )
  );
}
