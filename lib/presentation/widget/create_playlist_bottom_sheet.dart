import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:music/data/local/media_playlist_database.dart';

import '../blocs/app_database/app_database_cubit.dart';
import '../theme/app_color.dart';
import '../theme/app_text_theme.dart';

void createPlaylistBottomSheet(BuildContext context) {
  final FocusNode focusNode = FocusNode();

  showMaterialModalBottomSheet(
    context: context,
    expand: false,
    animationCurve: Curves.easeIn,
    duration: const Duration(milliseconds: 300),
    elevation: 20,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: Container(
            height: (MediaQuery.of(context).size.height * 0.45) + 10,
            color: AppColor.accentColor2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                LayoutBuilder(builder: (context, constraints) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: constraints.maxWidth,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                      child: Container(
                        color: AppColor.themeColor,
                        child: SingleChildScrollView(
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "Create new Playlist 😍",
                                      style: AppTextTheme.secondoryTextStyleMedium.merge(
                                        const TextStyle(
                                          color: AppColor.accentColor2,
                                          fontSize: 35,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    top: 10,
                                  ),
                                  child: TextField(
                                    autofocus: true,
                                    textInputAction: TextInputAction.done,
                                    maxLines: 3,
                                    textAlignVertical: TextAlignVertical.center,
                                    textAlign: TextAlign.center,
                                    focusNode: focusNode,
                                    cursorHeight: 60,
                                    showCursor: true,
                                    cursorWidth: 5,
                                    cursorRadius: const Radius.circular(5),
                                    cursorColor: AppColor.accentColor2,
                                    style: const TextStyle(
                                      fontSize: 45,
                                      color: AppColor.accentColor2,
                                    ).merge(AppTextTheme.secondoryTextStyleMedium),
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(style: BorderStyle.none),
                                          // borderRadius: BorderRadius.circular(50)
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          // borderRadius: BorderRadius.circular(50),
                                        )),
                                    onTapOutside: (event) {
                                      focusNode.unfocus();
                                    },
                                    onSubmitted: (value) {
                                      focusNode.unfocus();

                                      if (value.isNotEmpty && value.length > 2) {
                                        context.read<AppDatabaseCubit>().addNewPlaylistToDB(
                                              MediaPlaylistDatabase(playlistName: value),
                                            );
                                        context.pop();
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      );
    },
  );
}
