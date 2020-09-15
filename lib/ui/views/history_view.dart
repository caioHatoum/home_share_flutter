import 'package:app_test/constants/route_names.dart';
import 'package:app_test/locator.dart';
import 'package:app_test/services/hotel_service.dart';
import 'package:app_test/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryView extends StatelessWidget {
  final NavigationService navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Widget>>(
      future: HotelService().getHistory(),
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
                    title: Text('Home'),
                    onTap: () async {
                      await navigationService.navigateTo(HomeViewRoute);
                    }
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
                    title: Text('Histórico')
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
          body: Container(
            color: Color(0xFFF2F3F6),
            child: ListView(
              children: snapshot.data
            )
          )
        );
      },
    );
  }
}