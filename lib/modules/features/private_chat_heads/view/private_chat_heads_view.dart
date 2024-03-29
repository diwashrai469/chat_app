import 'package:auto_route/auto_route.dart';
import 'package:chat_app/common/constant/app_dimens.dart';
import 'package:chat_app/common/constant/ui_helpers.dart';
import 'package:chat_app/core/services/local_storage.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PrivateChatHeadsView extends StatelessWidget {
  const PrivateChatHeadsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Chats",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: AppDimens.headlineFontSizeSmall, color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  LocalStorageService().clear("acessToken");
                },
                child: Text("clear token")),
            sHeightSpan,
            Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ListTile(
                      minVerticalPadding: 25,
                      leading: CircleAvatar(
                        radius: 40,
                      ),
                      title: Text("ram shaym"),
                    );
                  }),
            )
          ],
        ));
  }
}
