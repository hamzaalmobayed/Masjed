class Student_model {
  String studentName;
  String studentCard;
  String birthDate;
  String fatherIdCard;
  String fatherWork;
  String mobile;
  String classRoom;
  String chainName;
  String familyStatus;
  String password;
  String address;
  String course;


  Student_model(
      {
      this.studentName,
      this.studentCard,
      this.birthDate,
      this.fatherIdCard,
      this.fatherWork,
      this.mobile,
      this.classRoom,
      this.chainName,
      this.familyStatus,
      this.password,
      this.address,
      this.course});

  factory Student_model.fromMap(Map<String, dynamic> map) {
    return Student_model(
      studentName: map['studentName'],
      studentCard: map['studentCard'],
      birthDate:map['birthDate'],
      fatherIdCard:map['fatherIdCard'],
      fatherWork:map['fatherWork'],
      mobile:map['mobile'],
      classRoom:map['classRoom'],
      chainName:map['chainName'],
      familyStatus:map['familyStatus'],
      password:map['password'],
      address:map['address'],
      course:map['course'],




    );
  }

  Map<String, dynamic> toMap() {
    return {'studentName':studentName,'studentCard':studentCard,'birthDate':birthDate,'fatherIdCard':fatherIdCard
      ,'fatherWork':fatherWork,'mobile':mobile,'classRoom':classRoom,'chainName':chainName,'familyStatus':familyStatus,'password':password,'address':address,'course':course};
  }
}
