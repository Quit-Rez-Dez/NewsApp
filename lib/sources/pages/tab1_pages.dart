import 'package:flutter/material.dart';
import 'package:newsapp/sources/services/news_services.dart';
import 'package:newsapp/sources/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>  with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {



    final headlines=Provider.of<NewsService>(context).headlines;
    //ListaNoticias(newsService.headlines),

    return Scaffold(

      body: (headlines.isEmpty )
          ? const Center(child: CircularProgressIndicator(),)
          : ListaNoticias(headlines),


    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
