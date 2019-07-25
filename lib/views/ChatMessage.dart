import 'package:flutter/material.dart';

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
  }
}