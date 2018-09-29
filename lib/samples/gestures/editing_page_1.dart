import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

/// editing page

void main() {
  runApp(MaterialApp(
    home: EditingPage(),
  ));
}

class EditingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppBar appBar = new AppBar(
      title: Text('Editing'),
    );
    double _statusBarHeight = MediaQuery.of(context).padding.top;
    print('EditingPage statusBarHeight $_statusBarHeight');
    print('EditingPage ${MediaQuery.of(context).padding}');
    return Scaffold(
      appBar: appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            flex: 9,
            child: Container(
              child: EditingField(
                appBarHeight: appBar.preferredSize.height,
                statusBarHeight: _statusBarHeight,
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}

class EditingField extends StatefulWidget {
  final double appBarHeight;
  final double statusBarHeight;

  EditingField({Key key, this.appBarHeight, this.statusBarHeight})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return EditingState();
  }
}

class EditingState extends State<EditingField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          new PhotoView(
            imageProvider: AssetImage("assets/images/bg2.jpeg"),
            minScale: PhotoViewComputedScale.contained * 0.72,
            maxScale: 4.0,
          ),
          new DraggableText(
            text: 'This is Flutter',
            initialOffset: new Offset(20.0, widget.appBarHeight * 2.0 + 100.0),
            appBarHeight: widget.appBarHeight,
            statusBarHeight: widget.statusBarHeight,
          ),
        ],
      ),
    );
  }
}

class DraggableText extends StatefulWidget {
  final Offset initialOffset;
  final String text;
  final double appBarHeight;
  final double statusBarHeight;

  DraggableText(
      {this.text, this.initialOffset, this.appBarHeight, this.statusBarHeight});

  @override
  _DraggableTextState createState() => new _DraggableTextState();
}

class _DraggableTextState extends State<DraggableText> {
  Offset position = new Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initialOffset;
  }

  @override
  Widget build(BuildContext context) {
    final double topGap = widget.appBarHeight + widget.statusBarHeight;
    final double bottomGap = MediaQuery.of(context).size.height * 0.9 - topGap;
    print('topGap $topGap, bottomGap $bottomGap');
    final item = GestureDetector(
      onTap: () {
        print('onTap');
      },
      child: new Text(
        widget.text,
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );
    final draggable = new Draggable(
        data: widget.text,
        feedback: new Material(
          // Material 防止拖动时有两条黄色横线
          child: item,
          type: MaterialType.transparency,
        ),
        child: item,
        childWhenDragging: new Opacity(opacity: 0.0, child: item),
        onDraggableCanceled: (velocity, offset) {
          print('_DragBoxState.build -> offset $offset');
          setState(() => position = offset);
        });
    double dragDy = position.dy - topGap;
    if (dragDy < 0) {
      dragDy = 0.0;
    } else if (dragDy > bottomGap) {
      dragDy = bottomGap;
    }
    print('dragDy $dragDy');
    return new Positioned(left: position.dx, top: dragDy, child: draggable);
  }
}
