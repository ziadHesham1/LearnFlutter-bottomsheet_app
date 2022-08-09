import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  var input = TextEditingController();
  String txt = 'nothing yet';
  var dummyTextWidget = Text('data');

  @override
  Widget build(BuildContext context) {
    return myPage();
  }

  Scaffold myPage() {
    var boxesList = [
      myContainer("1", Colors.green),
      myContainer("2", Colors.red),
      myContainer("3", Colors.blue),
      myContainer("4", Colors.yellow),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("stateful"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 30,
        ),
        children: boxesList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: bottomSheet,
        child: const Icon(Icons.add),
      ),
    );
  }

  Container myContainer(t, c) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: c,
        ),
        child: Text(
          txt,
          style: const TextStyle(fontSize: 30),
        ));
  }

  Widget myTextField() {
    return TextField(
      keyboardType: TextInputType.text,
      controller: input,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 5,
              color: Colors.green,
            ),
            borderRadius: BorderRadius.circular(60)),
        labelText: txt,
        hintText: "box name",
        suffixIcon: IconButton(
          onPressed: () {
            {
              setState(() {
                txt = input.text;
                print(txt);
              });
            }
          },
          icon: const Icon(Icons.done),
        ),
      ),
    );
  }

  void bottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return myTextField();
        });
  }
}
