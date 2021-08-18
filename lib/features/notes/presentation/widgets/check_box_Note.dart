import 'package:flutter/material.dart';
import 'package:keep_google/features/notes/presentation/widgets/custom_icon_button.dart';
import 'package:keep_google/features/notes/presentation/widgets/custom_text_form.dart';

class CheckBoxNote extends StatelessWidget {
  const CheckBoxNote({Key? key, this.value}) : super(key: key);
  final value;
  @override
  Widget build(BuildContext context) {
    return CustomTextForm(
      hintText: 'List Item',
      prefixIcon: Row(
        children: [
          CustomIconButton(icon: Icons.more_vert, onPressed: () {}),
          Checkbox(
            value: true,
            activeColor: Colors.grey,
            onChanged: (value) {},
          ),
        ],
      ),
      suffix: CustomIconButton(
        icon: Icons.close,
        onPressed: () {},
      ),
    );
  }
}
