import 'package:auto_route/auto_route.dart';
import 'package:chat_app/common/constant/app_dimens.dart';
import 'package:chat_app/common/constant/ui_helpers.dart';
import 'package:chat_app/common/widgets/k_loading_indicator.dart';
import 'package:chat_app/core/injection/injection.dart';
import 'package:chat_app/core/routes/app_routes.dart';
import 'package:chat_app/core/routes/app_routes.gr.dart';
import 'package:chat_app/modules/features/private_chat/view_model/cubit/private_chat_cubit.dart';
import 'package:chat_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PrivateChatView extends StatelessWidget {
  const PrivateChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => locator<PrivateChatCubit>()..getAllUsers(),
        child: BlocBuilder<PrivateChatCubit, PrivateChatState>(
          builder: (context, state) {
            if (state is PrivateChatLoadingState) {
              return Center(child: kLoadingIndicator(context: context));
            } else if (state is PrivateChatLoadedState) {
              return Scaffold(
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(80.0),
                  child: AppBar(
                    centerTitle: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(25),
                      ),
                    ),
                    title: Text(
                      "Chats",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimens.headlineFontSizeSmall,
                          color: Colors.white),
                    ),
                    actions: [
                      GestureDetector(
                        onTap: () =>
                            locator<AppRoutes>().push(const MyProfileView()),
                        child:
                            state.currentUserData.first['profile_picture'] != ''
                                ? CircleAvatar(
                                    radius: 25,
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundImage: NetworkImage(
                                            state.currentUserData
                                                .first['profile_picture'],
                                            scale: 10),
                                      ),
                                    ),
                                  )
                                : const CircleAvatar(
                                    radius: 25,
                                    child: Icon(Icons.person),
                                  ),
                      ),
                      mWidthSpan
                    ],
                  ),
                ),
                body: Column(
                  children: [
                    sHeightSpan,
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.allUserData.length,
                        itemBuilder: (context, index) {
                          final users = state.allUserData;
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            horizontalTitleGap: -5,
                            onTap: () => locator<AppRoutes>().push(ChatListView(
                                uid: users[index]['id'],
                                name: users[index]['name'],
                                profilePicture: users[index]
                                    ['profile_picture'])),
                            minVerticalPadding: 10,
                            leading: users[index]['profile_picture'] != ""
                                ? CircleAvatar(
                                    radius: 55,
                                    backgroundColor: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: CircleAvatar(
                                        radius: 55,
                                        backgroundImage: NetworkImage(
                                            users[index]['profile_picture']),
                                      ),
                                    ),
                                  )
                                : const CircleAvatar(
                                    radius: 55,
                                    backgroundColor: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: CircleAvatar(
                                        backgroundColor: disabledColor,
                                        radius: 55,
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                            title: Text(users[index]['name'].toString()),
                            subtitle: Text(users[index]['email'].toString()),
                          );
                        },
                      ),
                    )
                  ],
                ),
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
