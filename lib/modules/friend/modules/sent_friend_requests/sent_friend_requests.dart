import 'package:flutter/material.dart';
import 'package:pay_buddy/modules/friend/modules/widget/friend_request_item.dart';
import 'package:pay_buddy/widget/app_bar.dart';

class SentFriendRequests extends StatelessWidget {
  const SentFriendRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          title: "Your sent friend requests",
        ),
        body: ListView.separated(
            separatorBuilder: (_, __) => Divider(),
            itemCount: 1,
            itemBuilder: (_, int index) {
              return FriendRequestItem(isReceivedRequest: false);
            }));
  }
}
