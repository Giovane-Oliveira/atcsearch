import 'dart:io';
import 'dart:ui';

import 'package:atcsearch/Home.dart';
import 'package:atcsearch/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'ConsultaCostumer.dart';

class ListViewQuality extends StatefulWidget {
  String? valor;

  ListViewQuality({this.valor});


  @override
  _ListViewQualityState createState() => _ListViewQualityState();

}

class _ListViewQualityState extends State<ListViewQuality> {
  late Future<List<Post>>  _myData = _recuperarPostagens();
  late TextEditingController customer;
  late TextEditingController grade;




  @override
  void initState() {
    super.initState();
    customer = TextEditingController();
    grade = TextEditingController();

    setState(() {
      if(widget.valor != null){

        customer.text = "${widget.valor}";

      }

    });

  }
  Future<List<Post>> _recuperarPostagens() async {

    String url = "http://192.168.200.11/read.php?tipo=consultar&empresa="+ customer.text +"&carga=" + grade.text;
    http.Response response;
    response = await http.get(Uri.parse(url));
    var dadosJson = json.decode(response.body);
    List<Post> postagens = <Post>[];
    for (var post in dadosJson) {
      // print("post: " + post["cod_carga"] );
      Post p = Post(post["cod_carga"], post["cod_empresa"]);
      postagens.add(p);
    }
    //print( postagens.toString() );

    return postagens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nicotine and Sugar"),
        backgroundColor: Colors.black,
      ),
      body:

      Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: TextFormField(
                        controller: customer,
                        obscureText: false,
                        keyboardType:  TextInputType.number,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Customer',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(

                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 110, 0),
                     child:  IconButton(
                        iconSize: 30,
                        icon: Icon(Icons.search),
                        onPressed: () => Navigator.pushReplacement(
                        context,
                         MaterialPageRoute(
                           builder: (_) => ConsultaCostumer(),
                                          ),
                      ),
                    ),
                   ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: TextFormField(
                        controller: grade,
                        obscureText: false,
                        keyboardType:  TextInputType.number,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Grade',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                ],
              ),

            ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,

              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                  setState(() {
                    _myData = _recuperarPostagens();
                  });
                    // Respond to button press
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // Background color
                  ),
                  icon: Icon(Icons.search, size: 18),
                  label: Text("Buscar"),

                )
              ],
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child:
                new  FutureBuilder<List<Post>>(
                  future:  _myData,
                  builder:  (context, snapshot){

                    switch( snapshot.connectionState ){
                      case ConnectionState.none :
                      case ConnectionState.waiting :
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                        break;
                      case ConnectionState.active :
                      case ConnectionState.done :
                        if( snapshot.hasError ){
                          print("lista: Erro ao carregar $snapshot");
                        }else {

                          print("lista: carregou!! ");
                          return ListView.separated(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index){

                                List<Post> lista = snapshot.data ?? <Post>[];
                                Post post = lista[index];

                                return ListTile(

                                  title: new Center(child: new Text("Empresa: " + post.cod_empresa.toString(),)),
                                  subtitle:  new Center(child: new Text("Carga: " + post.cod_carga.toString(),)),
                                 /* title: Text( "Empresa: " + post.cod_empresa.toString() ),
                                  subtitle: Text("Carga: " + post.cod_carga.toString() + "\n Teste: 001" + "\n teste" + "\n teste"),*/
                                );

                              }, separatorBuilder: (BuildContext context, int index) {

                                return Divider();
                          },
                          );

                        }
                        break;
                    }
                    return Container();
                  },
                ),
              ),
            ),

                /**/



    ]),
    );
  }
}




     /* FutureBuilder<List<Post>>(
        future: _recuperarPostagens(),
        builder:  (context, snapshot){

          switch( snapshot.connectionState ){
            case ConnectionState.none :
            case ConnectionState.waiting :
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active :
            case ConnectionState.done :
              if( snapshot.hasError ){
                print("lista: Erro ao carregar $snapshot");
              }else {

                print("lista: carregou!! ");
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index){

                      List<Post> lista = snapshot.data ?? <Post>[];
                      Post post = lista[index];

                      return ListTile(
                        title: Text( "Empresa: " + post.cod_empresa.toString() ),
                        subtitle: Text("Carga: " + post.cod_carga.toString() ),
                      );

                    }
                );

              }
              break;
          }
      return Container();
        },
      ),
    );
  }
}*/
