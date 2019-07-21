import 'package:flutter/material.dart';

void main() => runApp(FriendlyChatApp());

class FriendlyChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Friendly Chat',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Friendly App'),
        ),
        body: SafeArea(
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
        ));
  }

  Widget _buildTextComponent() {
    return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: _textController,
                    onSubmitted: _handleSubmitted,
                    decoration:
                        InputDecoration.collapsed(hintText: 'Send a message'),
                    maxLines: null,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () => _handleSubmitted(_textController.text),
                  ),
                )
              ],
            )));
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(text);
    setState(() {
      _messages.insert(_messages.length, message);
    });
  }
}

class ChatMessage extends StatelessWidget {
  static const String _name = 'Bao';
  final String text;

  ChatMessage(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
              Flexible(
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
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
        )
      ],
    );
  }
}
