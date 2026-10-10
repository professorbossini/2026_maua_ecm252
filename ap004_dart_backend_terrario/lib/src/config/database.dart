import 'package:mysql_dart/mysql_client.dart';
import 'app_config.dart';

MySQLConnectionPool criarPool(AppConfig config){
  return MySQLConnectionPool(
    host: config.dbHost,
    port: config.dbPort,
    userName: config.dbUser,
    password: config.dbPassword,
    databaseName: config.dbName,
    maxConnections: config.dbPoolSize,
    secure: false,
    allowPublicKeyRetrieval: true
  );
}

Future<void> aguardarBanco(MySQLConnectionPool pool, { 
    int tentativas = 30, 
    Duration intervalo = const Duration(seconds: 2)}) async{
      //SELECT 1
      for(var tentativa = 1; tentativa <= tentativas; tentativa++){
        try{
          await pool.execute('SELECT 1');
          return;
        }
        catch(_){
          if(tentativa == tentativas) rethrow;
          await Future<void>.delayed(intervalo);
        }
      }
}
