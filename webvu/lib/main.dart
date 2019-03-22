import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "WebView jest super!"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String addr = 'http://greblus.net';
  WebViewController wvcontr;
  final tecontr = TextEditingController();

  wvCreated(v) {
    wvcontr = v;
    tecontr.text = addr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5),
            child: TextField(
              controller: tecontr,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.lightBlueAccent[200],
              ),
              onSubmitted: (v) => setState(() {
                    if (v.startsWith("http://") || v.startsWith("https://")) {
                      addr = v;
                    } else {
                      addr = "http://" + v;
                      tecontr.text = addr;
                      wvcontr.loadUrl(addr);
                    }
                  }),
            ),
          ),
          Expanded(
            child: WebView(
              initialUrl: addr,
              onWebViewCreated: wvCreated,
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => setState(() {
              wvcontr.reload();
            }),
      ),
    );
  }
}
