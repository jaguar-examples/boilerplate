library api;

import 'dart:async';
import 'package:jaguar/jaguar.dart';

@Api(path: '/api')
class ExampleApi {
  // A simple get route
  @Get(path: '/version')
  double version(_) => 0.1;

  // A simple post route
  @Post(path: '/add')
  int add(Context ctx) => ctx.query.getInt('a') + ctx.query.getInt('b');

  // A simple get JSON route
  @GetJson(path: '/info')
  Map info(_) => {
        'server': 'Jaguar',
        'motto': 'Simple. Fast. Flexible. Extensible.',
      };

  // A simple post JSON route
  @PostJson(path: '/sub')
  Future<Map> sub(Context ctx) async {
    Map body = await ctx.req.bodyAsJsonMap();
    return {'result': body['a'] - body['b']};
  }
}
