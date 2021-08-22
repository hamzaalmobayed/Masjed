class Exam_model {
  String chainName;
  String studentName;
  String examName;
  String grade;
  String estimation;
  String examDate;
  String examPerson;


  Exam_model(
      {
      this.chainName,
      this.studentName,
      this.examName,
      this.grade,
      this.estimation,
      this.examDate,
      this.examPerson});

  factory Exam_model.fromMap(Map<String, dynamic> map) {
    return Exam_model(
      chainName:map['chainName'],
      studentName:map['studentName'],
      examName:map['examName'],
      grade:map['grade'],
      estimation:map['estimation'],
      examDate:map['examDate'],
      examPerson:map['examPerson'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'chainName':chainName,'studentName':studentName,'examName':examName
      ,'grade':grade,'estimation':estimation,'examDate':examDate,'examPerson':examPerson};
  }
}
