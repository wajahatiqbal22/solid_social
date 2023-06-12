import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/auth/controllers/auth_controller.dart';
import 'package:solid_social/src/community/controllers/join_communities_controller.dart';
import 'package:solid_social/src/community/domain/entities/community_metadata/community_metadata.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/images.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../shared/states/loading_state.dart';
import '../../../../utils/assets/buttons_header.dart';
import '../../../../utils/assets/textstyles.dart';

class CommunityNotificationScreen extends StatefulWidget {
  const CommunityNotificationScreen({super.key, required this.joinCommunityController});

  final JoinCommunityController joinCommunityController;

  @override
  State<CommunityNotificationScreen> createState() => _CommunityNotificationScreenState();
}

class _CommunityNotificationScreenState extends State<CommunityNotificationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget.joinCommunityController
          .getUserInvitations(userId: context.read<AuthController>().solidSocialUser.uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadingText5(text: "Invite Notification"),
        centerTitle: true,
        leading: const CustomBackButton(),
      ),
      body: ChangeNotifierProvider.value(
        value: widget.joinCommunityController,
        child: Builder(builder: (context) {
          List<CommunityMetadata> communitiesMetaData = [];
          final LoadingState<List<CommunityMetadata>> state =
              context.select((JoinCommunityController value) => value.invitationState);
          bool isLoading = state == const LoadingState.loading();

          state.maybeWhen(
              loaded: (List<CommunityMetadata>? meta) => communitiesMetaData = meta!, orElse: () {}, loading: () {});

          return communitiesMetaData.isEmpty
              ? isLoading
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : Center(
                      child: Text(
                      'There are no invitations.',
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyText1,
                    ))
              : ListView.separated(
                  itemBuilder: (context, index) {
                    final indexItem = communitiesMetaData[index];
                    return InviteNotificationTile(
                        communityName: indexItem.communityName,
                        inviteSenderName: 'Spidy',
                        inviteSenderPhotoUrl: '',
                        timeAgo: timeago.format(indexItem.joinedAt!),
                        status: indexItem.status,
                        onAcceptTap: () async {
                          await widget.joinCommunityController
                              .acceptOrRejectUserInvitation(
                                  communityMetadata: indexItem, status: CommunityRequestStatus.accepted)
                              .then((_) {
                            // context.toNamed(AppRouter.areaOfInterest);
                          });
                        },
                        onDeclineTap: () {
                          widget.joinCommunityController.acceptOrRejectUserInvitation(
                              communityMetadata: indexItem, status: CommunityRequestStatus.declined);
                        });
                  },
                  separatorBuilder: (context, i) {
                    return const Divider(
                      color: CustomColors.grey25Black,
                      height: 25,
                      thickness: 0.5,
                    );
                  },
                  itemCount: communitiesMetaData.length);
        }),
      ),
    );
  }
}

class InviteNotificationTile extends StatelessWidget {
  const InviteNotificationTile(
      {super.key,
      required this.communityName,
      required this.inviteSenderName,
      required this.inviteSenderPhotoUrl,
      required this.timeAgo,
      required this.onAcceptTap,
      required this.onDeclineTap,
      required this.status});

  final String communityName;
  final String inviteSenderName;
  final String inviteSenderPhotoUrl;
  final String timeAgo;
  final VoidCallback onAcceptTap;
  final VoidCallback onDeclineTap;
  final CommunityRequestStatus status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(
              //TODO: Show invite sender image
              ),
          title: RichText(
            text: TextSpan(
                style: GoogleFonts.inter(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 12.0,
                ),
                children: [
                  TextSpan(text: inviteSenderName, style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' invited you into the $communityName')
                ]),
          ),
          subtitle: InterText(
            text: timeAgo,
            color: CustomColors.grey100,
          ),
          trailing: CircularNameInitials(
            name: communityName,
            backgroundColor: CustomColors.grey05,
            textColor: CustomColors.grey100,
          ),
        ),
        status == CommunityRequestStatus.pending
            ? Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomOutlinedButton(
                      onPressed: onAcceptTap,
                      text: 'Accept',
                      minimumSize: Size(context.width * 0.4, context.height * 0.04),
                      textColor: Colors.white,
                      buttonColor: CustomColors.blue,
                    ),
                    const SizedBox(width: 8.0),
                    CustomOutlinedButton(
                      onPressed: onDeclineTap,
                      text: 'Decline',
                      minimumSize: Size(context.width * 0.4, context.height * 0.04),
                      textColor: Colors.blue,
                      buttonColor: Colors.white,
                    ),
                  ],
                ),
              )
            : InterText(
                text: status.name,
                color: status == CommunityRequestStatus.accepted ? CustomColors.blue : Colors.red,
              ),
        const Divider()
      ],
    );
  }
}
