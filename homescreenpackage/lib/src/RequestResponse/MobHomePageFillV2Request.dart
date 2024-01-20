class MobHomePageFillV2Request {
  String? aeId;
  String? userId;
  String? currDt;
  String? currTime;

  MobHomePageFillV2Request(
      {this.aeId, this.userId, this.currDt, this.currTime});

  MobHomePageFillV2Request.fromJson(Map<String, dynamic> json) {
    aeId = json['ae_id'];
    userId = json['user_id'];
    currDt = json['curr_dt'];
    currTime = json['curr_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ae_id'] = this.aeId;
    data['user_id'] = this.userId;
    data['curr_dt'] = this.currDt;
    data['curr_time'] = this.currTime;
    return data;
  }
}