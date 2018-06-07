# boilerplate_reflect

Example shows how to add routes to Jaguar using `Controller` classes.

It exposes four routes for demonstration purposes:

1. A simple GET route
2. A simple POST route that uses query parameters
3. A simple JSON GET route
4. A simple JSON POST route that has JSON body

```dart
@Controller(path: '/api')
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
    Map body = await ctx.bodyAsJsonMap();
    return {'result': body['a'] - body['b']};
  }
}
```