// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';
// import 'dart:io' as io;
// import 'package:shelf/shelf_io.dart' as shelf_io;
// import 'controller/controller_ws.dart';
// import 'controller/server_handler.dart';

// void main() async {
//   var server = await io.HttpServer.bind(io.InternetAddress.anyIPv4, 8080);
//   print('Servidor iniciado na porta ${server.port}.');

//   List<ClientWS> connections = [];

//   await for (io.HttpRequest request in server) {
//     if (io.WebSocketTransformer.isUpgradeRequest(request)) {
//       io.WebSocket webSocket = await io.WebSocketTransformer.upgrade(request);

//       webSocket.listen((data) async {
//         //-----
//         print("Conexões $connections");
//         var json = await jsonDecode(data);
//         print("1");
//         var idSave = json["idSave"] ?? "";
//         var idSend = json["idSend"] ?? "";
//         var newCliente = ClientWS(id: idSave, webSocket: webSocket);
//         // Adiciona a nova conexão à lista
//         if (idSave != "") {
//           connections.add(newCliente);
//         }
//         print("Conexões atualizadas: $connections");
//         //-------

//         // Envia a mensagem para todos
//         for (var connection in connections) {
//           connection.webSocket.add('Resposta: $data');
//         }
//       });
//     } else {
//       request.response.statusCode = io.HttpStatus.forbidden;
//       request.response.reasonPhrase = 'WebSocket connections only';
//       request.response.close();
//     }
//   }
// }
