class LoginModel {
  String mbid;
  String mbname;
  String psw;
  String mobile;
  String email;
  String mbtid;
  String mbtcode;
  String mbtname;
  String ccode;
  String servername;
  String dbname;
  String userauthen;
  String pswauthen;
  String strconn;

  LoginModel(
      {this.mbid,
      this.mbname,
      this.psw,
      this.mobile,
      this.email,
      this.mbtid,
      this.mbtcode,
      this.mbtname,
      this.ccode,
      this.servername,
      this.dbname,
      this.userauthen,
      this.pswauthen,
      this.strconn}
  );

  LoginModel.fromJson(Map<String, dynamic> json) {
    mbid = json['mbid'];
    mbname = json['mbname'];
    psw = json['Psw'];
    mobile = json['Mobile'];
    email = json['email'];
    mbtid = json['mbtid'];
    mbtcode = json['mbtcode'];
    mbtname = json['mbtname'];
    ccode = json['ccode'];
    servername = json['servername'];
    dbname = json['dbname'];
    userauthen = json['userauthen'];
    pswauthen = json['pswauthen'];
    strconn = json['strconn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mbid'] = this.mbid;
    data['mbname'] = this.mbname;
    data['Psw'] = this.psw;
    data['Mobile'] = this.mobile;
    data['email'] = this.email;
    data['mbtid'] = this.mbtid;
    data['mbtcode'] = this.mbtcode;
    data['mbtname'] = this.mbtname;
    data['ccode'] = this.ccode;
    data['servername'] = this.servername;
    data['dbname'] = this.dbname;
    data['userauthen'] = this.userauthen;
    data['pswauthen'] = this.pswauthen;
    data['strconn'] = this.strconn;
    return data;
  }
}
