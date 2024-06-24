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
      title: json['title'], 
      coverImg: json['cover_image_url'], 
      doctorId: json['doctor_id'], 
      description: json["description"],
      link: json['link']);

  Map<String, dynamic> toJson()
    => {
      "id": id,
      "title": title,
      'description': description,
      "cover_image_url": coverImg,
      "doctor_id": doctorId,
      "link": link
    };

}