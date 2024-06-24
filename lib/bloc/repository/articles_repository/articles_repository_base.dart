import 'package:sample_app/bloc/modules/article_module.dart';

abstract interface class ArticlesRepositoryBase{

  ///
  ///delete article
  ///add article
  ///getall articles
  ///get article
  ///
  
  Future<int> addArticle({
    required String token,
    required ArticleModule article
  });

  Future<List<ArticleModule>> getAllArticles({
   required String token 
  });

  Future<List<ArticleModule>> getArticlesByDoctorId({
   required String token,
   required int doctorId
  });

  Future<ArticleModule?> getArticle({
   required String token ,
   required int articleId,
  });

  Future<int> deleteArticle({
   required String token ,
   required int articleId,
  });


}