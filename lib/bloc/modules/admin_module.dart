class AdminModule{

  final int id;
  final String name;
  final String email;
  final String phone;


  const AdminModule({
    required this.id,
    required this.email,
    required this.name,
    required this.phone
  });

  factory AdminModule.fromJson(Map<String, dynamic> json)
    => AdminModule(
      id: json['id'], 
      email: json['email'], 
      name: json['name'], 
      phone: json['phone']);


  Map<String, dynamic> toJson()
    => {
      "id":id,
      "name":name,
      "email":email,
      "phone":phone
    };
}