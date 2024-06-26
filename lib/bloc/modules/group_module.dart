import 'package:sample_app/utils/app_constants.dart';

class GroupModule{

  final int id;
  final int doctorId;
  final String title;
  final String description;
  final String link;
  final String coverImg;

  const GroupModule({
    required this.id,
    required this.title,
    required this.description,
    required this.coverImg,
    required this.doctorId,
    required this.link
  });

  
  factory GroupModule.fromJson(Map<String, dynamic> json)
    => GroupModule(
      id: json['id'], 
      title: json['title']??"", 
      coverImg: json['image']??AppConstants.groupPlaceHolder, 
      doctorId: int.parse(json['doctor_id']??0), 
      description: json["description"]??"",
      link: json['link']??"");

  Map<String, dynamic> toJson()
    => {
      "id": id,
      "title": title,
      'description': description,
      "image": coverImg,
      "doctor_id": doctorId,
      "link": link
    };

}