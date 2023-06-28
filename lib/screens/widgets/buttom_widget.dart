import 'package:flutter/material.dart';

class ButtomWidget extends StatelessWidget {
  final Function() onpressed;
  final String nameFunction;
  final bool onfile;
  final IconData icon;
  const ButtomWidget(
      {super.key,
      required this.onpressed,
      required this.nameFunction,
      required this.icon,
      required this.onfile});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 500),
        width: onfile ? width * 0.4 : 0,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            IconButton(
                onPressed: onpressed,
                icon: Icon(
                  icon,
                  size: onfile ? height * 0.04 : 0,
                  color: Colors.green,
                )),
            Text(
              nameFunction,
              style: TextStyle(color: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}
