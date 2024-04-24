import 'package:flutter/material.dart';
//import 'package:rive_flutter/bottom_nav_with_animated_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF437745)),
        scaffoldBackgroundColor: const Color(0xFF437745), //Colors.white10,
      ),
      //home: const MyHomePage(title: 'Início'),
      home: Scaffold(
        //appBar: AppBar(
        //title: const Text('Início'),
        //  ),
        body: LogInPage(),
      ),
    );
  }
}

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/taylorSwift.png'),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email',
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Senha',
              fillColor: Colors.white,
              filled: true,
            ),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFFDEFFDF)),
            minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(color: Color(0xFF204522)),
            ),
          ),
          child: const Text(
            'Login',
            style: TextStyle(
                color: Color(0xFF204522),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            // Ação quando o botão é pressionado
          },
        ),
        const SizedBox(height: 10.00),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  // Navigate to the password reset screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PasswordResetScreen()),
                  );
                },
                child: const Text(
                  'Esqueci minha senha',
                  style: TextStyle(
                    color: Colors.transparent,
                    shadows: [
                      Shadow(color: Color(0xFFDEFFDF), offset: Offset(0, -3))
                    ],
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFDEFFDF),
                    decorationThickness: 2,
                  ),
                )),
            TextButton(
              onPressed: () {
                // Navigate to the password reset screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstAccessScreen()),
                );
              },
              child: const Text(
                'Primeiro acesso',
                style: TextStyle(
                  color: Colors.transparent,
                  shadows: [
                    Shadow(color: Color(0xFFDEFFDF), offset: Offset(0, -3))
                  ],
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFFDEFFDF),
                  decorationThickness: 2,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class PasswordResetScreen extends StatelessWidget {
  const PasswordResetScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xFFDEFFDF),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    const Size(200, 50),
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(color: Color(0xFF204522)),
                  ),
                ),
                onPressed: () => _dialogBuilder(context),
                child: const Text(
                  'Enviar',
                  style: TextStyle(
                      color: Color(0xFF204522),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            child: IconButton(
              onPressed: () {
                // Navigate to the password reset screen
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => LogInPage()),
                );
              },
              icon: const Icon(Icons.arrow_back, color: Color(0xFFDEFFDF)),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Email de recuperação de senha enviado.'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class FirstAccessScreen extends StatelessWidget {
  const FirstAccessScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Nome',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Data de nascimento',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Senha',
                  fillColor: Colors.white,
                  filled: true,
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Confirmar enha',
                  fillColor: Colors.white,
                  filled: true,
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFDEFFDF)),
                minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  const TextStyle(color: Color(0xFF204522)),
                ),
              ),
              child: const Text(
                'Criar conta',
                style: TextStyle(
                    color: Color(0xFF204522),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                // Ação quando o botão é pressionado
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FirstAccessInfoScreen()),
                );
              },
            ),
          ]),
      Positioned(
        top: 0,
        left: 0,
        child: IconButton(
          onPressed: () {
            // Navigate to the password reset screen
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => LogInPage()),
            );
          },
          icon: const Icon(Icons.arrow_back, color: Color(0xFFDEFFDF)),
        ),
      ),
    ]));
  }
}

class FirstAccessInfoScreen extends StatelessWidget {
  const FirstAccessInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Stack(children: <Widget>[
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Agora vamos falar um pouquinho sobre seus gastos',
                style: TextStyle(
                    color: Color(0xFFDEFFDF),
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ])
    ]));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have eaten the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
