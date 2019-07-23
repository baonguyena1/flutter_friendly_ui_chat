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

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
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
                )
              ],
            ),
            decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey[200])
                )
              )
              : null
          ),
        ));
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  Widget _buildTextComponent() {
    return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
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
            )));
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessage message = ChatMessage(
        text,
        AnimationController(
            duration: Duration(milliseconds: 700), vsync: this));
    setState(() {
      _messages.insert(_messages.length, message);
    });
    message.animationController.forward();
  }
}

class ChatMessage extends StatelessWidget {
  static const String _name = 'Bao';
  final String text;
  final AnimationController animationController;

  ChatMessage(this.text, this.animationController);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
      axisAlignment: 0.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  child: Text(_name[0]),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        _name,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          text,
                          maxLines: null,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
          )
        ],
      ),
    );
  }
}
