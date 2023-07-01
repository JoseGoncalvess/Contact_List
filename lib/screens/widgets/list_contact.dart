import 'package:flutter/material.dart';

class ListContact extends StatefulWidget {
  final bool activi;
  final Function favorpress;
  final Function geralPress;
  const ListContact(
      {super.key,
      required this.activi,
      required this.favorpress,
      required this.geralPress});

  @override
  State<ListContact> createState() => _ListContactState();
}

class _ListContactState extends State<ListContact> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return AnimatedContainer(
      width: widget.activi ? width * 0.46 : 0,
      height: widget.activi ? height * 0.14 : 0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
      decoration: BoxDecoration(
          color: Colors.green[900],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(22), bottomLeft: Radius.circular(22))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
              onTap: () => widget.favorpress,
              child: SizedBox(
                height: height * 0.045,
                width: width * 0.4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    Text(
                      'Favoritos',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: widget.activi ? height * 0.025 : 0),
                    )
                  ],
                ),
              )),
          GestureDetector(
            onTap: () => widget.geralPress,
            child: SizedBox(
              height: height * 0.045,
              width: width * 0.4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.contacts_rounded,
                    color: Colors.white,
                  ),
                  Text(
                    'Geral',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: widget.activi ? height * 0.025 : 0),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
