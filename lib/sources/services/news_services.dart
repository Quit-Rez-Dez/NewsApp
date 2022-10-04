import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/sources/models/news_models.dart';
import 'package:newsapp/sources/models/category_model.dart' as cat;

final _URL_NEWS = 'https://newsapi.org/v2';

final _APIKEY = '2e295bdc1b15412cb836107d38cc4394';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];
  String _selectedCategory = 'business';

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String value) {
    _selectedCategory = value;

    getArticlesByCategory(  value );

    notifyListeners();
  }


 List <Article>?  get getAcritulosCategoriaSeleccionada =>categoryArticles[ selectedCategory ];

  List<cat.Category> categories = [
    cat.Category(FontAwesomeIcons.building, 'business'),
    cat.Category(FontAwesomeIcons.tv, 'entertainment'),
    cat.Category(FontAwesomeIcons.addressCard, 'general'),
    cat.Category(FontAwesomeIcons.headSideVirus, 'health'),
    cat.Category(FontAwesomeIcons.vials, 'science'),
    cat.Category(FontAwesomeIcons.volleyball, 'sports'),
    cat.Category(FontAwesomeIcons.memory, 'technology'),
  ];


  Map<String, List<Article>> categoryArticles ={};


  NewsService() {
    this.getTopHeadlines();

    categories.forEach((element) {
      this.categoryArticles[element.name]= [];
    });
  }

  getTopHeadlines() async {

    print('Cargando headlines');

    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=MX';
    var dio = Dio();
    final resp = await dio.get(url);
    final newsResponse = newsResponseFromJson(resp.toString());

    //print(resp.data);

    this.headlines.addAll(newsResponse.articles);

    notifyListeners();
  }

  getArticlesByCategory(String  category) async {

    print('Cargando headlines');

    if(this.categoryArticles[category]!.isNotEmpty){
      return   this.categoryArticles[category];
    }

    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=MX&category=$category';
    var dio = Dio();
    final resp = await dio.get(url);
    final newsResponse = newsResponseFromJson(resp.toString());

    this.categoryArticles[category]?.addAll(newsResponse.articles);

    print(resp.data);

    notifyListeners();

  }


}
