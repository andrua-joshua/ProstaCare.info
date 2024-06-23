import 'package:sample_app/bloc/modules/admin_module.dart';
import 'package:sample_app/bloc/modules/doctor_module.dart';
import 'package:sample_app/bloc/modules/patient_module.dart';
import 'package:sample_app/providers/user_provider.dart';

abstract interface class UserRepositoryBase{

  //login as admin
  //login as patient
  //login as doctor
  //creat Patient
  //create Doctor
  //create Admin
  //delete doctor
  //get admin
  //get patient
  //get Doctor


  Future<AdminModule?> getAdminProfile({
    required String token
  });
  Future<PatientModule?> getPatientProfile({
    required String token
  });
  Future<DoctorModule?> getDoctorProfile({
    required String token
  }); 
  Future<int> loginAsAdmin({
    required String email,
    required String password,
    required UserProvider provider
  });
  Future<int> loginAsPatient({
    required String email,
    required String password,
    required UserProvider provider
  });
  Future<int> loginAsDoctor({
    required String email,
    required String password,
    required UserProvider provider
  });
  Future<DoctorModule?> createDoctor({
    required String password,
    required DoctorModule doctorModule
  });
  Future<AdminModule?> createAdmin({
    required String password,
    required AdminModule adminModule
  });
  Future<PatientModule?> createPatient({
    required String password,
    required PatientModule pateintModule
  });





}