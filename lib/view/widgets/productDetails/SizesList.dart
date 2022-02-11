import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taa_store/utils/theme.dart';

class SizesList extends StatefulWidget {
  const SizesList({Key? key, required this.sizesList}) : super(key: key);
  final List<String> sizesList;

  @override
  _SizesListState createState() => _SizesListState();
}

class _SizesListState extends State<SizesList> {
  String selectedSize = 'L';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      child: Center(

        child: ListView.separated(
          padding: EdgeInsets.only(top: 10.h),
          shrinkWrap: true,
            scrollDirection : Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  setState(() {
                    selectedSize = widget.sizesList[index];
                  });
                },
                child: Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    color: selectedSize == widget.sizesList[index] ? ( Get.isDarkMode ? pinkClr : mainColor  ) : Get.isDarkMode ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Get.isDarkMode ? Colors.white :  Colors.black)
                  ),
                  child: Center(
                    child: Text(widget.sizesList[index],style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 10.w,);
            },
            itemCount: widget.sizesList.length),
      ),
    );
  }
}
