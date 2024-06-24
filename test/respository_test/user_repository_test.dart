import 'package:flutter_test/flutter_test.dart';
import 'package:sample_app/bloc/modules/admin_module.dart';
import 'package:sample_app/bloc/modules/doctor_module.dart';
import 'package:sample_app/bloc/modules/patient_module.dart';
import 'package:sample_app/bloc/repository/user_repository_base/user_respository_api.dart';
import 'package:sample_app/providers/user_provider.dart';

void main(){
  group("User repository test", (){
    test("Login Patient test", () async{
      const String email = "andruajoshua096@gmail.com"; //the test email
      const String password = "123456"; //the test password

      final UserProvider userProvider = UserProvider(
        UserRespositoryApi()
      );

      final res = await userProvider.userRespositoryApi.loginAsPatient(
        email: email, password: password, provider: userProvider);
      
      expect(1, res, reason: "To make sure that the login as Patient was successful");

    });

    test("Login Admin test", ()async{
      const String email = "andruajoshua096@gmail.com"; //the test email
      const String password = "123456"; //the test password

      final UserProvider userProvider = UserProvider(
        UserRespositoryApi()
      );

      final res = await userProvider.userRespositoryApi.loginAsAdmin(
        email: email, password: password, provider: userProvider);
      
      expect(1, res, reason: "To make sure that the login as Admin was successful");
    });

    test("Login Doctor test", () async{
      const String email = "drillox@gmail.com"; //the test email
      const String password = "123456"; //the test password

      final UserProvider userProvider = UserProvider(
        UserRespositoryApi()
      );

      final res = await userProvider.userRespositoryApi.loginAsDoctor(
        email: email, password: password, provider: userProvider);
      
      expect(1, res, reason: "To make sure that the login as Doctor was successful");
    });

    test("Create account Admin", () async{
      const String password = "123456";
      const AdminModule adminModule = AdminModule(
        id: 0, 
        email: "andruajoshua096@gmail.com", 
        name: "drillox_admin", 
        phone: "+256778926283");

      final UserProvider userProvider = UserProvider(
        UserRespositoryApi()
      );


      final res = await userProvider.userRespositoryApi.createAdmin(
        password: password, adminModule: adminModule);

      expect(true, res!=null, reason: "Creating the admin test");
    });

    test("Create account Patient", () async{
      const String password = "123456";
      const PatientModule patientModule = PatientModule(
        id: 0, 
        name: "drillox", 
        email: "andruajoshua096@gmail.com", 
        phone: "+256 770415425", 
        age: "23", 
        nin: "CM7974932844798342", 
        sex: "Male");

      final UserProvider userProvider = UserProvider(
        UserRespositoryApi()
      );


      final res = await userProvider.userRespositoryApi.createPatient(
        password: password, pateintModule: patientModule);

      expect(true, res!=null, reason: "Creating the patient test");
    });

    test("Create account Doctor", () async{
      const String password = "123456";
      const DoctorModule doctorModule = DoctorModule
      (id: 0, 
      name: "Drillox_ doctor", 
      email: "andruajoshua096@gmail.com", 
      age: "24", 
      location: "Bweyogere", 
      nin: "CM47397347942342", 
      phone: "+256585957575", 
      sex: "Male");

      final UserProvider userProvider = UserProvider(
        UserRespositoryApi()
      );


      final res = await userProvider.userRespositoryApi.createDoctor(
        password: password, doctorModule: doctorModule);

      expect(true, res!=null, reason: "Creating the Doctor test");
    });

    test("Get Admin Profile", () async {
      const String token = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2VhcnRoZW5hLmNvZ25vc3BoZXJlZHluYW1pY3MuY29tL2FwaS9hdXRoL2FkbWlubG9naW4iLCJpYXQiOjE3MTkyMjA3NDcsImV4cCI6MTcxOTIyNDM0NywibmJmIjoxNzE5MjIwNzQ3LCJqdGkiOiJscDBBdGNFalR3ZzJhY3h2Iiwic3ViIjoiOSIsInBydiI6ImRmODgzZGI5N2JkMDVlZjhmZjg1MDgyZDY4NmM0NWU4MzJlNTkzYTkifQ.CUtQ7aKbpJ35jCRHFWEP5rw27CSIlCNDGQeHgVhJ8G0";

      final UserProvider userProvider = UserProvider(
        UserRespositoryApi()
      );


      final res = await userProvider.userRespositoryApi
          .getAdminProfile(token: token);

      expect(true, res!=null, reason: "Getting Admin profile test");

    });

    test("Get Doctor Profile", ()async{
      const String token = "Bearer ";

      final UserProvider userProvider = UserProvider(
        UserRespositoryApi()
      );


      final res = await userProvider.userRespositoryApi
          .getDoctorProfile(token: token);

      expect(true, res!=null, reason: "Getting Doctor profile test");
    });


    test("Get Patient Profile", () async{
      const String token = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2VhcnRoZW5hLmNvZ25vc3BoZXJlZHluYW1pY3MuY29tL2FwaS9hdXRoL1BhdGllbnRsb2dpbiIsImlhdCI6MTcxOTIyMTUyMiwiZXhwIjoxNzE5MjI1MTIyLCJuYmYiOjE3MTkyMjE1MjIsImp0aSI6IjA2T1licFZVa1dkSm42VEYiLCJzdWIiOiI2IiwicHJ2IjoiNzUyODk1NjcxMGQxYzc1YjY3MTMwZDRlNGM1YzBlZTlhMGFlYjYxNCJ9.vzZl8qOEizSi9CI3gBQJynWc0oQ6EiYVmLA5TXfebDo";

      final UserProvider userProvider = UserProvider(
        UserRespositoryApi()
      );


      final res = await userProvider.userRespositoryApi
          .getPatientProfile(token: token);

      expect(true, res!=null, reason: "Getting Patient profile test");

    });

    test("Delete Doctor", (){

    });


  });
}