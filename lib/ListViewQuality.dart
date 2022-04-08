import 'package:atcsearch/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ListViewQuality extends StatefulWidget {
  @override
  _ListViewQualityState createState() => _ListViewQualityState();

}

class _ListViewQualityState extends State<ListViewQuality> {

  late TextEditingController customer;
  late TextEditingController grade;

  Future<List<Post>> _recuperarPostagens() async {

    String url = "http://192.168.200.11/read.php?tipo=consultar";
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
  void initState() {
    super.initState();
    customer = TextEditingController();
    grade = TextEditingController();

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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: TextFormField(
                        controller: customer,
                        obscureText: false,
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: TextFormField(
                        controller: grade,
                        obscureText: false,
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
                FutureBuilder<List<Post>>(
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
