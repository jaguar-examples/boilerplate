import 'package:jaguar/jaguar.dart';
import 'package:jaguar_reflect/jaguar_reflect.dart';

import 'package:boilerplate/api.dart';

main(List<String> args) async {
  final ea = new JaguarReflected(new ExampleApi());

  Jaguar configuration = new Jaguar(multiThread: true);
  configuration.addApi(ea);

  await configuration.serve();
}
