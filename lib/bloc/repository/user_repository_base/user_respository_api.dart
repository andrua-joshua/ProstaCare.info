import 'dart:convert';

import 'package:sample_app/bloc/modules/admin_module.dart';
import 'package:sample_app/bloc/modules/doctor_module.dart';
import 'package:sample_app/bloc/modules/patient_module.dart';
import 'package:sample_app/bloc/repository/user_repository_base/user_repository_base.dart';
import 'package:sample_app/providers/user_provider.dart';
import 'package:sample_app/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class UserRespositoryApi implements UserRepositoryBase{
  @override
  Future<AdminModule?> createAdmin({required String password, required AdminModule adminModule}) async{
    final uri = Uri.parse(AppConstants.createAdmin);
    final Map<String, dynamic> payload = {
      "name": adminModule.name,
      "email":adminModule.email,
      "phone": adminModule.phone,
      "password": password
    };

    try{

      final res = await http.post(
        uri,
        body: payload
        );

      if(res.statusCode == 200 || res.statusCode == 201 ){
        print("Create admin successful..........");
        final admin= jsonDecode(res.body)['admin'] as Map<String, dynamic>;
        return AdminModule.fromJson(admin);
      }else if(res.statusCode == 422){
        print("Admin with account already exists....   ${res.body}");
        return null;
      }else{
        print("Failed to create account(admin):--> ${res.statusCode} ${res.body}");
        return null;
      }

    }catch(err){
      print("Error creating admin:..   $err");
      return null;
    }
  }

  @override
  Future<DoctorModule?> createDoctor({required String password, required DoctorModule doctorModule}) async{
    final uri = Uri.parse(AppConstants.createDoctor);
    final Map<String, dynamic> payload = {
      "name": doctorModule.name,
      "email":doctorModule.email,
      "sex": doctorModule.sex,
      "location": doctorModule.location,
      "category": "",
      "nin": doctorModule.nin,
      "age": doctorModule.age,
      "phone": doctorModule.phone,
      "password": password
    };

    try{

      final res = await http.post(
        uri,
        body: payload
        );

      if(res.statusCode == 200 || res.statusCode == 201 ){
        print("Create doctor successful.......... >>${jsonDecode(res.body)}");
        final doctor= jsonDecode(res.body)["doctor"] as Map<String, dynamic>;
        return DoctorModule.fromJson(doctor);
      }else if(res.statusCode == 422){
        print("User already exists.....  ${res.statusCode}");
        return null;
      }else{
        print("Failed to create account(doctor):--> ${res.statusCode} ${res.body}");
        return null;
      }

    }catch(err){
      print("Error creating doctor:..   $err :: ");
      return null;
    }
    
  }

  @override
  Future<PatientModule?> createPatient({required String password, required PatientModule pateintModule}) async{
    final uri = Uri.parse(AppConstants.createPatient);
    final Map<String, dynamic> payload = {
      "name": pateintModule.name,
      "email":pateintModule.email,
      "sex": pateintModule.sex,
      "nin": pateintModule.nin,
      "age": pateintModule.age,
      "phone": pateintModule.phone,
      "password": password
    };

    try{

      final res = await http.post(
        uri,
        body: payload
        );

      if(res.statusCode == 200 || res.statusCode == 201 ){
        print("Create patient successful..........");
        final patient= jsonDecode(res.body)['patient'] as Map<String, dynamic>;
        return PatientModule.fromJson(patient);
      }else if(res.statusCode == 422){
        print("Account already exists.....  ${res.body}");
        return null;
      }else{
        print("Failed to create account(Patient):-->  ${res.statusCode} ${res.body}");
        return null;
      }

    }catch(err){
      print("Error creating patient:..   $err");
      return null;
    }
    
  }

  @override
  Future<AdminModule?> getAdminProfile({
    required String token
  }) async{
    final uri = Uri.parse(AppConstants.adminProfile);

    try{

      final res = await http.get(
        uri,
        headers: {
          "Authorization": token
        }
      );

      if(res.statusCode == 200 ||  res.statusCode == 201){
        print("Succesfuly fetched profile::   ${res.statusCode}  ${res.body}");

        ///todo
        return AdminModule.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
      }else if(res.statusCode == 404){
        print("User not found::   ${res.statusCode}  ${res.body}");
      }else{
        print("Failed to fetch profile::   ${res.statusCode}  ${res.body}");
      }

    }catch(err){
      print("Error fetching profile::   $err");
      return null;
    }
  }

  @override
  Future<DoctorModule?> getDoctorProfile({
    required String token
  }) async{
    final uri = Uri.parse(AppConstants.doctorProfile);

    try{

      final res = await http.get(
        uri,
        headers: {
          "Authorization": token
        }
      );

      if(res.statusCode == 200 ||  res.statusCode == 201){
        print("Succesfuly fetched profile::   ${res.statusCode}  ${res.body}");
        
        return DoctorModule.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
      }else if(res.statusCode == 404){
        print("User not found::   ${res.statusCode}  ${res.body}");
      }else{
        print("Failed to fetch profile::   ${res.statusCode}  ${res.body}");
      }

    }catch(err){
      print("Error fetching profile::   $err");
      return null;
    }
  }

  @override
  Future<PatientModule?> getPatientProfile({
    required String token
  }) async{
    final uri = Uri.parse(AppConstants.pateintProfile);

    try{

      final res = await http.get(
        uri,
        headers: {
          "Authorization": token
        }
      );

      if(res.statusCode == 200 ||  res.statusCode == 201){
        print("Succesfuly fetched profile::   ${res.statusCode}  ${res.body}");
        
        ///todo
        return PatientModule.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
      }else if(res.statusCode == 404){
        print("User not found::   ${res.statusCode}  ${res.body}");
      }else{
        print("Failed to fetch profile::   ${res.statusCode}  ${res.body}");
      }

    }catch(err){
      print("Error fetching profile::   $err");
      return null;
    }
  }

  @override
  Future<int> loginAsAdmin({required String email, required String password, required UserProvider provider}) async{
    final uri = Uri.parse(AppConstants.loginAdmin);
    final Map<String, dynamic> payload = {
      "email": email,
      "password": password
    };

    try{
      final res = await http.post(
        uri,
        body: payload
      );

      if(res.statusCode == 200 || res.statusCode == 201){
        print("Login successful....${res.body}");
        final token = "Bearer ${res.body}";
        provider.token = token;
        return 1;
      }else if(res.statusCode == 401){
        print("Invalid credentials....");
        return -1;
      }else if(res.statusCode == 404){
        print("User not found....");
        return 0;
      }else{
        print("Failed to login");
        return -2;
      }

    }catch(err){
      print("Login as Admin...   $err");
      return -5;
    }
  }

  @override
  Future<int> loginAsDoctor({required String email, required String password, required UserProvider provider}) async{
    final uri = Uri.parse(AppConstants.loginDoctor);
    final Map<String, dynamic> payload = {
      "email": email,
      "password": password
    };

    try{
      final res = await http.post(
        uri,
        body: payload
      );

      if(res.statusCode == 200 || res.statusCode == 201){
        print("Login successful.... ${res.body}");
        final token = "Bearer ${res.body}";
        provider.token = token;
        return 1;
      }else if(res.statusCode == 401){
        print("Invalid credentials.... ${res.body}");
        return -1;
      }else if(res.statusCode == 404){
        print("User not found....");
        return 0;
      }else{
        print("Failed to login");
        return -2;
      }

    }catch(err){
      print("Error logging in as doctor....   $err");
      return -5;
    }
  }

  @override
  Future<int> loginAsPatient({required String email, required String password, required UserProvider provider}) async{
    final uri = Uri.parse(AppConstants.loginPatient);
    final Map<String, dynamic> payload = {
      "email": email,
      "password": password
    };

    try{
      final res = await http.post(
        uri,
        body: payload
      );

      if(res.statusCode == 200 || res.statusCode == 201){
        print("Login successful....    ${res.body}");
        final token = "Bearer ${res.body}";
        provider.token = token;
        return 1;
      }else if(res.statusCode == 401){
        print("Invalid credentials....  ${res.body}");
        return -1;
      }else if(res.statusCode == 404){
        print("User not found....");
        return 0;
      }else{
        print("Failed to login");
        return -2;
      }

    }catch(err){
      print("Erro logging in patient....    $err");
      return -5;
    }
  }
  
  @override
  Future<List<DoctorModule>> getAllDoctor({
    required String token}) async{
      final uri = Uri.parse(AppConstants.getAllDoctors);

    try{

      final res = await http.get(
        uri,
        headers: {
          "Authorization": token
        }
      );

      if(res.statusCode == 200 ||  res.statusCode == 201){
        print("Succesfuly fetched Doctors::   ${res.statusCode}  ${res.body}");

        final List<DoctorModule> doctors = [];
        final data = jsonDecode(res.body)['doctors'] as List<dynamic>;

        for(var item in data){
          doctors.add(DoctorModule.fromJson(item as Map<String, dynamic>));
        }
        
        return doctors;
      }else if(res.statusCode == 401){
        print("Unauthorized::   ${res.statusCode}  ${res.body}");
        return [];
      }else{
        print("Failed to fetch doctors::   ${res.statusCode}  ${res.body}");
        return [];
      }

    }catch(err){
      print("Error fetching doctors::   $err");
      return [];
    }
  }
  
  @override
  Future<DoctorModule?> getSingleDoctorProfile({
    required String token, required int doctorId}) async{
    final uri = Uri.parse("${AppConstants.getSingleDoctor}$doctorId");

    try{

      final res = await http.get(
        uri,
        headers: {
          "Authorization": token
        }
      );

      if(res.statusCode == 200 ||  res.statusCode == 201){
        print("Succesfuly fetched Doctor profile::   ${res.statusCode}  ${res.body}");
        
        return DoctorModule.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
      }else if(res.statusCode == 404){
        print("User (Doctor) not found::   ${res.statusCode}  ${res.body}");
      }else{
        print("Failed to fetch Doctor profile::   ${res.statusCode}  ${res.body}");
      }

    }catch(err){
      print("Error fetching profile::   $err");
      return null;
    }
  }
  
  @override
  Future<PatientModule?> getSinglePatientProfile({
    required String token, 
    required int patientId}) async{
    
    final uri = Uri.parse("${AppConstants.getSinglePatient}$patientId");

    try{

      final res = await http.get(
        uri,
        headers: {
          "Authorization": token
        }
      );

      if(res.statusCode == 200 ||  res.statusCode == 201){
        print("Succesfuly fetched Patient profile::   ${res.statusCode}  ${res.body}");
        
        ///todo
        return PatientModule.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
      }else if(res.statusCode == 404){
        print("User (Patient) not found::   ${res.statusCode}  ${res.body}");
      }else{
        print("Failed to fetch patient profile::   ${res.statusCode}  ${res.body}");
      }

    }catch(err){
      print("Error fetching profile::   $err");
      return null;
    }
  }
  
}