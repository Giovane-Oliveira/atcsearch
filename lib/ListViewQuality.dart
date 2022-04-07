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


  Future<List<Post>> _recuperarPostagens() async {

    String url = "http://192.168.200.11/read.php?tipo=consultar";
    http.Response response;
    response = await http.get(Uri.parse(url));
    var dadosJson = json.decode( response.body);
    List<Post> postagens = <Post>[];
    for( var post in dadosJson ){

     // print("post: " + post["cod_carga"] );
      Post p = Post(post["cod_carga"], post["cod_empresa"]);
      postagens.add( p );

    }
    //print( postagens.toString() );

    return postagens;


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ATC Search"),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Post>>(
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
}
