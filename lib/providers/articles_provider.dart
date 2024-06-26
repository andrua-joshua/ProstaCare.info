import 'package:flutter/foundation.dart';
import 'package:sample_app/bloc/repository/articles_repository/articles_repository_base.dart';

class ArticlesProvider with ChangeNotifier{

  ArticlesProvider._(ArticlesRepositoryBase articleRepository): articlesRepo = articleRepository;
  factory ArticlesProvider(ArticlesRepositoryBase articleRepository)
   => ArticlesProvider._(articleRepository);


  final ArticlesRepositoryBase articlesRepo;

  void notifylAll() => notifyListeners();
}