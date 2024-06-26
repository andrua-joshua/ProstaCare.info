import 'package:sample_app/utils/app_constants.dart';

class DoctorModule{

  final int id;
  final String name;
  final String email;
  final String phone;
  final String sex;
  final String location;
  final String age;
  final String nin;
  final String image;



  const DoctorModule({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.location,
    required this.nin,
    required this.phone,
    required this.sex,
    required this.image
  });


  factory DoctorModule.fromJson(Map<String, dynamic> json)
    => DoctorModule(
      id: json["id"], 
      name: json["name"], 
      email: json["email"], 
      age: json["age"], 
      location: json["location"], 
      nin: json["nin"], 
      phone: json["phone"], 
      image: json["image"]??AppConstants.userPlaceholderImage,
      sex: json["sex"]);

  Map<String, dynamic> toJson()
    => {
      "id": id,
      "name":name,
      "email": email,
      "age": age,
      "location":location,
      "nin": nin,
      "phone": phone,
      "sex": sex,
      "image": image
    };

}