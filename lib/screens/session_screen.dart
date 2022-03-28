import 'package:flutter/material.dart';
import '../data/sp_helper.dart';
import '../data/session.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({Key? key}) : super(key: key);

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  List<Session> sessions = [];
  final SPHelper helper = SPHelper();
  final TextEditingController descriptionTxt = TextEditingController();
  final TextEditingController durationTxt = TextEditingController();

  @override
  void initState() {
    helper.init().then((value) => updateScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Training Sessions'),
      ),
      body: ListView(children: getContent()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSessionDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Insert Traning Session'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: descriptionTxt,
                    decoration: InputDecoration(hintText: 'Description'),
                  ),
                  TextField(
                    controller: durationTxt,
                    decoration: InputDecoration(hintText: 'Duration'),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  descriptionTxt.text = '';
                  durationTxt.text = '';
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: saveSession,
                child: Text('Save'),
              )
            ],
          );
        });
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = '${now.year}-${now.month}-${now.day}';
    int id = helper.getCounter() + 1;
    Session newSession = Session(
        id, today, descriptionTxt.text, int.tryParse(durationTxt.text) ?? 0);
    helper.writeSession(newSession).then((_) {
      updateScreen();
      helper.setCounter();
    });
    descriptionTxt.text = '';
    durationTxt.text = '';
    Navigator.pop(context);
  }

  List<Widget> getContent() {
    List<Widget> titles = [];
    sessions.forEach((session) {
      titles.add(Dismissible(
        key: UniqueKey(),
        onDismissed: (_) {
          helper.deleteSession(session.id).then((value) => updateScreen());
        },
        child: ListTile(
          title: Text(session.description),
          subtitle: Text('${session.date}- duration: ${session.duration} min'),
        ),
      ));
    });

    return titles;
  }

  void updateScreen() {
    sessions = helper.getSessions();
    setState(() {});
  }
}
