import 'package:contact_list/controllers/homecontroller.dart';
import 'package:contact_list/models/contact_model.dart';

import 'package:flutter/material.dart';

import 'new_contatact/new_contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Homecontroller();

  @override
  void initState() {
    super.initState();
    _controller.getcontacts();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            Container(
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    child: Text(
                      textAlign: TextAlign.left,
                      "Contatos",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.07,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _controller.getcontacts();
                      },
                      icon: Icon(
                        Icons.menu_rounded,
                        size: width * 0.08,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: _controller,
                builder: (context, value, child) {
                  return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        var data = value;
                        return ListTile(
                          onLongPress: () =>
                              _controller.deletcontatc(index: index),
                          leading: CircleAvatar(),
                          title: Text(data[index].name),
                          subtitle: Text(data[index].number),
                          trailing: Icon(Icons.call),
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewContact(),
                ));
          },
          child: Icon(Icons.add_call)),
    );
  }
}
