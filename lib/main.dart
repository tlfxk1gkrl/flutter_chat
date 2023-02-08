import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _focusNode = FocusNode();

  //cnt message
  int _counter = 0;
  //set message controller
  final _message = TextEditingController();
  //messages
  List<String> _messages = [];

  //onPress Button
  void _setMessages(){
    setState(() {
      _counter++;
      _messages.add(_message.value.text);
      _message.clear();
    });
    _focusNode.unfocus();
    _focusNode.requestFocus();
  }

  //onSubmitted [pressed Enter]
  void _setMessagesSubmit(String str){
    setState(() {
      _counter++;
      _messages.add(_message.value.text);
      _message.clear();
    });
    _focusNode.unfocus();
    _focusNode.requestFocus();
  }

  Widget _textWidget(int i) {
    return Text(
      _messages[i],
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: SizedBox(
                child: SingleChildScrollView(
                  reverse: true,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        for (int i = 0; i < _counter; i++) _textWidget(i),
                      ],
                    ),
                  ),

                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextField(
                controller: _message,
                onSubmitted: _setMessagesSubmit,
                decoration: InputDecoration(
                  hintText: "Enter text here",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _setMessages,
                  ),
                ),
                focusNode: _focusNode,
              ),
            ),
          ],
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
