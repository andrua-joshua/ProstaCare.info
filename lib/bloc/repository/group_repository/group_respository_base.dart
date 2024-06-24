import 'package:sample_app/bloc/modules/group_module.dart';

abstract interface class GroupRespositoryBase{


  ///
  ///get all groups
  ///get all groups by doctor
  ///get single group
  ///add group
  ///delete group
  ///
  

  Future<List<GroupModule>> getAllGroups({
    required String token
  });


  Future<List<GroupModule>> getGroupsByDoctor({
    required String token,
    required int doctorId
  });

  Future<GroupModule?> getSingleGroup({
    required String token,
    required int groupId
  });

  Future<int> addGroup({
    required String token,
    required GroupModule group
  });

  Future<int> deleteGroup({
    required String token,
    required int groupId
  });


}