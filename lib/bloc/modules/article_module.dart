import 'package:sample_app/utils/app_constants.dart';

class ArticleModule{

  final int id;
  final String doctorId;
  final String content;
  final String image;
  final String link;

  const ArticleModule({
    required this.id,
    required this.content,
    required this.doctorId,
    required this.image,
    required this.link
  });


  factory ArticleModule.fromJson(Map<String, dynamic> json)
    => ArticleModule(
      id: json["id"], 
      content: json["content"], 
      doctorId: json["doctor_id"],
      image: json["image"]?? AppConstants.articlePlaceHolder,
      link: json['link']??""
      );

  Map<String, dynamic> toJson()
    => {
      "id": id,
      "content":content,
      "doctor_id": doctorId,
      "image": image,
      "link": link
    };

}