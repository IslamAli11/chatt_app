import 'package:chatt_app/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatView extends StatefulWidget {
   const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Chats',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            color: Colors.white,
          )
        ],
      ),
      body: Column(
            
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Favorite contacts',
              style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage(model[index].image),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          model[index].name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  );
                },
              )),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight: Radius.circular(30)),
                  ),
                  child: ListView.separated(itemBuilder: (context, index) {
                    
                    return  ListTile(
                      trailing: Text(model[index].time,style: const TextStyle(fontWeight: FontWeight.bold),),
                     title:Text(model[index].name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                     subtitle: Text(model[index].message),
                     leading:CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(model[index].image),
      
                     ),
      
                    );
                  }, separatorBuilder:(context, index) => const SizedBox(height: 10,), itemCount: 20),
                ),
              ),
        ],
      ),
    );
  }
}
