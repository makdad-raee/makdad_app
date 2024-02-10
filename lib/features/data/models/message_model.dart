class MessageModel {
  String? name;
  String? senderID;
  String? reciverId;
  String? dateTime;

  String? textMessge;

  MessageModel(
      {this.name,
      this.senderID,
      this.reciverId,
      this.dateTime,
      this.textMessge});
  MessageModel.fromJson(Map<String, dynamic> json) {
    senderID = json['senderID'];
    name = json['name'];
    reciverId = json['reciverId'];
    dateTime = json['dateTime'];
    textMessge = json['textMessge'];
  }
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "senderID": senderID,
      'dateTime': dateTime,
      'reciverId': reciverId,
      "textMessge": textMessge,
    };
  }
}
