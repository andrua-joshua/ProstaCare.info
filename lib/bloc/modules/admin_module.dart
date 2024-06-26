class AdminModule{

  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;


  const AdminModule({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.image
  });

  factory AdminModule.fromJson(Map<String, dynamic> json)
    => AdminModule(
      id: json['id'], 
      email: json['email'], 
      name: json['name'], 
      image: json['image'],
      phone: json['phone']);


  Map<String, dynamic> toJson()
    => {
      "id":id,
      "name":name,
      "email":email,
      "phone":phone,
      "image": image
    };
}