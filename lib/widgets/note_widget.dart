import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Color(0xffFFCD7A),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Flutter Tips",style: TextStyle(fontSize: 20),),
              IconButton(onPressed: (){}, icon: Icon(Icons.delete))
            ],
          ),
          Text("Build your career with Ashraf Sherif",style: TextStyle(fontSize: 25),),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Nov 25/11/2002"),
            ],
          )
        ],
      ),
    );
  }
}
