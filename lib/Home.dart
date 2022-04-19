import 'dart:ui';

import 'package:atcsearch/Quality2/NicotineAndSugar.dart';
import 'package:flutter/material.dart';

import 'Quality2/ModelsQuality/Quality2.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF040404),
        automaticallyImplyLeading: false,
        title: Text(
          'ATC Search',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GestureDetector(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(4),
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            crossAxisCount: 3,
            children: [
              Card(
                color: Colors.white,
                child: Center(
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Quality2(),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.assessment_rounded,
                          size: 80.0,
                        ),
                        Text("Quality2"),
                      ],
                    ),
                  ),
                ),
              ),

              Card(
                color: Colors.white,
                child: Center(
                /*  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Quality2(),
                      ),
                    ),*/
                    child: Column(

                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Icon( Icons.backpack_outlined, size:80.0),
                        Text("P. Acabado"),

                      ],
                    ),
                 // ),
                ),

              ),


              Card(
                color: Colors.white,
                child: Center(
                  /*child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Quality2(),
                      ),
                    ),*/
                    child: Column(

                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Icon( Icons.agriculture, size:80.0,),
                        Text("Fumo Cru"),

                      ],
                    ),
                  //),
                ),

              ),



            ],
          ),
        ),
      ),
    );

    /*GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/atclogo.jpg',
                    width: 200,
                    height: 100,
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => NicotineAndSugar(),
                              ),
                            ), // needed
                            child: Image.asset(
                              "images/laboratorio.jpg",
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'images/produtoacabado.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'images/fumocru.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '      Quality2',
                        ),
                        Text(
                          'Produto Acabado',
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 17, 0),
                          child: Text(
                            'Fumo Cru',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );*/
  }
}
