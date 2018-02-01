library jaguar.boilerplate.client;

import 'dart:async';
import 'package:http/http.dart' as http;

const String kHostname = 'localhost';

const int kPort = 10000;

final http.Client _client = new http.Client();

Future<Null> printHttpClientResponse(http.Response resp) async {
  print('=========================');
  print("body:");
  print(resp.body);
  print('=========================');
}

Future<Null> execVersion() async {
  String url = "http://$kHostname:$kPort/api/version";
  http.Response resp = await _client.get(url);
  printHttpClientResponse(resp);
}

Future<Null> execAdd() async {
  http.Response resp = await _client.post(
      new Uri.http('$kHostname:$kPort', '/api/add', {'a': '5', 'b': '20'}));
  await printHttpClientResponse(resp);
}

Future<Null> execInfo() async {
  String url = "http://$kHostname:$kPort/api/info";
  http.Response resp = await _client.get(url);
  printHttpClientResponse(resp);
}

Future<Null> execSubtract() async {
  String url = "http://$kHostname:$kPort/api/sub";
  http.Response resp = await _client.post(url, body: '{"a": 10, "b": 5}');
  await printHttpClientResponse(resp);
}

main() async {
  await execVersion();
  await execAdd();
  await execInfo();
  await execSubtract();
}
