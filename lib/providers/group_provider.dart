import 'package:flutter/foundation.dart';
import 'package:sample_app/bloc/repository/group_repository/group_respository_base.dart';

class GroupProvider with ChangeNotifier{

  GroupProvider._(GroupRespositoryBase groupRepository) : groupRepo = groupRepository;
  factory GroupProvider(GroupRespositoryBase groupRepository) => GroupProvider._(groupRepository);


  final GroupRespositoryBase groupRepo;

  void notifyAll() => notifyListeners();

}