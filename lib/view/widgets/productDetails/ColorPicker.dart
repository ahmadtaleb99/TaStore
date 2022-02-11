import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taa_store/utils/theme.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({Key? key, required this.colorList}) : super(key: key);
  final List<Color> colorList;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  Color  ? currentColor ;



  @override
  Widget build(BuildContext context) {

    return Container(
      height: 200.h,
      width: 50.w,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(45.r),
      ),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.colorList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(3.5),
              child: InkWell(
                onTap: (){
                              setState(() {
                                currentColor = widget.colorList[index];
                                print(currentColor.toString());
                              });
                },
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color:  widget.colorList[index],
                    shape: BoxShape.circle,
                      border: Border.all( color: currentColor == widget.colorList[index] ?  Colors.white : Colors.black,

                          width: 2)
                  ),
                ),
              ),
            );
          }),
    );
  }
}
