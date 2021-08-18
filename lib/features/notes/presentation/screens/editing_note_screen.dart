import 'package:flutter/material.dart';
import 'package:keep_google/features/notes/presentation/widgets/custom_icon_button.dart';
import 'package:keep_google/features/notes/presentation/widgets/custom_text_form.dart';

class EditingNoteScreen extends StatelessWidget {
  const EditingNoteScreen({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CustomIconButton(
            icon: Icons.push_pin_outlined,
            tooltip: 'Pin',
            onPressed: () {},
          ),
          CustomIconButton(
            icon: Icons.add_alert_outlined,
            tooltip: 'Reminder',
            onPressed: () {},
          ),
          CustomIconButton(
            icon: Icons.archive_outlined,
            tooltip: 'Archive',
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Row(
          children: [
            CustomIconButton(
              icon: Icons.add_box_outlined,
              onPressed: () {},
            ),
            CustomIconButton(
              icon: Icons.palette_outlined,
              onPressed: () {},
            ),
            Expanded(
              child: Container(
                child: Text(
                  'Edited 11:07 PM',
                  textAlign: TextAlign.center,
                ),
                width: 170,
              ),
            ),
            CustomIconButton(
              icon: Icons.more_vert,
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(child: child,),
          CustomTextForm(
            hintText: 'Title',
            hintStyle: Theme.of(context).textTheme.headline6,
          ),
          CustomTextForm(
            hintText: 'Note',
            maxLines: 30,
            hintStyle: Theme.of(context).textTheme.bodyText1,
          ),

        ],
      ),
    );
  }
}
