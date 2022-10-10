import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieImageDisposable extends StatelessWidget {
  final String image;
  const MovieImageDisposable({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DropShadow(
          offset: const Offset(0, 10),
          borderRadius: 20,
          blurRadius: 7,
          child: Image.network(image),
        ),
        Positioned(
            right: 20.w,
            top: 65.h,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 33.h,
                width: 33.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                child: const Icon(Icons.close, color: Colors.black),
              ),
            ))
      ],
    );
  }
}
