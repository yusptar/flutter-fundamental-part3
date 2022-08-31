import 'package:flutter/material.dart';
import 'basic_widgets/image_widget.dart';
import 'basic_widgets/forms.dart';
import 'basic_widgets/input_fields.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final TextEditingController _controller = TextEditingController.fromValue(
      const TextEditingValue(text: "isi angka saja"));

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        child: GestureDetector(
            onTap: _incrementCounter,
            // onDoubleTap : _incrementCounter, // klik 2 kali
            // onLongPress : _incrementCounter, // klik tahan
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // const MyImageWidget(),
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                VerificationCodeFormField(controller: _controller),
                Builder(
                  builder: (BuildContext subContext) => ElevatedButton(
                    onPressed: () {
                      final valid = Form.of(subContext)?.validate();
                      if (kDebugMode) {
                        print("valid: $valid");
                      }
                    },
                    child: const Text("validate"),
                  ),
                )
                // const FormContoh(),
              ],
            )),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.favorite),
      ),
    );
  }
}
