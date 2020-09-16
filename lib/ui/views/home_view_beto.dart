import 'package:app_test/constants/route_names.dart';
import 'package:app_test/locator.dart';
import 'package:app_test/services/hotel_service.dart';
import 'package:app_test/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'map_view.dart';

class HomeView extends StatelessWidget {
  final NavigationService navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Widget>>(
      future: HotelService().searchHotels(),
      builder: (context, snapshot) {
        return Scaffold(
          drawer: Container(
            width: MediaQuery.of(context).size.width * 0.50,
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.only(top: 60),
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Color(0xFF252DB7)
                    ),
                    title: Text('Home')
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      color: Color(0xFF252DB7)
                    ),
                    title: Text('Perfil')
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.history,
                      color: Color(0xFF252DB7)
                    ),
                    title: Text('Histórico'),
                    onTap: () async {
                      var prefs = await SharedPreferences.getInstance();
                      await prefs.remove('id');
                      await navigationService.navigateTo(HistoryViewRoute);
                    }
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: Color(0xFF252DB7)
                    ),
                    title: Text('Configuração')
                  ),
                  Divider(
                    height: 10,
                    thickness: 1.5
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.keyboard_backspace,
                      color: Color(0xFF252DB7)
                    ),
                    title: Text('Sair'),
                    onTap: () async {
                      var prefs = await SharedPreferences.getInstance();
                      await prefs.remove('id');
                      await navigationService.navigateTo(LoginViewRoute);
                    }
                  )
                ]
              )
            )
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Color(0xFF252DB7)),
            centerTitle: true,
            title: SizedBox(
              width: 130,
              child: Image.asset('assets/images/title.png')
            )
          ),
         
          body:    Column(
                children:[
                  Map(),
                  ListView(
                    children:snapshot.data
                    )]
                ),
          );
      },
    );
  }
}