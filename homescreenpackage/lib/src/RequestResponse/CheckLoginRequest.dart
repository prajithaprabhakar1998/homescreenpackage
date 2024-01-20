class CheckLoginRequest {
  String? password;
  String? apiBaseUri;
  String? userId;
  String? latitude;
  String? iMEICode;
  String? longitude;
  String? macId;

  CheckLoginRequest(
      {this.password,
        this.apiBaseUri,
        this.userId,
        this.latitude,
        this.iMEICode,
        this.longitude,
        this.macId});

  CheckLoginRequest.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    apiBaseUri = json['apiBaseUri'];
    userId = json['user_id'];
    latitude = json['Latitude'];
    iMEICode = json['IMEI_Code'];
    longitude = json['Longitude'];
    macId = json['mac_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['apiBaseUri'] = this.apiBaseUri;
    data['user_id'] = this.userId;
    data['Latitude'] = this.latitude;
    data['IMEI_Code'] = this.iMEICode;
    data['Longitude'] = this.longitude;
    data['mac_id'] = this.macId;
    return data;
  }
}