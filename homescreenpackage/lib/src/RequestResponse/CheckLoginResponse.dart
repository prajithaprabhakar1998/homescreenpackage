class CheckLoginResponse {
  String? eRRSTAT;
  String? eRRMSG;
  String? userId;
  String? userName;
  String? allowTrack;
  String? trackId;
  String? trackIdENC;
  String? jBMMOBTrackReq;
  String? userSpStat;
  String? defaultAeId;
  String? defaultCompId;
  String? defaultCompName;
  String? defaultAeName;
  String? token;
  String? apiBaseUri;
  String? finId;
  bool? eRRRES;

  CheckLoginResponse(
      {this.eRRSTAT,
        this.eRRMSG,
        this.userId,
        this.userName,
        this.allowTrack,
        this.trackId,
        this.trackIdENC,
        this.jBMMOBTrackReq,
        this.userSpStat,
        this.defaultAeId,
        this.defaultCompId,
        this.defaultCompName,
        this.defaultAeName,
        this.token,
        this.apiBaseUri,
        this.finId,
        this.eRRRES});

  CheckLoginResponse.fromJson(Map<dynamic, dynamic> json) {
    eRRSTAT = json['ERR_STAT'];
    eRRMSG = json['ERR_MSG'];
    userId = json['user_id'];
    userName = json['user_name'];
    allowTrack = json['allow_Track'];
    trackId = json['track_id'];
    trackIdENC = json['track_id_ENC'];
    jBMMOBTrackReq = json['JBM_MOB_Track_Req'];
    userSpStat = json['user_sp_stat'];
    defaultAeId = json['default_ae_id'];
    defaultCompId = json['default_comp_id'];
    defaultCompName = json['default_comp_name'];
    defaultAeName = json['default_ae_name'];
    token = json['Token'];
    apiBaseUri = json['apiBaseUri'];
    finId = json['fin_id'];
    eRRRES = json['ERR_RES'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['ERR_STAT'] = this.eRRSTAT;
    data['ERR_MSG'] = this.eRRMSG;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['allow_Track'] = this.allowTrack;
    data['track_id'] = this.trackId;
    data['track_id_ENC'] = this.trackIdENC;
    data['JBM_MOB_Track_Req'] = this.jBMMOBTrackReq;
    data['user_sp_stat'] = this.userSpStat;
    data['default_ae_id'] = this.defaultAeId;
    data['default_comp_id'] = this.defaultCompId;
    data['default_comp_name'] = this.defaultCompName;
    data['default_ae_name'] = this.defaultAeName;
    data['Token'] = this.token;
    data['apiBaseUri'] = this.apiBaseUri;
    data['fin_id'] = this.finId;
    data['ERR_RES'] = this.eRRRES;
    return data;
  }
}