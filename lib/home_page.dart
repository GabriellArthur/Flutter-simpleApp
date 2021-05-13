import 'package:flutter/material.dart';
import 'package:flutterando/app_controller.dart';

//Mudança de estado (setState)
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture:
                    ClipOval(child: Image.asset('assets/images/minhaFoto.png')),
                accountName: Text('Gabriel'),
                accountEmail: Text('Gabriel@gmail.com')),
            SwitchListTile(
              title: Text('Dark Mode'),
              onChanged: (bool value) {
                setState(() {
                  AppController.instance.changeTheme();
                });
              },
              value: AppController.instance.isDartTheme,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              subtitle: Text('Tela de inicio'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.dangerous),
              title: Text('Logout'),
              subtitle: Text('Finalizar sessão'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          //ListView
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contador $count'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            count++;
          });
        },
      ),
    );
  }
}
