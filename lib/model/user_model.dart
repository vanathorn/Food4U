class UserModel {
  String mbid;
  String mbname;
  String psw;
  String mobile;
  String email;
  String mbtid;
  String mbtcode;
  String mbtname;

  UserModel(
      {this.mbid,
      this.mbname,
      this.psw,
      this.mobile,
      this.email,
      this.mbtid,
      this.mbtcode,
      this.mbtname});

  UserModel.fromJson(Map<String, dynamic> json) {
    mbid = json['mbid'];
    mbname = json['mbname'];
    psw = json['Psw'];
    mobile = json['Mobile'];
    email = json['email'];
    mbtid = json['mbtid'];
    mbtcode = json['mbtcode'];
    mbtname = json['mbtname'];
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
    return data;
  }
}
