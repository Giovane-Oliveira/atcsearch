
import 'dart:ui';

import 'package:atcsearch/Quality2/Grade.dart';
import 'package:atcsearch/Quality2/NicotineAndSugar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class ConsultaCostumer extends StatefulWidget {
  @override
  _ConsultaCostumerState createState() => _ConsultaCostumerState();

}

class _ConsultaCostumerState extends State<ConsultaCostumer> {
  late Future<List<Grade>>  _myData = _recuperarPostagens();
  late TextEditingController safra;
  late TextEditingController grade;


  @override
  void initState() {
    super.initState();
    grade = TextEditingController();
    safra = TextEditingController();

  }
  Future<List<Grade>> _recuperarPostagens() async {
    String url =  "http://192.168.200.11/read.php?tipo=grade";

    if(!grade.text.isEmpty && !safra.text.isEmpty){

     url = "http://192.168.200.11/read.php?tipo=grade&grade=" + grade.text + "&safra=" + safra.text;

    }else if(!grade.text.isEmpty){

      url = "http://192.168.200.11/read.php?tipo=grade&grade=" + grade.text;

    }else if(!safra.text.isEmpty){

      url = "http://192.168.200.11/read.php?tipo=safra&safra=" + safra.text;

    }


    http.Response response;
    response = await http.get(Uri.parse(url));
    var dadosJson = json.decode(response.body);
    List<Grade> postagens = <Grade>[];
    for (var post in dadosJson) {
      // print("post: " + post["cod_carga"] );
      Grade p = Grade(post["crop"],post["cod_grade"], post["des_grade"], post["cod_cliente"], post["sample"]);
      postagens.add(p);
    }
    //print( postagens.toString() );

    return postagens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Customer"),
        backgroundColor: Colors.black,
      ),
      body:

      Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(2, 0, 5, 0),
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

                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(2, 0, 5, 0),
                      child: TextFormField(
                        controller: safra,
                        obscureText: false,
                        keyboardType:  TextInputType.number,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Safra',
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
                FutureBuilder<List<Grade>>(
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

                              List<Grade> lista = snapshot.data ?? <Grade>[];
                              Grade post = lista[index];

                              return ListTile(

                              onTap: () {

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) => NicotineAndSugar(valor: post.cod_grade.toString(), valor1: post.des_grade, valor2: post.crop.toString(),)
                                )
                                );

                              },

                                title: new Center(child: new Text("COD_GRADE: " + post.cod_grade.toString(),)),
                                subtitle:  new Center(child: new Text("GRADE: " + post.des_grade +"\n SAFRA: " + post.crop.toString() + "\n COD_CLIENTE: "
                                  + post.cod_cliente.toString() + "\n SAMPLE: " + post.sample, textAlign: TextAlign.center)),
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