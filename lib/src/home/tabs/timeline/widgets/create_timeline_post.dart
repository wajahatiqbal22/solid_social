import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/src/home/domain/controller/timeline_controller.dart';
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/buttons.dart';
import 'package:solid_social/utils/assets/colors.dart';
import 'package:solid_social/utils/assets/icons.dart';
import 'package:solid_social/utils/assets/textstyles.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class CreateTimelinePost extends StatefulWidget {
  CreateTimelinePost({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TimelineController controller;

  @override
  State<CreateTimelinePost> createState() => _CreateTimelinePostState();
}

class _CreateTimelinePostState extends State<CreateTimelinePost> {
  final TextEditingController _body = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  File? file;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.controller,
      child: Builder(builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: CustomGlobal.paddingInline, top: 12),
                            child: GestureDetector(
                              onTap: () => context.pop(),
                              child: CustomIcons.close2(width: 17),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: HeadingText5(
                              text: "New Post",
                              fontSize: 18,
                            ),
                          ),
                          MainBtn(
                            onPressed: () => _body.text.isNotEmpty
                                ? widget.controller.sendMessage(
                                    type: PostType.post,
                                    body: _body.text,
                                    attachment: file,
                                    onError: (e) {
                                      context.showSnackbar(e.message ?? "", isError: true);
                                    },
                                    onMessageSent: (message) {
                                      log("Message sent: ${message.id}");
                                      context.pop();
                                    })
                                : null,
                            text: "Post",
                            width: 35,
                            height: 25,
                            color: CustomColors.blue,
                            elevation: 0,
                            textColor: Colors.white,
                            paddingRight: CustomGlobal.paddingInline / 2,
                            bottomMargin: 0,
                          ),
                        ],
                      ),
                      const Divider(color: CustomColors.grey25Black, thickness: 0.5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            validator: (v) {
                              return v!.isEmpty ? "Empty post" : null;
                            },
                            controller: _body,
                            minLines: 15,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: "Whats on your mind?",
                              hintStyle: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      if (file != null)
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  file!,
                                  height: context.height * 0.3,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                          ],
                        )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    color: CustomColors.grey25,
                    constraints: const BoxConstraints(
                      minHeight: 50,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: CustomGlobal.paddingInline),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.add,
                            ),
                            onPressed: () async {
                              final file = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 25);

                              setState(() {
                                this.file = file != null ? File(file.path) : null;
                              });

                              // log("HI");
                              // final List<AssetPathEntity> paths =
                              //     await PhotoManager.getAssetPathList();
                              // final images = [
                              //   for (final path in paths)
                              //     ...(await path.getAssetListPaged(page: 0, size: 100))
                              // ];

                              // showDialog(
                              //     context: context,
                              //     builder: (context) {
                              //       return SizedBox(
                              //         height: context.height * 0.5,
                              //         width: double.infinity,
                              //         child: GridView.builder(
                              //           gridDelegate:
                              //               const SliverGridDelegateWithFixedCrossAxisCount(
                              //                   crossAxisCount: 3,
                              //                   mainAxisExtent: 10,
                              //                   crossAxisSpacing: 10),
                              //           itemCount: images.length,
                              //           itemBuilder: (context, i) {
                              //             return AssetEntityImage(images[i]);
                              //           },
                              //         ),
                              //       );
                              //     });
                              // log("PATHS: $paths");
                            },
                          ),
                          IconButton(
                            icon: CustomIcons.camera2(),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: CustomIcons.emailAt(),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: CustomIcons.tag(),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
