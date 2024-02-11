class CommentModel {
  String? name;
  String? reciveCommentId;
  String? image;
  String? dateTime;
  String? commentText;


  CommentModel({
    this.name,
    this.reciveCommentId,
    this.image,
    this.dateTime,
    this.commentText
   
    
  });
  CommentModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    reciveCommentId = json['uId'];
    image = json['image'];
    dateTime = json['dateTime'];
    commentText = json['commentText'];
   
  }
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "reciveCommentId": reciveCommentId,
      'image': image,
      'dateTime': dateTime,
      'commentText': commentText,
     
    };
  }
}
