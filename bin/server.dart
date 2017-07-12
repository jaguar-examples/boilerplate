import 'package:jaguar/jaguar.dart';

import 'package:boilerplate/api.dart';

main(List<String> args) async {
  final server = new Jaguar(multiThread: true);
  server.addApiReflected(new ExampleApi());

  await server.serve();
}
