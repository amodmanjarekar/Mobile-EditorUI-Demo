import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'utils.dart';

class MainEditArea extends StatelessWidget {
  const MainEditArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (scaffoldContext) {
      return InteractiveViewer(
        constrained: false,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
              color: Colors.grey[800],
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 40.0, horizontal: 20.0),
                child: Center(
                  child: Container(
                    width: 360,
                    height: 640,
                    color: Colors.white,
                    child: Consumer<TextDataList>(
                      builder: (context, textData, child) => Stack(
                        children: textData.textDataList
                            .map((textItem) => Positioned(
                                top: textItem.topValue,
                                left: textItem.leftValue,
                                child: GestureDetector(
                                  onTap: () {
                                    Scaffold.of(scaffoldContext)
                                        .openEndDrawer();
                                    textData.changeSelected(textItem.id);
                                  },
                                  onPanUpdate: (panDetails) {
                                    textData.changePosition(
                                        textItem.id,
                                        panDetails.delta.dx,
                                        panDetails.delta.dy);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: (textItem.id ==
                                                      textData.selectedIndex)
                                                  ? Colors.green
                                                  : Colors.transparent)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(textItem.textValue,
                                            style: GoogleFonts.getFont(
                                                textItem.textFont,
                                                color: textItem.textColor)),
                                      )),
                                )))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              )),
        ),
      );
    });
  }
}
