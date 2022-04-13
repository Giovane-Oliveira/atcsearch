import 'package:flutter/material.dart';



class Login extends StatelessWidget {


  static const String _title = 'ATC Search';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),
        backgroundColor: Colors.black,),
        body:  MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {


  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),

            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Usuário',
                  prefixIcon: Icon(Icons.verified_user),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.50),

                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),

                  prefixIcon: Icon(Icons.key),

                  labelText: 'Senha',
                    labelStyle: TextStyle(
                        color:  Colors.black
                    ),

              ),
                      cursorColor: Colors.black,
            ),
            ),

            Container(
                height: 60,
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,

                    /*Color primary, // set the background color
                    Color onPrimary,
                    Color onSurface,
                    Color shadowColor,
                    double elevation,
                    TextStyle textStyle,
                    EdgeInsetsGeometry padding,
                    Size minimumSize,
                    BorderSide side,
                    OutlinedBorder shape,
                    MouseCursor enabledMouseCursor,
                    MouseCursor disabledMouseCursor,
                    VisualDensity visualDensity,
                    MaterialTapTargetSize tapTargetSize,
                    Duration animationDuration,
                    bool enableFeedback*/
                  ),

                )
            ),
          ],
        ));
  }
}