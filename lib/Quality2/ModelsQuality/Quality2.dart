import 'dart:ui';

import 'package:atcsearch/Quality2/NicotineAndSugar.dart';
import 'package:flutter/material.dart';

class Quality2 extends StatefulWidget {
  @override
  _Quality2State createState() => _Quality2State();
}

class _Quality2State extends State<Quality2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF040404),
        title: Text(
          'Quality2',
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
              Container(
                padding: const EdgeInsets.all(20),
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NicotineAndSugar(),
                    ),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        "images/NicotineAndSugar.jpg",
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),

                      Container(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child:  Text(
                          "Nic. & Sugar",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),

                      ),

                    ],
                  ),
                ),
                color: Colors.white,
              ),
              Container(
                padding: const EdgeInsets.all(20),
              /*  child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NicotineAndSugar(),
                    ),
                  ),*/
                  child: Column(
                    children: [
                      Image.asset(
                        "images/pesoamostra.jpg",
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                      Container(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child:  Text(
                          "Moisture",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),

                      ),
                    ],
                  ),
               // ),
                color: Colors.white,
              ),
              Container(
                padding: const EdgeInsets.all(20),
               /* child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NicotineAndSugar(),
                    ),
                  ),*/
                  child: Column(
                    children: [
                      Image.asset(
                        "images/degradation.jpg",
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                      Container(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child:  Text(
                          "Degradation",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),

                      ),
                    ],
                  ),
               // ),
                color: Colors.white,
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
