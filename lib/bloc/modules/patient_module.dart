import 'package:sample_app/utils/app_constants.dart';

class PatientModule{

  final int id;
  final String name;
  final String email;
  final String phone;
  final String nin;
  final String age;
  final String sex;
  final String image;


  const PatientModule({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.age,
    required this.nin,
    required this.sex,
    required this.image
  });


  factory PatientModule.fromJson(Map<String, dynamic> json)
    => PatientModule(
      id: json["id"], 
      name: json["name"], 
      email: json["email"], 
      phone: json["phone"], 
      age: json["age"], 
      nin: json["nin"],
      image: json["image"]??AppConstants.userPlaceholderImage, 
      sex: json["sex"]);

  Map<String, dynamic> toJson()
    => {
      "id":id,
      "name": name,
      "email":email,
      "phone": phone,
      "age": age,
      "nin": nin,
      "sex":sex,
      "image":image
    };

}