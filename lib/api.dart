library api;

import 'dart:async';

import 'package:jaguar/jaguar.dart';
import 'package:jaguar/interceptors.dart';

@RouteGroup(path: '/info')
class ExampleRouteGroup {
  @Get()
  @WrapEncodeToJson()
  Map info() => {
        'name': 'jaguar',
        'motto': 'Speed. Simplicity. Extensiblity.',
        'degree of awesomeness': 'infinity!',
      };
}

@Api(path: '/api')
class ExampleApi {
  @Group()
  final ExampleRouteGroup exampleRoutes = new ExampleRouteGroup();

  @Route(path: '/version', methods: const ['GET'])
  num version() => 0.1;
}
