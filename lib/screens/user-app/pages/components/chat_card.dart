import 'package:flutter/material.dart';

class ChatCard extends StatefulWidget {
  final String avatar;
  final String username;
  final String message;
  final int unread;
  final String time;
  const ChatCard(
      {required this.avatar,
      required this.username,
      required this.message,
      required this.unread,
      required this.time});
  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20 * 0.75),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/${widget.avatar}'),
                ),
                //if user online
                if (true)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: const Color(0xffecb22e),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 3),
                      ),
                    ),
                  )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.username,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        widget.message,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 3.5),
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: const Color(0xffecb22e),
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    widget.unread.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                Opacity(
                  opacity: 0.64,
                  child: Text(widget.time),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
