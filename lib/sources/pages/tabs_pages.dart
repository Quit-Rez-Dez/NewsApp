import 'package:flutter/material.dart';
import 'package:newsapp/sources/pages/tab1_pages.dart';
import 'package:newsapp/sources/pages/tab2_pages.dart';
import 'package:provider/provider.dart';

class TabsPages extends StatelessWidget {
  const TabsPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (_) => _NavegacionModel() ,
      child: Scaffold(
        appBar: AppBar(
          title: Text('News app'),
        ),
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    final navegacionModel=Provider.of<_NavegacionModel>(context);
    //final newService=Provider.of<NewsService>(context);




    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual=i,
      items: const [
      BottomNavigationBarItem(icon: Icon(Icons.person_outlined),label: 'para ti ' ),
      BottomNavigationBarItem(icon: Icon(Icons.public),label: 'Encabezado' )
    ],);
  }
}

class _Paginas extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);


    return PageView(

      controller: navegacionModel._pageController,
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: [

        Tab1Page(),

        Tab2Page(),


      ],
    );
  }
}


class _NavegacionModel  with ChangeNotifier{

  int _paginaActual=0;
  PageController _pageController=new PageController(initialPage: 0);


  int get paginaActual =>this._paginaActual;


  set paginaActual(int valor){
    this._paginaActual=valor;

    _pageController.animateToPage(valor, duration: Duration(milliseconds: 150), curve: Curves.easeInOut);

    notifyListeners();
  }

  PageController get pageController => this._pageController;


}