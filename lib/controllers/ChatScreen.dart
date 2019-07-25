import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:friendly_chat/views/ChatMessage.dart';

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
        isMe);
    setState(() {
      _messages.insert(_messages.length, message);
    });
  }
}