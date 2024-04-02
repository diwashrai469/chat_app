import 'package:auto_route/auto_route.dart';
import 'package:chat_app/common/constant/app_dimens.dart';
import 'package:chat_app/common/constant/ui_helpers.dart';
import 'package:chat_app/common/widgets/k_loading_indicator.dart';
import 'package:chat_app/core/injection/injection.dart';
import 'package:chat_app/core/routes/app_routes.dart';
import 'package:chat_app/core/routes/app_routes.gr.dart';
import 'package:chat_app/core/services/local_storage.dart';
import 'package:chat_app/modules/features/private_chat/view_model/cubit/private_chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PrivateChatView extends StatelessWidget {
  const PrivateChatView({super.key});

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
      body: BlocProvider(
        create: (context) => locator<PrivateChatCubit>()..getAllUsers(),
        child: BlocBuilder<PrivateChatCubit, PrivateChatState>(
          builder: (context, state) {
            if (state is PrivateChatLoadingState) {
              return Center(child: kLoadingIndicator(context: context));
            } else if (state is PrivateChatLoadedState) {
              return Column(
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await LocalStorageService()
                            .clear(LocalStorageKeys.accessToken);
                      },
                      child: const Text("clear token")),
                  sHeightSpan,
                  Expanded(
                    child: ListView.builder(
                        itemCount: state.allUserData.length,
                        itemBuilder: (context, index) {
                          final users = state.allUserData;
                          return ListTile(
                            onTap: () => locator<AppRoutes>().push(ChatListView(
                                uid: users[index]['id'],
                                name: users[index]['name'])),
                            minVerticalPadding: 10,
                            leading: const CircleAvatar(
                              radius: 40,
                            ),
                            title: Text(users[index]['name'].toString()),
                            subtitle: Text(users[index]['email'].toString()),
                          );
                        }),
                  )
                ],
              );
            } else {
              return const Center(
                child: Text("Somthing went wrong"),
              );
            }
          },
        ),
      ),
    );
  }
}
