class MobHomePageFillV2Response {
  String? status;
  String? message;

  MobHomeMast? mobHomeMast;

  MobHomePageFillV2Response({
    this.status,
    this.message,
    this.mobHomeMast,
  });

  MobHomePageFillV2Response.fromJson(Map<dynamic, dynamic> json) {
    status = json['Status'];
    message = json['Message'];

    mobHomeMast = json['MobHomeMast'] != null
        ? new MobHomeMast.fromJson(json['MobHomeMast'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;

    if (this.mobHomeMast != null) {
      data['MobHomeMast'] = this.mobHomeMast!.toJson();
    }

    return data;
  }
}

class MobHomeMast {
  String? currTime;
  String? currDt;
  String? aeId;
  String? userId;
  String? errorMsg;
  NextApp? nextApp;
  MeetSum? meetSum;
  List<Perform>? perform;

  MobHomeMast(
      {this.currTime,
        this.currDt,
        this.aeId,
        this.userId,
        this.errorMsg,
        this.nextApp,
        this.meetSum,
        this.perform});

  MobHomeMast.fromJson(Map<dynamic, dynamic> json) {
    currTime = json['curr_time'];
    currDt = json['curr_dt'];
    aeId = json['ae_id'];
    userId = json['user_id'];
    errorMsg = json['ErrorMsg'];
    nextApp =
    json['NextApp'] != null ? new NextApp.fromJson(json['NextApp']) : null;
    meetSum =
    json['MeetSum'] != null ? new MeetSum.fromJson(json['MeetSum']) : null;
    if (json['Perform'] != null) {
      perform = <Perform>[];
      json['Perform'].forEach((v) {
        perform!.add(new Perform.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['curr_time'] = this.currTime;
    data['curr_dt'] = this.currDt;
    data['ae_id'] = this.aeId;
    data['user_id'] = this.userId;
    data['ErrorMsg'] = this.errorMsg;
    if (this.nextApp != null) {
      data['NextApp'] = this.nextApp!.toJson();
    }
    if (this.meetSum != null) {
      data['MeetSum'] = this.meetSum!.toJson();
    }
    if (this.perform != null) {
      data['Perform'] = this.perform!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NextApp {
  String? schedId;
  String? meetSubject;
  String? customer;
  String? meetTime;

  NextApp({this.schedId, this.meetSubject, this.customer, this.meetTime});

  NextApp.fromJson(Map<dynamic, dynamic> json) {
    schedId = json['sched_id'];
    meetSubject = json['meet_subject'];
    customer = json['customer'];
    meetTime = json['meet_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sched_id'] = this.schedId;
    data['meet_subject'] = this.meetSubject;
    data['customer'] = this.customer;
    data['meet_time'] = this.meetTime;
    return data;
  }
}

class MeetSum {
  String? todayCnt;
  String? weekCnt;
  String? mthCnt;

  MeetSum({this.todayCnt, this.weekCnt, this.mthCnt});

  MeetSum.fromJson(Map<dynamic, dynamic> json) {
    todayCnt = json['today_cnt'];
    weekCnt = json['week_cnt'];
    mthCnt = json['mth_cnt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['today_cnt'] = this.todayCnt;
    data['week_cnt'] = this.weekCnt;
    data['mth_cnt'] = this.mthCnt;
    return data;
  }
}

class Perform {
  String? mthName;
  String? app;
  String? mR;
  String? mthNum;
  String? meetYear;

  Perform({this.mthName, this.app, this.mR, this.mthNum, this.meetYear});

  Perform.fromJson(Map<dynamic, dynamic> json) {
    mthName = json['mth_name'];
    app = json['App'];
    mR = json['MR'];
    mthNum = json['mth_num'];
    meetYear = json['meet_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mth_name'] = this.mthName;
    data['App'] = this.app;
    data['MR'] = this.mR;
    data['mth_num'] = this.mthNum;
    data['meet_year'] = this.meetYear;
    return data;
  }
}
