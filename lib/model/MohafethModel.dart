class Mohafeth_model {
  String mohafethName;
  String mohafethIdCard;
  String birthDate;
  String feild;
  String mobile;
  String familyStatus;
  String password;
  String course;


  Mohafeth_model(
      {
      this.mohafethName,
      this.mohafethIdCard,
      this.birthDate,
      this.feild,
      this.mobile,
      this.familyStatus,
      this.password,
      this.course});

  factory Mohafeth_model.fromMap(Map<String, dynamic> map) {
    return Mohafeth_model(
        mohafethName: map['mohafethName'],
        mohafethIdCard:map['mohafethIdCard'],
        birthDate:map['birthDate'],
        feild:map['feild'],
        mobile:map['mobile'],
        familyStatus:map['familyStatus'],
        password:map['password'],
        course:map['course'],




    );
  }

  Map<String, dynamic> toMap() {
    return {'mohafethName':mohafethName,'mohafethIdCard':mohafethIdCard,'birthDate':birthDate
    ,'feild':feild,'mobile':mobile,'familyStatus':familyStatus,'password':password,'course':course};
  }
}
