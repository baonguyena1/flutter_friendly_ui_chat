import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(FriendlyChatApp());

final ThemeData kiOSTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light);

final ThemeData kDefaultTheme = ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

class FriendlyChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Friendly Chat',
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? kiOSTheme
          : kDefaultTheme,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Friendly App'),
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: SafeArea(
          child: Container(
              child: Column(
                children: <Widget>[
                  Flexible(
                    child: ListView.builder(
                      padding: EdgeInsets.all(8.0),
                      itemBuilder: (context, index) => _messages[index],
                      itemCount: _messages.length,
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                    ),
                    child: _buildTextComponent(),
                  ),
                ],
              ),
              decoration: Theme.of(context).platform == TargetPlatform.iOS
                  ? BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey[200])))
                  : null),
        ));
  }

  // @override
  // dispose() {
  //   for (ChatMessage message in _messages) {
  //     message.animationController.dispose();
  //   }
  //   super.dispose();
  // }

  Widget _buildTextComponent() {
    return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              constraints: BoxConstraints(maxHeight: 300),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      onChanged: (String text) {
                        setState(() {
                          _isComposing = text.length > 0;
                        });
                      },
                      onSubmitted: _handleSubmitted,
                      decoration:
                          InputDecoration.collapsed(hintText: 'Send a message'),
                      maxLines: null,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    child: Theme.of(context).platform == TargetPlatform.iOS
                        ? CupertinoButton(
                            child: Text('Send'),
                            onPressed: _isComposing
                                ? () => _handleSubmitted(_textController.text)
                                : null,
                          )
                        : IconButton(
                            icon: Icon(Icons.send),
                            onPressed: _isComposing
                                ? () => _handleSubmitted(_textController.text)
                                : null,
                          ),
                  )
                ],
              ),
            )));
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    final isMe = _messages.length % 2 == 0;
    ChatMessage message = ChatMessage(
        text,
        // AnimationController(duration: Duration(milliseconds: 700), vsync: this),
        isMe);
    setState(() {
      _messages.insert(_messages.length, message);
    });
    // message.animationController.forward();
  }
}

class ChatMessage extends StatelessWidget {
  static const String _name = 'Bao';
  final String text;
  // final AnimationController animationController;
  final bool isSender;

  ChatMessage(this.text, this.isSender);

  @override
  Widget build(BuildContext context) {
    final align = isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final textAlign = isSender ? TextAlign.right : TextAlign.start;
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          isSender
              ? Container()
              : CircleAvatar(
                  child: Text(_name[0]),
                ),
          SizedBox(
            width: isSender ? 0.0 : 8.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: align,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Column(
                    crossAxisAlignment: align,
                    children: <Widget>[
                      Text(
                        _name,
                        style: Theme.of(context).textTheme.subhead,
                        textAlign: textAlign,
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        text,
                        maxLines: null,
                        textAlign: textAlign,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: isSender ? 8.0 : 0.0,
          ),
          isSender
              ? CircleAvatar(
                  child: Text(_name[0]),
                )
              : Container()
        ],
      ),
    );

    // return SizeTransition(
    //   sizeFactor:
    //       CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    //   axisAlignment: 0.0,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisSize: MainAxisSize.min,
    //     children: <Widget>[
    //       Container(
    //         padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
    //         child: Row(
    //           children: <Widget>[
    //             Container(
    //               child: isSender == false
    //               ? CircleAvatar(
    //                 child: Text(_name[0]),
    //               )
    //               : null
    //             ),
    //             SizedBox(
    //               width: isSender ? 0.0 : 8.0,
    //             ),
    //             Expanded(
    //               child: Wrap(
    //                 children: <Widget>[
    //                   Container(
    //                     padding: const EdgeInsets.all(8.0),
    //                     decoration: BoxDecoration(
    //                         color: Colors.green,
    //                         borderRadius:
    //                             BorderRadius.all(Radius.circular(8.0))),
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       mainAxisSize: MainAxisSize.min,
    //                       children: <Widget>[
    //                         Text(
    //                           _name,
    //                           style: Theme.of(context).textTheme.subhead,
    //                         ),
    //                         Container(
    //                           margin: const EdgeInsets.only(top: 5.0),
    //                           child: Text(
    //                             text,
    //                             maxLines: null,
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             SizedBox(
    //               width: isSender ? 8.0 : 0.0,
    //             ),
    //             Container(
    //               child: isSender
    //               ? CircleAvatar(
    //                 child: Text(_name[0]),
    //               )
    //               : null
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class Bubble extends StatelessWidget {
  Bubble({this.message, this.time, this.delivered, this.isMe});

  final String message, time;
  final delivered, isMe;

  @override
  Widget build(BuildContext context) {
    final bg = isMe ? Colors.white : Colors.greenAccent.shade100;
    final align = isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final icon = delivered ? Icons.done_all : Icons.done;
    final radius = isMe
        ? BorderRadius.only(
            topRight: Radius.circular(5.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(5.0),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(5.0),
            bottomLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(10.0),
          );
    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(3.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: .5,
                  spreadRadius: 1.0,
                  color: Colors.black.withOpacity(.12))
            ],
            color: bg,
            borderRadius: radius,
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 48.0),
                child: Text(message),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Row(
                  children: <Widget>[
                    Text(time,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 10.0,
                        )),
                    SizedBox(width: 3.0),
                    Icon(
                      icon,
                      size: 12.0,
                      color: Colors.black38,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
