import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.50,
        // height: MediaQuery.of(context).size.height * 0.30,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.only(top: 60),
            children: const <Widget>[
              // DrawerHeader(
              //   decoration: BoxDecoration(
              //     color: Color(0xFF252DB7),
              //   ),
              //   child: Text(
              //     'Drawer Header Menu',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 24,
              //     ),
              //   ),
              // ),
              ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color: Color(0xFF252DB7),
                ),
                title: Text('Perfil'),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Color(0xFF252DB7),
                ),
                title: Text('Configuração'),
              ),
              Divider(
                height: 10,
                thickness: 1.5,
              ),
              ListTile(
                leading: Icon(
                  Icons.keyboard_backspace,
                  color: Color(0xFF252DB7),
                ),
                title: Text('Sair'),
                // onTap: () => {},
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Color(0xFF252DB7)),
        centerTitle: true,
        title: SizedBox(
          width: 130,
          child: Image.asset("assets/app-logo.png"),
        ),
        // ),
      ),
      body: Container(
        color: Color(0xFFF2F3F6),
        child: ListView(
          children: <Widget>[
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
          ],
        ),
      ),
    );
  }
}

Widget cardItem() {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          title: Text("Apartamento"),
          subtitle: Text("Morumbi"),
          trailing: Icon(Icons.more_vert),
        ),
        Container(
          child: Image.asset("assets/apartament.jpg"),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis ex sem. Praesent elit dui, iaculis at interdum eu, rutrum et mi. "),
        ),
        Container(
          height: 60,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            // color: Color(0xFF3C5A99),
            border: Border.all(
              color: Color(0xFF252DB7),
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: SizedBox.expand(
            child: FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Reservar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF252DB7),
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        // ButtonTheme.bar(
        //   child: ButtonBar(
        //     children: <Widget>[
        //       FlatButton(
        //         child: Icon(Icons.favorite),
        //         onPressed: () {},
        //       ),
        //       FlatButton(
        //         child: Icon(Icons.share),
        //         onPressed: () {},
        //       ),
        //     ],
        //   ),
        // ),
      ],
    ),
  );
}
