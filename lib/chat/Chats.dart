import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../shared/bottom_bar.dart';
import 'Conversation.dart';

class Chats extends StatelessWidget {
  final String? myId;
  Chats({Key? key,required this.myId}) : super(key: key);
  var firebaseStream = FirebaseFirestore.instance.collection("user").orderBy('last_message', descending: false).snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3D348B),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100,
        title: Row(
          children: [
            // IconButton(onPressed: () {}, icon: Icon(Icons.arrow_circle_left)),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Messages',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins'),
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
          stream: firebaseStream,
          builder:(ctx, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final int? len = snapshot.data?.docs.length;
            if (len!=null) {
              var docs = snapshot.data!.docs;
              List<ChatListType> chatList = docs.map((e) {
                var data = e.data();
                return ChatListType(name: data['name'],
                    id: data['id'],
                    last: data['last_message']);
              }).toList();
              chatList = chatList.where((element) => element.id!=myId).toList();
              chatList.sort((a,b){
                var x =  a.last.compareTo(b.last);
                return x==1?0:1;
              });
              int len2 = chatList.length;
              return Container(
                decoration: BoxDecoration(
                  color: Color(0xffF2F2F2),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Column(children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CupertinoSearchTextField(
                              borderRadius: BorderRadius.circular(15),
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            child: Icon(
                              Icons.edit_outlined,
                              color: Colors.black54,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 8,
                        child: ListView.builder(
                            itemCount: len2,
                            itemBuilder: (ctx, index) {
                              var data = chatList[index];
                              return myTile(name:data.name,message: "Message",asset: "",id:data.id,last:data.last,myId: myId);
                            })
                    )
                  ]),
                ),
              );
            }
            else{
              return const Center(child: Text("Null Returned"));
            }
          }),
      bottomNavigationBar: Bottom_Bar(), //defined in bottom_bar.dart
    );
  }
}

class ChatListType{
  String? name;
  String? id;
  Timestamp last=Timestamp.now();

  ChatListType({name, id, last}){
    this.name = name;
    this.id = id;
    this.last = last;
  }
}

class myTile extends StatelessWidget {
  final String? name;
  final String? message;
  final String asset;
  final String? id;
  final Timestamp? last;
  final String? myId;

  myTile({this.name, this.message="", this.asset = '',this.id, this.last,this.myId});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Container(
        child: ListTile(
          tileColor: Colors.white,
          leading:
              CircleAvatar(backgroundImage: AssetImage('Images/man_face.jpg')),
          title: Text('$name'),
          subtitle: Text('$message'),
          onTap: (){
            Navigator.push(context,MaterialPageRoute(
                builder: (context)=>Conversation(id: id,myId: myId)
            ));
          },
        ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 2,
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
