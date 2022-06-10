import 'package:aimelive_app/models/app_user.dart';
import 'package:aimelive_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatInputField extends StatefulWidget {
  final String receiverId;
  const ChatInputField({required this.receiverId});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController _message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
    final DatabaseService _sendMessage = DatabaseService(uuid: user?.uuid);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20 / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 32,
            color: const Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            const Icon(Icons.mic, color: Color(0xffecb22e)),
            const SizedBox(width: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20 * 0.75,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffecb22e).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.64),
                    ),
                    const SizedBox(width: 20 / 4),
                    Expanded(
                      child: TextField(
                        controller: _message,
                        decoration: const InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20 / 4),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.64),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffecb22e).withOpacity(0.05),
                borderRadius: BorderRadius.circular(40),
              ),
              child: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () async {
                    if (_message.text != "") {
                      dynamic resp = await _sendMessage.createChatMessage(
                          _message.text, DateTime.now(), widget.receiverId);
                      if (resp != null) {
                        setState(() {
                          _message.value = TextEditingValue.empty;
                        });
                      }
                    }
                  },
                  color: const Color(0xffecb22e)),
            ),
          ],
        ),
      ),
    );
  }
}
