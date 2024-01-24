import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'elements.dart';
import 'utils.dart';

class EditorPanel extends StatelessWidget {
  const EditorPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<TextDataList>(
        builder: (context, textDataList, child) =>
            ListView(padding: const EdgeInsets.all(8.0), children: [
          // TEXT CHANGE
          const LabelText(labelText: "Text to be displayed"),
          TextFormField(
            initialValue:
                textDataList.textDataList[textDataList.selectedIndex].textValue,
            autocorrect: false,
            onChanged: (newText) {
              textDataList.changeTextValue(textDataList.selectedIndex, newText);
            },
          ),

          // FONT CHANGE
          const LabelText(labelText: "Font"),
          DropdownButton<String>(
              value: textDataList
                  .textDataList[textDataList.selectedIndex].textFont,
              items: ["Roboto", "Montserrat", "Lobster"]
                  .map((fontStr) => DropdownMenuItem(
                      value: fontStr,
                      child: Text(
                        fontStr,
                        style: GoogleFonts.getFont(fontStr),
                      )))
                  .toList(),
              onChanged: (newFont) {
                if (newFont != null) {
                  textDataList.changeTextFont(
                      textDataList.selectedIndex, newFont);
                }
              }),

          //COLOR CHANGE
          const LabelText(labelText: "Color"),
          ColorPicker(
            color: Colors.black,
            initialPicker: Picker.swatches,
            onChanged: (newColor) {
              textDataList.changeTextColor(
                  textDataList.selectedIndex, newColor);
            },
          )
        ]),
      ),
    );
  }
}
