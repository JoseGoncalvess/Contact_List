import 'package:flutter/material.dart';

class AppCustomBar extends StatefulWidget {
  const AppCustomBar({super.key});

  @override
  State<AppCustomBar> createState() => _AppCustomBarState();
}

class _AppCustomBarState extends State<AppCustomBar> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Container(
      width: width,
      height: height * 0.12,
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.person,
            color: Colors.white,
            size: width * 0.12,
          ),
          Text(
            "Contatos",
            style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.07,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: () {
                // NewContactController().getImage();
              },
              icon: Icon(
                Icons.menu_rounded,
                size: width * 0.08,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
