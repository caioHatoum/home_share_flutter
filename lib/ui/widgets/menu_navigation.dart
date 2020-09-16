import 'package:app_test/ui/shared/app_colors.dart';
import 'package:app_test/viewmodels/menu_navigation_view_model.dart';
import 'package:flutter/material.dart';

import 'busy_button.dart';

class MenuNavigation extends StatelessWidget {
  const MenuNavigation({Key key, this.model}) : super(key: key);
  final MenuNavigationViewModel model;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.menu), onPressed: () {
                buildDrawer();
            }),
            Spacer(),
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Drawer buildDrawer() {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 60),
          children:[
            DrawerHeader(child: Text('Menu')),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: darkGrey,
              ),
              title: Text('Perfil'),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: darkGrey,
              ),
              title: Text('Configuração'),
            ),
            Divider(
              height: 10,
              thickness: 1.5,
            ),
            BusyButton(
              icon: Icon(
                Icons.keyboard_backspace,
                color: darkGrey,
              ),
              title: 'Sair',
              busy: false,
              onPressed:(){model.signOut();}
              ,
              
            ),
          ],
        ),
      );
  }
}
