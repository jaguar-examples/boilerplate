import 'package:jaguar/jaguar.dart';
import 'package:jaguar_reflect/jaguar_reflect.dart';

import 'package:boilerplate/api.dart';

main(List<String> args) async {
  final server = new Jaguar(port: 10000, multiThread: true);
  server.addApi(reflect(new ExampleApi()));
  await server.serve();
}
