import 'package:flutter/material.dart';
import 'package:flutter_ui/chats/chat1/models/conversion.dart';
import 'package:flutter_ui/chats/chat1/provider.dart';

class Inbox extends StatelessWidget {
  Inbox({Key? key}) : super(key: key);

  final List<List<Conversion>> _conversionsGroup = [
    Provider.getConversions(),
    Provider.getConversions(),
    Provider.getConversions(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(18.0),
      itemCount: _conversionsGroup.length,
      itemBuilder: (BuildContext context, int position) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 18.0),
              child: Text(
                _conversionsGroup[position][position].massages.last.dateTime,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ..._conversions(position),
          ],
        );
      },
    );
  }

  List<Widget> _conversions(int position) {
    return List.generate(_conversionsGroup[position].length, (index) {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _avatar(position, index),
                  const SizedBox(width: 16.0),
                  _body(position, index),
                ],
              ),
              Text(
                _conversionsGroup[position][index].massages.last.dateTime,
                style: const TextStyle(
                  color: Color(0xffef1385),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _avatar(int position, int index) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(
              _conversionsGroup[position][index].contact.avatar),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _body(int position, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _conversionsGroup[position][index].contact.name,
          maxLines: 1,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 180,
          child: Text(
            _conversionsGroup[position][index].massages.last.body,
            maxLines: 1,
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ),
      ],
    );
  }
}
