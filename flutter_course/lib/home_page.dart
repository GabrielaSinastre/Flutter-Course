//Statefull
import 'package:flutter/material.dart';
import 'package:flutter_course/app_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipOval(
                // borderRadius: BorderRadius.circular(40),
                child: Image.network('https://via.placeholder.com/150')
              ),
              accountName: Text(
                'Gabi Linda'
              ), 
              accountEmail: Text(
                'gabi@linda.com'
              ),
            ),


            ListTile(
              leading: Icon(Icons.home),
              title: Text('Início'),
              subtitle: Text('tela de início'),
              onTap: (){
                print('home');
              },
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text('Logout'),
              subtitle: Text('tela de logout'),
              onTap: (){
                print('logout');
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          CustomSwitch()
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Text('Contador: $counter'),
        //     CustomSwitch(),
        //   ],
        // ),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Text('Contador: $counter'),
        //     CustomSwitch(),
        //   ],
        // ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Text('Contador: $counter'),
            CustomSwitch(),
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            setState(() {
              counter++;
            });
          }
        ),
    );
  }

}


class CustomSwitch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme, 
      onChanged: (value){
        AppController.instance.changeTheme();
      });
  }
}