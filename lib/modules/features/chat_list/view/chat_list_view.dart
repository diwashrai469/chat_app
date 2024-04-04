import 'package:auto_route/auto_route.dart';
import 'package:chat_app/common/constant/app_dimens.dart';
import 'package:chat_app/common/constant/ui_helpers.dart';
import 'package:chat_app/common/widgets/k_loading_indicator.dart';
import 'package:chat_app/common/widgets/k_textformfield.dart';
import 'package:chat_app/modules/features/chat_list/view_model/chat_list_view_model.dart';
import 'package:chat_app/theme/app_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@RoutePage()
class ChatListView extends StatelessWidget {
  final String uid;
  final String name;
  final String profilePicture;

  const ChatListView(
      {super.key,
      required this.uid,
      required this.name,
      required this.profilePicture});

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();
    final ChatListViewModel chatListViewModel = ChatListViewModel();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
          title: Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              CircleAvatar(
                radius: 21,
                child: profilePicture != ''
                    ? CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(profilePicture),
                      )
                    : const CircleAvatar(
                        backgroundColor: disabledColor,
                        radius: 20,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
              ),
              mWidthSpan,
              Text(
                name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: AppDimens.headlineFontSizeSmall),
              ),
            ],
          ),
          centerTitle: false,
        ),
      ),
      body: StreamBuilder(
        stream: chatListViewModel.getChatList(uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: kLoadingIndicator(context: context));
          }

          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: AppDimens.mainPagePadding,
                  child: ListView(
                    children: snapshot.data!.docs
                        .map((document) => _buildMessageItem(document, context))
                        .toList(),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 4,
                          child: KTextFormField(
                            controller: messageController,
                          )),
                      Flexible(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              chatListViewModel.sendMessage(
                                  uid, messageController.text);
                              messageController.clear();
                            },
                            child: const CircleAvatar(
                                radius: 25, child: Icon(Icons.send)),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String dateFormatForTime(String date) {
    DateTime now = DateTime.parse(date);

    return DateFormat('E, hh:mm a').format(now);
  }

  Widget _buildMessageItem(DocumentSnapshot document, BuildContext context) {
    String currentid = FirebaseAuth.instance.currentUser!.uid;
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var alignment = (data['senderId'] == currentid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: (data['senderId'] == currentid)
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          mainAxisAlignment: (data['senderId'] == currentid)
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Text(dateFormatForTime(data['timeStamp'])),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: (data['senderId'] == currentid)
                      ? Colors.blue
                      : disabledColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                data['Message'],
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
