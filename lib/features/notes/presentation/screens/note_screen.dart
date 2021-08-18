import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keep_google/features/notes/presentation/services/image_picker_helper.dart';
import 'package:keep_google/features/notes/presentation/services/navigate.dart';
import 'package:keep_google/features/notes/presentation/widgets/custom_icon_button.dart';

import 'editing_note_screen.dart';

class NoteScreen extends StatelessWidget {
  NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          navigateTo(context, EditingNoteScreen());
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              icon: Icons.check_box_outlined,
              onPressed: () {
                navigateTo(context, EditingNoteScreen());
              },
            ),
            CustomIconButton(
              icon: Icons.brush,
              onPressed: () {
                navigateTo(context, EditingNoteScreen());
              },
            ),
            SizedBox(width: 30),
            CustomIconButton(
              icon: Icons.mic_none,
              onPressed: () {
                navigateTo(context, EditingNoteScreen());
              },
            ),
            CustomIconButton(
              icon: Icons.photo_outlined,
              onPressed: () async {
                var imageFile;
                await showCustomDialog(
                  context: context,
                  pickImage: () async {
                    imageFile = await ImagePickerApi.pickImage();
                    Navigator.pop(context);
                  },
                  chooseImage: () async {
                    imageFile = await ImagePickerApi.pickImage(
                        source: ImageSource.gallery);
                    Navigator.pop(context);
                  },
                );

                if (imageFile != null) {
                  navigateTo(
                    context,
                    EditingNoteScreen(
                      child: Builder(builder: (_) => Image.file(imageFile)),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future showCustomDialog({context, pickImage, chooseImage}) async {
    return await showDialog(
        context: context,
        builder: (_) {
          return SimpleDialog(
            title: Text('Add Image'),
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt_outlined),
                title: Text('Take a Picture'),
                onTap: pickImage,
              ),
              ListTile(
                leading: Icon(Icons.photo_outlined),
                title: Text('Choose Image'),
                onTap: chooseImage,
              ),
            ],
          );
        });
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(icon: Icons.menu, onPressed: () {}),
        Container(
          child: Text('Search your notes'),
        ),
        CustomIconButton(icon: Icons.menu, onPressed: () {}),
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.green,
          child: Text('A'),
        )
      ],
    );
  }
}


// class BottomCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;

//     double width = size.width;
//     double height = size.height;

//     Path path = Path()..moveTo(0, 0);

//     path.lineTo(0.75 * width, 0);
//     path.quadraticBezierTo(0.77 * width, 0, 0.77 * width, 5);
//     path.arcToPoint(Offset(0.93 * width, 5),
//         clockwise: false, radius: Radius.circular(10));
//     path.quadraticBezierTo(0.93 * width, 0, 0.95 * width, 0);
//     path.lineTo(width, 0);
//     path.lineTo(width, height);
//     path.lineTo(0, height);

//     canvas.drawPath(path, paint);
//     canvas.drawShadow(path, Colors.black, 10, false);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }


    // path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    // path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    // path.arcToPoint(Offset(size.width * 0.60, 20),
    //     radius: Radius.circular(10.0), clockwise: false);
    // path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    // path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);


    // Path path = Path()..moveTo(0, 0);
    // path.lineTo(width * 0.65, 0);
    // path.quadraticBezierTo(width * 0.70, 0, width * 0.70, 20);
    // path.arcToPoint(Offset(width * 0.85, 20),
    //     radius: Radius.circular(10.0), clockwise: false);
    // path.quadraticBezierTo(width * 0.85, 0, width * 0.90, 0);
    // path.lineTo(width, 0);
    // path.lineTo(width, size.height);
    // path.lineTo(0, size.height);
