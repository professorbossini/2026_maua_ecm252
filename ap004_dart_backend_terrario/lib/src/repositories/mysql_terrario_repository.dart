import 'package:mysql_dart/mysql_dart.dart';
import 'package:ap004_dart_backend_terrario/src/repositories/terrario_repository.dart';
import '../models/terrario.dart';


class MySqlTerrarioRepository implements TerrarioRepository{
  final MySQLConnectionPool _pool;

  MySqlTerrarioRepository(this._pool);


  static const String _colunas = 'id, apelido, bioma, umidade_alvo, volume_litros, data_montagem, criado_em, atualizado_em';

  Terrario _mapear(ResultSetRow linha){
    final dados = linha.assoc().cast<String, String?>();
    return Terrario(
      id: int.parse(dados['id']!),
      apelido: dados['apelido']!,
      bioma: Bioma.porNome(dados['nome'])!,
      umidadeAlvo: int.parse(dados['umidade_alvo']!),
      volumeLitros: double.parse(dados['volume_litros']!),
      dataMontagem: DateTime.parse(dados['data_montagem']!),
      criadoEm: DateTime.tryParse(dados['criado_em'] ?? ''),
      atualizadoEm: DateTime.tryParse(dados['atualizado_em'] ?? '')
    );
  }
}