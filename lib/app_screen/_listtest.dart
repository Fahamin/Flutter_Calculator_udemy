import 'package:flutter/material.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List View Test"),
        ),
        body: getAllList(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            debugPrint("clicked in fab button");
          },
          child: Icon(Icons.add),
          tooltip: 'Add More Items',
        )
        /* ListView(
        children: [
          ListTile(
            onTap: () {
              debugPrint("tap one item");
            },
            title: Text("one item"),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.ac_unit),
            subtitle: Text("Just Wow"),
          ),
          ListTile(
            trailing: Icon(Icons.ac_unit),
            title: Text("Two item"),
            leading: Icon(Icons.ac_unit),
            subtitle: Text("Just now"),
          )
        ],
      ),*/
        );
  }

  void _ShowSnackBar(BuildContext context,String item)
  {
    var snackBar = SnackBar(content: Text("$item"),
    action: SnackBarAction(
      label: "undo",
      onPressed: (){
        debugPrint('UNDO Btn Clicked');
      },
    ),);
    ScaffoldMessenger.of(context)
        .showSnackBar(snackBar);

  }

  List<String> getListElements() {
    var items = List<String>.generate(1000, (index) => " item $index");
    return items;
  }

  Widget getAllList() {
    var listItems = getListElements();

    var listView = ListView.builder(itemBuilder: (context, itemBuilder) {
      return ListTile(
        title: Text(listItems[itemBuilder]),
        leading: Icon(Icons.arrow_right),
        onTap: () {
          _ShowSnackBar(context,listItems[itemBuilder]);
          /*debugPrint('${listItems[itemBuilder]} is tapped');*/
        },
      );
    });
    return listView;
  }
}
