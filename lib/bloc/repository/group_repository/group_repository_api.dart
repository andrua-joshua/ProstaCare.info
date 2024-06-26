import 'dart:convert';

import 'package:sample_app/bloc/modules/group_module.dart';
import 'package:sample_app/bloc/repository/group_repository/group_respository_base.dart';
import 'package:sample_app/utils/app_constants.dart';
import 'package:http/http.dart' as http;


class GroupRepositoryApi implements GroupRespositoryBase{

  @override
  Future<int> addGroup({
    required String token, 
    required GroupModule group
    }) async{
      final uri = Uri.parse(AppConstants.createGroup);
      final Map<String, dynamic> payload = {
        "doctor_id": "${group.doctorId}",
        "title": group.title,
        "description": group.description,
        "link":group.link,
        "image":group.coverImg
      };

      try{

        final res = await http.post(
          uri,
          headers: {
            "Authorization": token
          },
          body: payload
        );


        if(res.statusCode == 200 || res.statusCode == 201){
          print("Group added successfully.........  ${res.body}");
          return 1;
        }else if(res.statusCode == 401){
          print("Unauthorized.........  ${res.body}");
          return -1;
        }else{
          print("Failed to create the group.........  ${res.body}");
          return -2;
        }

      }catch(err){
        print("Error adding group......   $err");
        return -5;
      }
    
  }

  @override
  Future<int> deleteGroup({
    required String token, 
    required int groupId}) async{

      final uri = Uri.parse("${AppConstants.deleteGroup}$groupId");

      try{

        final res = await http.delete(
          uri,
          headers: {
            "Authorization": token
          },
        );


        if(res.statusCode == 200 || res.statusCode == 201){
          print("Group deleted successfully.........  ${res.body}");
          return 1;
        }else if(res.statusCode == 401){
          print("Unauthorized.........  ${res.body}");
          return -1;
        }else{
          print("Failed to create the group.........  ${res.body}");
          return -2;
        }

      }catch(err){
        print("Error  deleting group......   $err");
        return -5;
      }
   
  }

  @override
  Future<List<GroupModule>> getAllGroups({
    required String token}) async{

    final uri = Uri.parse(AppConstants.getAllGroups);

      try{

        final res = await http.get(
          uri,
          headers: {
            "Authorization": token
          },
        );


        if(res.statusCode == 200 || res.statusCode == 201){
          print("Groups got successfully........  ${res.body} \n ====>>>> ${jsonDecode(res.body)["group"]} <===============");
          List<GroupModule> groups = [];
          final data = jsonDecode(res.body)["groups"] as List<dynamic>;
          for(var item in data){
            groups.add(GroupModule.fromJson(item));
          }
          return groups;
        }else if(res.statusCode == 401){
          print("Unauthorized.........  ${res.body}");
          return [];
        }else{
          print("Failed to get the grroups.........  ${res.body}");
          return [];
        }

      }catch(err){
        print("Error getting groups......   $err");
        return [];
      }      
    
  }

  @override
  Future<List<GroupModule>> getGroupsByDoctor({
    required String token, required int doctorId}) async{

      final uri = Uri.parse("${AppConstants.getGroupByDoctor}$doctorId");

      try{

        final res = await http.get(
          uri,
          headers: {
            "Authorization": token
          },
        );


        if(res.statusCode == 200 || res.statusCode == 201){
          print("Groups got successfully.........  ${res.body}");
          List<GroupModule> groups = [];
          final data = jsonDecode(res.body)["group"] as List<dynamic>;
          for(var item in data){
            groups.add(GroupModule.fromJson(item));
          }
          return groups;
        }else if(res.statusCode == 401){
          print("Unauthorized.........  ${res.body}");
          return [];
        }else{
          print("Failed to get the grroups.........  ${res.body}");
          return [];
        }

      }catch(err){
        print("Error getting groups......   $err");
        return [];
      }
  }

  @override
  Future<GroupModule?> getSingleGroup({
    required String token, 
    required int groupId}) async{
    final uri = Uri.parse("${AppConstants.getSingleGroup}$groupId");

      try{

        final res = await http.get(
          uri,
          headers: {
            "Authorization": token
          },
        );


        if(res.statusCode == 200 || res.statusCode == 201){
          print("Group got successfully.........  ${res.body}");
          final data = jsonDecode(res.body)["group"];
          return GroupModule.fromJson(data);
        }else if(res.statusCode == 401){
          print("Unauthorized.........  ${res.body}");
          return null;  
        }else{
          print("Failed to get the grroups.........  ${res.body}");
          return null;
        }

      }catch(err){
        print("Error getting group......   $err");
        return null;
      }
  }

  
}