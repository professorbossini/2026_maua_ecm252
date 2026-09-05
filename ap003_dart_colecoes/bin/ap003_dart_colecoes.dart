import 'package:ap003_dart_colecoes/ap003_dart_colecoes.dart' as ap003_dart_colecoes;

void main(List<String> arguments) {
  //mapas
  var pessoa = <String, dynamic>{
    'nome': 'Ana',
    'idade': 19
  };
  //keys
  //values
  //entries
  for(String key in pessoa.keys){
    print(key);
    print(pessoa[key]);
  }
  for(dynamic value in pessoa.values){
    print(value);
  }

  for(final entry in pessoa.entries){
    print(entry);
    print(entry.key);
    print(entry.value);
    //exibir o valor sem falar value
    print(pessoa[entry.key]);
  }
  //casting
  // var nome = pessoa['nome'] as String;
  // print(nome.toUpperCase());
  // // print(pessoa.nome);
  // print(pessoa['nome']);
  // var a = {
  //   1: 'b',
  //   1: 'a',
  // };
  // print(a);
  // var pessoa = {
  //   'nome': 'Ana',
  //   'idade': 18,
  //   'altura': 1.8
  // };

  // var lembretes = {
  //   1: 'comprar café'
  // };
  // var A = {1, 2};
  // var B = {true};
  // print(A.union(B));
  // var portugues  = {'Brasil', 'Portugal'};
  // var europa = {'Alemanha', 'Portugal', 'Espanha'};
//   - Todos os países em que se fala português e todos os países da Europa.
//Brasil, Portugal, Alemanha, Espanha
// - Todos os países em que se fala português e que são europeus.
//Portugal
// - Todos os países em que se fala português e que não são europeus.
//Brasil
// - Todos os países exceto aqueles em que se fala português e que são europeus
// (simultaneamente).
//Brasil, Alemanha, Espanhaj
  // print(portugues.union(europa).difference(portugues.intersection(europa)));
  //união, intersecção, diferença
  // var A = {1, 2, 3, 4, 5, 6};
  // var B = {1, 3, 7};
  // print(A.union(B));
  // print(B.union(A));
  // print(A.intersection(B));
  // print(B.intersection(A));
  // print(A.difference(B));
  // print(B.difference(A));
  //set: conjunto: sem elementos duplicados e sem ordem
  // final numeros = {1, 2};
  // //for each
  // for(const numero in numeros){
  //   print(numero);
  // }
  //{}: set e map
  // var a = <bool?, int?> {};
  // var nomes = {'Ana', 'João'};
  // var paises = {'Brasil', 'Brasil'};
  // print(paises);
  // var a = {};
  //tuplas
  // (String, int, bool) tupla = ('Ana', 18, true);
  // print(tupla.$1);
  // print(tupla.$2);
  // print(tupla.$3);
  // print(tupla.runtimeType);
  // var l5 = [1, 1.1, true, "A"];
  // var l6 = [];
  // Object a = 1;
  // // a.falar();
  // dynamic b = 1;
  // b.falar();
  // var l4 = [null];
  //type annotation
  // var l3 = <int> [];
  //sound null safety
  // List<String?>? l2 = ["A"];
  // l2.add(null);
  // l2 = null;
  // String? a = null;
  // l2.add(a);
  // var l1 = [];
  // const letras = ['A', 'B'];
  // letras[0] = 'C';
  // letras.add('J');
  // print(letras);
  // letras = ['X'];
  // var letras = ['A', 'B'];
  // print(letras[0]);
  // print(letras[-1]);
  //print(arguments);
  //ap003_dart_colecoes.testes();
}
