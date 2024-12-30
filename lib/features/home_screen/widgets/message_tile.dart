import 'package:analytica_assement/core/extensions/context_extension.dart';
import 'package:analytica_assement/features/home_screen/services/models/message_model.dart';
import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    super.key,
    required this.message,
  });
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          constraints: const BoxConstraints(
            minWidth: 50,
            maxWidth: 250,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: message.isFailed
                ? Colors.red.withOpacity(.4)
                : message.isUser
                    ? Colors.blue
                    : Colors.grey[200],
          ),
          child: Text(
            message.message,
            style: context.label14400.copyWith(
              color: message.isUser ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
