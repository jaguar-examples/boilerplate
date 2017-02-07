import 'package:jaguar/jaguar.dart' as jaguar;
import 'package:jaguar_reflect/jaguar_reflect.dart';

import 'package:boilerplate/api.dart';

main(List<String> args) async {
  final ea = new JaguarReflected(new ExampleApi());

  jaguar.Configuration configuration =
      new jaguar.Configuration(multiThread: true);
  configuration.addApi(ea);

  await jaguar.serve(configuration);
}
