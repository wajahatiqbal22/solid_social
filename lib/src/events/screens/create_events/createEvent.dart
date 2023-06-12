// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:solid_social/constants/social_auth_constants.dart';
import 'package:solid_social/extensions/build_context_extension.dart';
import 'package:solid_social/extensions/datetime_extension.dart';
import 'package:solid_social/src/app/bootstrap/bootstrap.dart';
import 'package:solid_social/src/app/router/routes.dart';
import 'package:solid_social/src/auth/controllers/auth_controller.dart';
import 'package:solid_social/src/community/domain/entities/community/community.dart';
import 'package:solid_social/src/events/controller/event_controller.dart';
import 'package:solid_social/src/events/screens/schedule_events.dart';
// Project imports:
import 'package:solid_social/utils/GLOBAL.dart';
import 'package:solid_social/utils/assets/formFields.dart';
import 'package:solid_social/utils/assets/popups.dart';
import 'package:solid_social/utils/assets/textstyles.dart';

import '../../../../utils/assets/buttons.dart';
import '../../../../utils/assets/colors.dart';

class CreateEventScreen1 extends StatefulWidget {
  const CreateEventScreen1({required this.community, Key? key}) : super(key: key);

  final Community community;
  @override
  State<CreateEventScreen1> createState() => _CreateEventScreen1State();
}

class _CreateEventScreen1State extends State<CreateEventScreen1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final double _itemsSpacing = 20.0;

  final double _rowSpacing = 30.0;

  bool _recordEventStatus = true;
  bool _makePrivateStatus = false;
  final _eventNameCon = TextEditingController();

  final _eventDateCon = TextEditingController();
  final _eventTimeCon = TextEditingController();

  DateTime _selectedDateTime = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventController(context.read<Bootstrap>(), selectedCommunity: widget.community),
      child: Builder(builder: (context) {
        final eventController = context.read<EventController>();
        return Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () => {Navigator.pop(context)},
                child: const Icon(Icons.close),
              ),
              title: const HeadingText5(
                text: "Create Event",
              ),
            ),
            body: Form(
              key: _formKey,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(
                      top: CustomGlobal.paddingTop,
                      left: CustomGlobal.paddingInline,
                      right: CustomGlobal.paddingInline,
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: _itemsSpacing),
                              child: const HeaderSubText(
                                text: "Fill our the details of your event.",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: _itemsSpacing),
                              child: InputField(
                                validator: (p0) {
                                  if (p0!.isEmpty) {
                                    return "Name is required";
                                  }
                                  return null;
                                },
                                controller: _eventNameCon,
                                placeholder: "Event Name",
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: _rowSpacing / 2),
                                    child: InputField(
                                      validator: (p0) {
                                        if (p0!.isEmpty) {
                                          return "Date is required";
                                        }
                                        return null;
                                      },
                                      controller: _eventDateCon,
                                      placeholder: "Date",
                                      readOnly: true,
                                      onTap: () async {
                                        final selectedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(DateTime.now().year + 20),
                                        );
                                        changeSelectedDate(selectedDate);
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: _rowSpacing / 2),
                                    child: InputField(
                                      validator: (p0) {
                                        if (p0!.isEmpty) {
                                          return "Time is required";
                                        }
                                        return null;
                                      },
                                      controller: _eventTimeCon,
                                      placeholder: "Time",
                                      readOnly: true,
                                      onTap: () async {
                                        final selectedTime = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        );
                                        changeSelectedTime(selectedTime);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 0.5,
                              height: _itemsSpacing * 2,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Expanded(
                                  child: InterText(
                                    text: "Record Event",
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: FlutterSwitch(
                                    value: _recordEventStatus,
                                    width: 35,
                                    height: 20,
                                    padding: 2,
                                    toggleSize: 15,
                                    activeColor: CustomColors.blue,
                                    inactiveColor: CustomColors.grey25Black,
                                    onToggle: (val) {
                                      setState(() {
                                        _recordEventStatus = val;
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              thickness: 0.5,
                              height: _itemsSpacing * 2,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Expanded(
                                  child: InterText(
                                    text: "Make Private",
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: FlutterSwitch(
                                    value: _makePrivateStatus,
                                    width: 35,
                                    height: 20,
                                    padding: 2,
                                    toggleSize: 15,
                                    activeColor: CustomColors.blue,
                                    inactiveColor: CustomColors.grey25Black,
                                    onToggle: (val) {
                                      if (val == false) {
                                        eventController.clearSelectedGroups();
                                      }
                                      setState(() {
                                        _makePrivateStatus = val;

                                        if (_makePrivateStatus) {
                                          openGroupsDialogue(context, eventController);
                                        } // If modal show
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey.shade400, width: 1),
                                      // color: Colors.yellow,
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      splashRadius: 18,
                                      iconSize: 18,
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {
                                        openGroupsDialogue(context, eventController);
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Builder(builder: (context) {
                                        final list = context.watch<EventController>().selectedGroups;

                                        return Row(
                                          children: [
                                            ...list
                                                .map((e) => Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: const Color(
                                                            0xffF4FAFF,
                                                          ),
                                                          borderRadius: BorderRadius.circular(20),
                                                        ),
                                                        height: 37,
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(
                                                            horizontal: 5,
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              e.displayPhotoUrl != null
                                                                  ? CircleAvatar(
                                                                      backgroundColor: Colors.white,
                                                                      radius: 16,
                                                                      backgroundImage:
                                                                          NetworkImage(e.displayPhotoUrl ?? ""),
                                                                    )
                                                                  : const SizedBox.shrink(),
                                                              const SizedBox(
                                                                width: 5,
                                                              ),
                                                              Text(e.groupName),
                                                              FittedBox(
                                                                child: IconButton(
                                                                    splashRadius: 10,
                                                                    onPressed: () {
                                                                      if (list.length == 1) {
                                                                        setState(() {
                                                                          _makePrivateStatus = false;
                                                                        });
                                                                      }
                                                                      eventController.toggleSelectedGroups(
                                                                          group: e, isChecked: false);
                                                                    },
                                                                    icon: const Icon(Icons.clear)),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                          ],
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: CustomGlobal.paddingInline, right: CustomGlobal.paddingInline),
                      child: Builder(builder: (context) {
                        final _state = context.select((EventController value) => value.state);
                        return MainBtn(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              eventController
                                  .createEvent(
                                eventName: _eventNameCon.text,
                                isPrivate: _makePrivateStatus,
                                isRecording: _recordEventStatus,
                                currentUser: context.read<AuthController>().solidSocialUser,
                                createdAt: DateTime.now(),
                                eventDateTime: _selectedDateTime,
                                onError: (p0) {
                                  context.showSnackbar(p0.message.toString());
                                },
                                onSuccess: (p0) {
                                  context.toNamed(AppRouter.scheduledEvents,
                                      arguments: ScheduledEventsArgs(eventController));
                                },
                              )
                                  .onError((error, stackTrace) {
                                context.showSnackbar(error.toString());
                              });
                            }
                          },
                          text: "Create Event",
                          isLoading: _state == Loading.processing,
                          color: CustomColors.blue,
                          textColor: Colors.white,
                          width: double.infinity,
                          bottomMargin: CustomGlobal.marginBottomButtons,
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ));
      }),
    );
  }

  void openGroupsDialogue(BuildContext context, EventController eventController) {
    showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return CustomPopup(eventController: eventController);
        }).whenComplete(() => {
          setState(() {
            if (eventController.selectedGroups.isEmpty) {
              _makePrivateStatus = false;
            } else {
              _makePrivateStatus = true;
            }
          })
        }); // When Complete;
  }

  void changeSelectedDate(DateTime? selectedDate) {
    if (selectedDate == null) return;
    setState(() {
      _selectedDateTime = _selectedDateTime.copyWith(
        year: selectedDate.year,
        month: selectedDate.month,
        day: selectedDate.day,
      );
    });
    _eventDateCon.text = _selectedDateTime.formattedDate;
  }

  void changeSelectedTime(TimeOfDay? selectedTime) {
    if (selectedTime == null) return;
    setState(() {
      _selectedDateTime = _selectedDateTime.copyWith(
        hour: selectedTime.hour,
        minute: selectedTime.minute,
      );
    });
    _eventTimeCon.text = selectedTime.format(context);
  }
}
