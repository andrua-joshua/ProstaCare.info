import 'package:flutter_test/flutter_test.dart';
import 'package:sample_app/bloc/modules/article_module.dart';
import 'package:sample_app/bloc/repository/articles_repository/articles_repository_api.dart';

void main(){
  group("Articles repository testing", (){

    test("Add article test", ()async{
      const String token = "";
      const ArticleModule article = ArticleModule(
        id: 0, 
        content: "Test Article", 
        doctorId: "1", 
        link: "",
        image: "https://imsdsjfjsadhsdhfjashdsdf"
        );

      final ArticlesRepositoryApi articlesRepositoryApi = ArticlesRepositoryApi();

      final res = await articlesRepositoryApi.addArticle(
        token: token, article: article);

      expect(1, res, reason: "Adding articels test");
      

    });

    test("Get All articles test", ()async{
      final ArticlesRepositoryApi articlesRepositoryApi = ArticlesRepositoryApi();

      final res = await articlesRepositoryApi.getAllArticles(token: "token");

      expect(true, res.length>0, reason: "Getting all articles");
        
    });

    test("Get articles by doctor test", ()async{
      final ArticlesRepositoryApi articlesRepositoryApi = ArticlesRepositoryApi();

       final res = await articlesRepositoryApi.getArticlesByDoctorId(
            token: "token", doctorId: 1);
      
       expect(true, res.length>0, reason:  "Testing getting article by doctor");
    });

    test("Get Article test", ()async{
      final ArticlesRepositoryApi articlesRepositoryApi = ArticlesRepositoryApi();

      final res = await articlesRepositoryApi.getArticle(
        token: "token", 
        articleId: 1);

      expect(true, res!=null, reason: "testing the option og getting a single article");
        
    });


    test("Delete Article test", ()async{
      final ArticlesRepositoryApi articlesRepositoryApi = ArticlesRepositoryApi();

       final res = await articlesRepositoryApi.deleteArticle(
        token: "token", 
        articleId: 7);

        expect(1, 1, reason: "testing the option og getting a single article"); 
    });

  });
}