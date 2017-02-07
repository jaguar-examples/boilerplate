library jaguar.boilerplate.client;

import 'dart:async';
import 'dart:io';
import 'dart:convert';

const String kHostname = 'localhost';

const int kPort = 8080;

final HttpClient _client = new HttpClient();

Future<Null> printHttpClientResponse(HttpClientResponse resp) async {
  StringBuffer contents = new StringBuffer();
  await for (String data in resp.transform(UTF8.decoder)) {
    contents.write(data);
  }

  print('=========================');
  print("body:");
  print(contents.toString());
  print("statusCode:");
  print(resp.statusCode);
  print("headers:");
  print(resp.headers);
  print("cookies:");
  print(resp.cookies);
  print('=========================');
}

Future<Null> execVersion() async {
  HttpClientRequest req = await _client.get(kHostname, kPort, '/api/version');
  HttpClientResponse resp = await req.close();

  printHttpClientResponse(resp);
}

Future<Null> execInfo() async {
  HttpClientRequest req = await _client.get(kHostname, kPort, '/api/info');
  HttpClientResponse resp = await req.close();

  printHttpClientResponse(resp);
}

main() async {
  await execVersion();
  await execInfo();
}
