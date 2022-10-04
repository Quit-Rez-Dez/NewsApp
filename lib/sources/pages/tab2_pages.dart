import 'package:flutter/material.dart';
import 'package:newsapp/sources/models/category_model.dart';
import 'package:newsapp/sources/services/news_services.dart';
import 'package:newsapp/sources/theme/tema.dart';
import 'package:newsapp/sources/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final newService= Provider.of<NewsService>(context);

    return Scaffold(
        body: Column(
      children: [
        _ListaCategorias(),
        Expanded(
            child:ListaNoticias(newService.getAcritulosCategoriaSeleccionada)
        )

      ],
    ));
  }
}

class _ListaCategorias extends StatelessWidget {




  @override
  Widget build(BuildContext context) {

    final categories=Provider.of<NewsService>(context).categories;



    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.red,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,

        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index){


          final cName= categories[index].name;

          return Container(

            child: Padding(
                padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  _CategoryButton(categoria: categories[index]),
                  SizedBox(height: 5,),
                  Text( '${ cName[0].toUpperCase() }${cName.substring(1)} '),
                ],
              ),

            ),
          );
        }
        ),
    );
  }
}

class _CategoryButton extends StatelessWidget {

  final Category categoria;

  const _CategoryButton({ required this.categoria}) ;


  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);


    return GestureDetector(
      onTap: (){
        print('${categoria.name}');
        final newService=Provider.of<NewsService>(context,listen: false);


        newService.selectedCategory=categoria.name;


      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
            categoria.icon,
          color: (newsService.selectedCategory == categoria.name)
            ? mitema.colorScheme.secondary
              :Colors.black54,

        ),
      ),
    );
  }
}
