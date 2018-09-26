import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() => runApp(WSApp());

class WSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WSPage(
        webSocketChannel: IOWebSocketChannel.connect('ws://echo.websocket.org'),
      ),
    );
  }
}

class WSPage extends StatefulWidget {
  final String title = 'Web socket demo';
  final WebSocketChannel webSocketChannel;

  WSPage({Key key, @required this.webSocketChannel}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WSState();
  }
}

class _WSState extends State<WSPage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Send a message'),
              ),
            ),
            StreamBuilder(
              stream: widget.webSocketChannel.stream,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _sendMsg();
        },
        child: Icon(Icons.send),
      ),
    );
  }

  void _sendMsg() {
    if (_controller.text.isNotEmpty) {
      widget.webSocketChannel.sink.add(_controller.text);
      print('send ' + _controller.text);
    }
  }

  @override
  void dispose() {
    widget.webSocketChannel.sink.close();
    super.dispose();

  }
}
