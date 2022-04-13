import 'dart:ui';

import 'package:atcsearch/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:atcsearch/Quality2/ConsultaCostumer.dart';

class NicotineAndSugar extends StatefulWidget {
  String? valor, valor1, valor2;

  NicotineAndSugar({this.valor, this.valor1, this.valor2});

  @override
  _NicotineAndSugarState createState() => _NicotineAndSugarState();
}

class _NicotineAndSugarState extends State<NicotineAndSugar> {
  late Future<List<Post>> _myData = _recuperarPostagens(0);
  late TextEditingController safra;
  late TextEditingController grade;

  @override
  void initState() {
    super.initState();
    safra = TextEditingController();
    grade = TextEditingController();

    setState(() {
      if (widget.valor != null) {
        grade.text = "${widget.valor}";
        safra.text = "${widget.valor2}";

        //Consultar banco de dados

      } else {
        widget.valor1 = "Clique duas vezes na caixa de texto";
      }
    });
  }

  Future<List<Post>> _recuperarPostagens(int n) async {
    String url = "http://192.168.200.11/read.php?tipo=consultar&safra=" +
        safra.text +
        "&grade=" +
        grade.text;
    http.Response response;
    response = await http.get(Uri.parse(url));
    var dadosJson = json.decode(response.body);
    List<Post> postagens = <Post>[];
    for (var post in dadosJson) {
      // print("post: " + post["cod_carga"] );
      Post p = Post(
          post["data_processo"],
          post["box_inicial"],
          post["box_final"],
          post["umidade"],
          post["peso_amostra"],
          post["leitura_nicotina"],
          post["leitura_acucar"],
          post["result_nicotina"],
          post["result_acucar"]);
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
      body: Column(mainAxisSize: MainAxisSize.max, children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 16, 0),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Grade: ${widget.valor1}",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ]),
        ),
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
                  child: GestureDetector(
                    child: TextFormField(
                      controller: grade,
                      obscureText: false,
                      keyboardType: TextInputType.number,
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
                      cursorColor: Colors.black,
                    ),
                    onDoubleTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ConsultaCostumer(),
                      ),
                    ),
                  ),
                ),
              ),
              /*  Expanded(

                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 110, 0),
                     child: GestureDetector(
                       child: Container(
                         //color: Colors.yellow,
                         width: 80.0,
                         height: 40.0,
                         child: Icon(Icons.search, size: 30,),
                       ),
                       onTap: () {

                         Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(
                             builder: (_) => ConsultaCostumer(),
                           ),
                         );

                       },
                     ),



                      /*IconButton(
                        iconSize: 30,
                        icon: Icon(Icons.search),
                        onPressed: (){ Navigator.pushReplacement(
                                                             context,
                                                 MaterialPageRoute(
                                                   builder: (_) => ConsultaCostumer(),
                                               ),
                                                   );
                                               }
                   ),*/
                  ),
                  ),*/
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                  child: GestureDetector(
                    child: TextFormField(
                      controller: safra,
                      obscureText: false,
                      keyboardType: TextInputType.number,
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
                      cursorColor: Colors.black,
                    ),
                    onDoubleTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ConsultaCostumer(),
                      ),
                    ),
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
                  _myData = _recuperarPostagens(0);
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            //https://stackoverflow.com/questions/55299332/make-datatable-scroll-bidirectional-in-flutter
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(children: [
                FutureBuilder<List<Post>>(
                  initialData: const <Post>[],
                  future: _myData,
                  builder: (context, snapshot)

                      /*Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child:
                new  FutureBuilder<List<Post>>(
                  future:  _myData,
                  builder:  (context, snapshot)*/
                      {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                        break;
                      case ConnectionState.active:
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          print("lista: Erro ao carregar $snapshot");
                        } else {
                          print("lista: carregou!! ");

                          return DataTable(
                            columns: const [
                              // DataColumn(label: Text('COD_GRADE')),
                              DataColumn(label: Text('Date')),
                              DataColumn(label: Text('Case First')),
                              DataColumn(label: Text('Case Last')),
                              // DataColumn(label: Text('BOX_TOTAL')),
                              DataColumn(label: Text('Moisture')),
                              DataColumn(label: Text('Weight')),
                              DataColumn(label: Text('Read Nicotine mg/mL')),
                              DataColumn(label: Text('Read Sugar mg/mL')),
                              DataColumn(label: Text('Result_Nicotine %')),
                              DataColumn(label: Text('Result_Sugar %')),
                              /*  DataColumn(label: Text('DES_GRADE')),
                          DataColumn(label: Text('DES_PESSOA')),
                          DataColumn(label: Text('USER_INSERCAO')),
                          DataColumn(label: Text('DT_HR_INSERCAO')),
                          DataColumn(label: Text('USER_ALTERACAO')),
                          DataColumn(label: Text('DT_HR_INSERCAO')),
                          DataColumn(label: Text('NIC_TIPO_CALCULO')),*/
                            ],
                            rows: List.generate(
                              snapshot.data!.length,
                              (index) {
                                var emp = snapshot.data![index];
                                return DataRow(cells: [
                                  /* DataCell(
                                Text(emp.cod_grade.toString()),
                              ),*/
                                  DataCell(
                                    Text(emp.data_processo.toString()),
                                  ),
                                  DataCell(
                                    Text(emp.box_inicial.toString()),
                                  ),
                                  DataCell(
                                    Text(emp.box_final.toString()),
                                  ),
                                  /* DataCell(
                                Text(emp.box_total.toString()),
                              ),*/

                                  DataCell(
                                    Text(emp.umidade.toString()),
                                  ),
                                  DataCell(
                                    Text(emp.peso_amostra.toString()),
                                  ),
                                  DataCell(
                                    Text(emp.leitura_nicotina.toString()),
                                  ),
                                  DataCell(
                                    Text(emp.leitura_acucar.toString()),
                                  ),
                                  DataCell(
                                    Text(emp.result_nicotina.toString()),
                                  ),
                                  DataCell(
                                    Text(emp.result_acucar.toString()),
                                  ),
                                  /*  DataCell(
                                Text(emp.des_grade.toString()),
                              ),
                              DataCell(
                                Text(emp.des_pessoa.toString()),
                              ),
                              DataCell(
                                Text(emp.user_insercao.toString()),
                              ),
                              DataCell(
                                Text(emp.dt_hr_insercao.toString()),
                              ),

                              DataCell(
                                Text(emp.dt_hr_insercao.toString()),
                              ),
                              DataCell(
                                Text(emp.user_alteracao.toString()),
                              ),
                              DataCell(
                                Text(emp.nic_tipo_calculo.toString()),
                              ),*/
                                ]);
                              },
                            ).toList(),
                          );

                          /* return ListView.separated(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index){

                                List<Post> lista = snapshot.data ?? <Post>[];
                                Post post = lista[index];

                                return ListTile(

                                  title: new Center(child: new Text("COD_GRADE: " + post.cod_grade.toString(),)),
                                  subtitle: Text("BOX_INICIAL: " + post.box_inicial.toString() + "\t BOX_FINAL: " + post.box_final.toString() + "\t"
                                  + "BOX_TOTAL:" + post.box_total.toString() + "\t DATA_PROCESSO: " + post.data_processo.toString() + "\n"),

                                  // subtitle:  new Center(child: new Text("Carga: " + post.cod_carga.toString(),)),
                                 /* title: Text( "Empresa: " + post.cod_empresa.toString() ),
                                  subtitle: Text("Carga: " + post.cod_carga.toString() + "\n Teste: 001" + "\n teste" + "\n teste"),*/
                                );

                              }, separatorBuilder: (BuildContext context, int index) {

                                return Divider();
                          },
                          );*/

                        }
                        break;
                    }
                    return Container();
                  },
                ),
              ]),
            ), //https://flutterhq.com/questions-and-answers/1284/how-to-create-rows-data-in-to-datatable-using-from-json-model-json-api-respons-flutter
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