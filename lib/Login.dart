import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ProductListPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController ctrUsername = new TextEditingController();
  TextEditingController ctrPassword= new TextEditingController();
  SharedPreferences? prefs;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    initialObject();
  }

  void initialObject() async{
    prefs = await SharedPreferences.getInstance();
    // kalau sudah ada isinya, session maka akan redirect ke Homepage
    String session = prefs!.getString("username") ?? "";
    print("login page : "+session);
    if(session.isNotEmpty){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductListPage()),
      );
    }
  }

  Widget myTextField(
      String label, bool isObsecure, TextEditingController myController) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: myController,
        obscureText: isObsecure,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example Login"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              myTextField('username', false, ctrUsername),
              myTextField('password', true, ctrPassword),
              ElevatedButton(onPressed: () async{
                // save button akan menyimpan token (username)
                await prefs!.setString('username', ctrUsername.text.toString());
                // move to another page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListPage()),
                );
              }, child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
