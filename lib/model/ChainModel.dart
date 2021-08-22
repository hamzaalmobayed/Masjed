class Chain_model {
  String chainName;
  String chainMohafeth;
  String chainhelper;
  String age;
  String number;


  Chain_model(
      {
      this.chainName,
      this.chainMohafeth,
      this.chainhelper,
      this.age,
      this.number});

  factory Chain_model.fromMap(Map<String, dynamic> map) {
    return Chain_model(
      chainName:map['chainName'],
      chainMohafeth:map['chainMohafeth'],
      chainhelper:map['chainhelper'],
      age:map['age'],
      number:map['number'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'chainName':chainName,'chainMohafeth':chainMohafeth,'chainhelper':chainhelper
      ,'age':age,'number':number};
  }
}
