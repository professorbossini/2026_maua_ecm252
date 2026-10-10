import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class App extends StatefulWidget{
  @override
  State<App> createState() {
    return AppState();
  }
}


class AppState extends State<App>{
  int numeroImagens = 0;

  //requisição http
  void obterImagem(){
    //construção do objeto url
    //parâmetros: host pexels, recurso, mapa com parâmetros query (page, per_page e people)
    var url = Uri.https(
      'api.pexels.com',
      'v1/search',
      {'query': 'people', 'per_page': '1', 'page': '1'}
    );  // apenas uma imagem por página
    //requisição
    //parâmetros: nome do método e url
    var req = http.Request('get',url);
    //adiciona chave de API pexels
    req.headers.addAll({'Authorization': 'a91Qyfh2Ud1rdeOGKV8aTR5Aj9UmRvdma6EdyhC9EfKStoAyt7rmDuhV'});
    
    //envia a requisição
    req.send().then((result){
      if(result.statusCode == 200){
        http.Response.fromStream(result).then((response){
          print(response.body);
        }) ; 
      }
      else{
        print('Falhou...');
      }
    }); 
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Minhas imagens'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          obterImagem();
        }
      ),
      body: Text('$numeroImagens'), 
    )
  );
  }  
}