class ArticleModule{

  final int id;
  final int doctorId;
  final String content;

  const ArticleModule({
    required this.id,
    required this.content,
    required this.doctorId
  });


  factory ArticleModule.fromJson(Map<String, dynamic> json)
    => ArticleModule(
      id: json["id"], 
      content: json["content"], 
      doctorId: json["doctor_id"]);

  Map<String, dynamic> toJson()
    => {
      "id": id,
      "content":content,
      "doctor_id": doctorId
    };

}