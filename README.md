# boilerplate for Jaguar projects

This project contains a **simple example** shows how to add routes to Jaguar using `Controller` classes.

The repository can be found at: [https://github.com/jaguar-examples/boilerplate](https://github.com/jaguar-examples/boilerplate).
One would typically want to clone it and edit it in IntelliJ IDE.

# Server description

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

# Client description

Contains code to access the example server.

```dart
Future<Null> execVersion() async {
  String url = "http://$kHostname:$kPort/api/version";
  http.Response resp = await _client.get(url);
  print(resp.body);
}

Future<Null> execAdd() async {
  http.Response resp = await _client.post(
      new Uri.http('$kHostname:$kPort', '/api/add', {'a': '5', 'b': '20'}));
  print(resp.body);
}

Future<Null> execInfo() async {
  String url = "http://$kHostname:$kPort/api/info";
  http.Response resp = await _client.get(url);
  print(resp.body);
}

Future<Null> execSubtract() async {
  String url = "http://$kHostname:$kPort/api/sub";
  http.Response resp = await _client.post(url, body: '{"a": 10, "b": 5}');
  print(resp.body);
}

main() async {
  await execVersion();
  await execAdd();
  await execInfo();
  await execSubtract();
}
```