import 'package:flutter/material.dart';
import 'package:newsapp/sources/models/news_models.dart';
import 'package:newsapp/sources/theme/tema.dart';

class ListaNoticias extends StatelessWidget {

  late final List<Article>? noticias;


  ListaNoticias(this.noticias);




  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias?.length,
        itemBuilder: (BuildContext context,int index){
        return _Noticia(noticia: this.noticias![index], index: index);
        }
    );
  }
}

class _Noticia extends StatelessWidget {


  final Article noticia;
  final int index;

  const _Noticia({ required this.noticia, required this.index});





  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TabTopBar( noticia: noticia,index: index, ),
        _TarjetaTitulo(  noticia: noticia, ),
        _TarjetaImagen(noticia: noticia,),
        _TargetaBody(noticias: noticia,),
        _TarjetaBotones(),



        SizedBox(height: 10,),
        Divider(),
      ],
    );
  }
}


class _TabTopBar extends StatelessWidget {

  final Article noticia;
  final int index;


  const _TabTopBar({ required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(' ${ index +1}',style: TextStyle(color: mitema.colorScheme.secondary),),
          Text(' ${ noticia.source?.name}.')
        ],
      ),
    );
  }
}


class _TarjetaTitulo extends StatelessWidget {

  final Article noticia;

  const _TarjetaTitulo({ required this.noticia});



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticia.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {


  final Article noticia;

  const _TarjetaImagen({ required this.noticia}) ;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),

      child: ClipRRect(

        borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
        child: Container(
          child:
          ( noticia.urlToImage != null )
            ? FadeInImage(
            placeholder: AssetImage( 'assets/img/giphy.gif' ),
            image: NetworkImage( noticia.urlToImage  ?? "" ),
            imageErrorBuilder:   (context, error, stackTrace)
            {
            return Image.asset('assets/img/no-image.png',);
            },
        )
            : Image( image: AssetImage('assets/img/no-image.png'), )


        ),
      ),
    );
  }
}

class _TargetaBody extends StatelessWidget {

  final Article noticias;

  const _TargetaBody({ required this.noticias}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(noticias.description ?? ''),
    );
  }
}


class _TarjetaBotones extends StatelessWidget {
  const _TarjetaBotones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
              onPressed: (){},
            fillColor: mitema.colorScheme.secondary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star_border),
          ),

          SizedBox(width: 10,),

          RawMaterialButton(
            onPressed: (){},
            fillColor:Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.more),
          )
        ],
      ),
    );
  }
}

