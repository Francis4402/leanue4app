import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnue4service/Pages/chat_page.dart';


class Messsages extends StatelessWidget {
  const Messsages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) =>
        ListTile(
          onTap: () {
            Get.to(const ChatPage());
          },
          leading: const Stack(
            children: [
              CircleAvatar(
                child: Icon(Icons.person),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.white,
                ),
              )
            ],
          ),
          title: const Text("Other User"),
          subtitle: const Text("Hi"),
          trailing: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black45,
                radius: 15,
                child: Text(
                  "10",
                  style: TextStyle(fontSize: 11),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text("20:50")
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, child: const Icon(Icons.add),),
    );
  }
}
