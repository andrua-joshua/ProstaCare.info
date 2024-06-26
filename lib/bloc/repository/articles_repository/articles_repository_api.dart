import 'dart:convert';

import 'package:sample_app/bloc/modules/article_module.dart';
import 'package:sample_app/bloc/repository/articles_repository/articles_repository_base.dart';
import 'package:http/http.dart' as http;
import 'package:sample_app/utils/app_constants.dart';


class ArticlesRepositoryApi implements ArticlesRepositoryBase{

  @override
  Future<int> addArticle({
    required String token, 
    required ArticleModule article}) async{
      final uri = Uri.parse(AppConstants.createArticle);

      final Map<String, dynamic> payload = {
        "doctor_id": "${article.doctorId}",
        "image": article.image,
        "content": article.content,
        "link": article.link
      };

      print("------> Doctors here....");

      try{

        final res = await http.post(
          uri,
          headers: {
            "Authorization": token
          },
          body: payload
        );

        if(res.statusCode == 200 || res.statusCode == 201){
          print("Article added succesfully  ..    ${res.body}");
          return 1;
        }else {
          print("Failed to add articles....   ${res.statusCode}  ${res.body}");
          return -1;
        }

      }catch(err){
        print("Error adding article ......  $err");
        return -5;
      }

  }

  @override
  Future<int> deleteArticle({
    required String token,
    required int articleId,
    }) async{
      final uri = Uri.parse("${AppConstants.deleteArticle}$articleId");

      try{

        final res = await http.delete(
          uri,
          headers: {
            "Authorization": token
          });

        if(res.statusCode == 200 || res.statusCode == 201){
          print("Delete article successfull.... ${res.body}");
          return 1;
        }else if(res.statusCode == 404){
          print("Article not found....    ${res.statusCode} ${res.body}");
          return 0;
        }else{
          print("Failed to delete article........  ${res.body}");
          return -1;
        }

      }catch(err){
        print("Erro deleting article .....   $err");
        return -5;
      }
  }

  @override
  Future<List<ArticleModule>> getAllArticles({required String token}) async{
    final uri = Uri.parse(AppConstants.getAllArticle);

      try{

        final res = await http.get(
          uri,
          headers: {
            "Authorization": token
          }
        );

        if(res.statusCode == 200 || res.statusCode == 201){
          print("Articles got successfully.....  ${res.statusCode} ${res.body}");
          final data = jsonDecode(res.body)['articles'] as List<dynamic>;
          final List<ArticleModule> articles = [];
          for(var item in data){
            articles.add(ArticleModule.fromJson(item));
          }

          return articles;
        }else {
          print("Failed to get articles.....  ${res.body}");
          return [];
        }


      }catch(err){
        print("Error get articles .......    $err");
        return [];
      }

  }

  @override
  Future<ArticleModule?> getArticle({
    required String token,
    required int articleId,
    }) async{

      final uri = Uri.parse("${AppConstants.getArticleById}$articleId");

      try{

        final res = await http.get(
          uri,
          headers: {
            "Authorization": token
          }
          );

        if(res.statusCode == 200 || res.statusCode == 201){
          print("Article got successfully ... ${res.body}");
          final article = jsonDecode(res.body)["article"] as Map<String, dynamic>;
          return ArticleModule.fromJson(article);
        }else if(res.statusCode == 404){
          print("Article not found.......    ${res.body}");
          return null;
        }else{
          print("Failed to get article....   ${res.body}");
          return null;
        }

      }catch(err){
        
        return null;
      }
    
  }
  
  @override
  Future<List<ArticleModule>> getArticlesByDoctorId({
    required String token, 
    required int doctorId
    }) async{

      final uri = Uri.parse("${AppConstants.getArticleByDoctor}$doctorId");

      try{

        final res = await http.get(
          uri,
          headers: {
            "Authorization": token
          }
        );

        if(res.statusCode == 200 || res.statusCode == 201){
          print("Articles got successfully.....  ${res.statusCode} ${res.body}");
          final data = jsonDecode(res.body)['articles'] as List<dynamic>;
          final List<ArticleModule> articles = [];
          for(var item in data){
            articles.add(ArticleModule.fromJson(item));
          }

          return articles;
        }else {
          print("Failed to get articles.....  ${res.body}");
          return [];
        }


      }catch(err){
        print("Error get articles .......    $err");
        return [];
      }
    
  }

  
}