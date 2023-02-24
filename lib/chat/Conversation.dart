import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Conversation extends StatefulWidget {
  final String? id;
  final String? myId;
  const Conversation({Key? key, required this.id, required this.myId})
      : super(key: key);
  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  String? id;
  String? myId;
  @override
  Widget build(BuildContext context) {
    var firebaseStream = FirebaseFirestore.instance
        .collection("message")
        .where("to", whereIn: ["${widget.id}", "${widget.myId}"]).snapshots();
    return Scaffold(
      body: StreamBuilder(
          stream: firebaseStream,
          builder: (ctx,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            var len = snapshot.data?.docs.length;
            if (len != null) {
              var docs = snapshot.data!.docs;
              List<ChatType> chatList = docs.map((e) {
                var data = e.data();
                return ChatType(
                    from: data['from'],
                    to: data['to'],
                    message: data['message'],
                    time: data['time']);
              }).toList();
              chatList = chatList
                  .where((element) =>
                      (element.to == widget.id || element.from == widget.id))
                  .toList();
              chatList.sort((a, b) {
                var x = a.time.compareTo(b.time);
                return x == 1 ? 1 : 0;
              });
              int len2 = chatList.length;
              return Column(
                children: [
                  SizedBox(height: 40),
                  Padding(
                    // top profile and name
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: const [
                        CircleAvatar(
                          radius: 35,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'George Hawkings',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    //chat section
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                        color: Color(0xffF2F2F2),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: ListView.builder(
                                itemCount: len2,
                                itemBuilder: (ctx, index) {
                                  // var doc = snapshot.data!.docs[index];
                                  // var data = doc.data();
                                  // print(data.toString());
                                  return ChatBubble(
                                      chatList[index].from != widget.myId
                                          ? 0
                                          : 1,
                                      chatList[index].message,
                                      chatList[index].time);
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    child: inputField(id: widget.id, myId: widget.myId),
                  ), //place to enter text
                ],
              );
            } //if statement
            else {
              return const Center(child: Text("Null Returned"));
            }
          }),
    );
  }
}

class inputField extends StatefulWidget {
  final String? id;
  final String? myId;
  @override
  const inputField({Key? key, required this.id, required this.myId})
      : super(key: key);
  State<inputField> createState() => _inputField();
}

class _inputField extends State<inputField> {
  final _controller = TextEditingController();
  void sendMessage() async {
    // print(message);
    await FirebaseFirestore.instance.collection('message').add({
      "message": message,
      "to": widget.id,
      "from": widget.myId,
      "time": Timestamp.now()
    });
    _controller.clear();
  }

  String message = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.8,
            child: CupertinoTextField(
              controller: _controller,
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              placeholder: 'Message...',
              onChanged: (value) {
                message = value;
              },
              decoration: BoxDecoration(
                  color: Color(0xff7678ED),
                  borderRadius: BorderRadius.circular(20)),
              placeholderStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 14),
            ),
          ),
          IconButton(
              onPressed: () {
                sendMessage();
              },
              icon: Icon(Icons.send))
        ],
      ),
    );
  }
}

class ChatType {
  String? from;
  String? to;
  String? message;
  Timestamp time = Timestamp.now();

  ChatType({from, to, message, time}) {
    this.from = from;
    this.to = to;
    this.time = time;
    this.message = message;
  }
}

Widget ChatBubble(int side, String? text, Timestamp time) {
  return Row(
    mainAxisAlignment:
        side == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 10, left: 10),
        child: Column(
          crossAxisAlignment:
              side == 0 ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: side == 0
                  ? BoxDecoration(
                      color: Color(0xff3D348B),
                      borderRadius: BorderRadius.circular(30))
                  : BoxDecoration(
                      color: Color(0xff7678ED),
                      borderRadius: BorderRadius.circular(30)),
              child: Text("$text",
                  style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              child: Text(
                "${time.toDate().toString()}",
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            )
          ],
        ),
      )
    ],
  );
}
