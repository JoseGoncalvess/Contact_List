import 'package:flutter/material.dart';

class ShowDailog {
  Future showdailogg({
    required BuildContext context,
    required String contact,
    required PageRoute page,
    required Function delet,
  }) {
    var height = MediaQuery.sizeOf(context).height;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          contact,
          textAlign: TextAlign.center,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: Text(
          'O que deseja fazer:',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: height * 0.03,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.green,
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, page) == false;
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.edit_outlined), Text('Editar')],
              )),
          ElevatedButton(
              onPressed: () => {Navigator.pop(context, true), delet},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.delete_forever), Text('Excluir')],
              )),
          ElevatedButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.close_rounded), Text('Cancelar')],
              ))
        ],
      ),
    );
  }
}
