
import 'dart:ui';

import 'package:atcsearch/Home.dart';
import 'package:atcsearch/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'ListViewQuality.dart';

class ConsultaCostumer extends StatefulWidget {
  @override
  _ConsultaCostumerState createState() => _ConsultaCostumerState();

}

class _ConsultaCostumerState extends State<ConsultaCostumer> {
  late Future<List<Post>>  _myData = _recuperarPostagens();
  late TextEditingController customer;
  late TextEditingController grade;


  @override
  void initState() {
    super.initState();
    grade = TextEditingController();

  }
  Future<List<Post>> _recuperarPostagens() async {

    String url = "http://192.168.200.11/read.php?tipo=consultar&grade=" + grade.text;
    http.Response response;
    response = await http.get(Uri.parse(url));
    var dadosJson = json.decode(response.body);
    List<Post> postagens = <Post>[];
    for (var post in dadosJson) {
      // print("post: " + post["cod_carga"] );
      Post p = Post(post["cod_grade"], post["box_inicial"], post["box_final"], post["box_total"], post["data_processo"],
          post["umidade"], post["peso_amostra"], post["leitura_nicotina"], post["leitura_acucar"], post["result_nicotina"],
          post["result_acucar"], post["des_grade"], post["des_pessoa"], post["user_insercao"], post["dt_hr_insercao"],
          post["user_insercao"], post["dt_hr_alteracao"], post["nic_tipo_calculo"]);
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
              padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(60, 0, 60, 0),
                      child: TextFormField(
                        controller: grade,
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

                              onTap: () {

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) => ListViewQuality(valor: post.cod_grade.toString(),)
                                )
                                );

                              },

                                title: new Center(child: new Text("Empresa: " + post.cod_grade.toString(),)),
                                subtitle:  new Center(child: new Text("Carga: " + post.box_inicial.toString(),)),
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
