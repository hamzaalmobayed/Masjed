class Hefth_Model {
  String studentNameHefth;
  String beginAya;
  String beginSora;
  String endAya;
  String endSora;
  String pageNumber;
  String revisionPage;
  String estimate;

  Hefth_Model(
      {
        this.studentNameHefth,
        this.beginAya,
        this.beginSora,
        this.endAya,
        this.endSora,
        this.pageNumber,
        this.revisionPage,
        this.estimate,
        });

  factory Hefth_Model.fromMap(Map<String, dynamic> map) {
    return Hefth_Model(
      studentNameHefth: map['studentName'],
      beginAya:map['beginAya'],
      beginSora:map['beginSora'],
      endAya:map['endAya'],
      endSora:map['endSora'],
      pageNumber:map['pageNumber'],
      revisionPage:map['revisionPge'],
      estimate:map['estimate'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'studentNameHefth':studentNameHefth,'beginAya':beginAya,'beginSora':beginSora
      ,'endAya':endAya,'endSora':endSora,'pageNumber':pageNumber,'revisionPage':revisionPage,'estimate':estimate};
  }
}
