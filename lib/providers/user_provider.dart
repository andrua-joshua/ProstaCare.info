import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/bloc/modules/admin_module.dart';
import 'package:sample_app/bloc/modules/doctor_module.dart';
import 'package:sample_app/bloc/modules/patient_module.dart';
import 'package:sample_app/bloc/repository/user_repository_base/user_respository_api.dart';

class UserProvider with ChangeNotifier{

  UserProvider._(
    UserRespositoryApi userRespositoryApi1): userRespositoryApi = userRespositoryApi1;

  factory UserProvider(UserRespositoryApi userRespositoryApi1)
    => UserProvider._(userRespositoryApi1);



  UserRespositoryApi userRespositoryApi;

  String token = "";
  AdminModule? adminModule;
  DoctorModule? doctorModule;
  PatientModule? patientModule;

  
  void notifyAll(){
    notifyListeners();  
  }
}