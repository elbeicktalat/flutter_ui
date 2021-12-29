import 'package:flutter/material.dart';
import 'package:flutter_ui/chats/chat1/models/conversion.dart';
import 'package:flutter_ui/chats/chat1/models/massage.dart';
import 'package:flutter_ui/chats/chat1/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class Chat1Conversation extends StatefulWidget {
  const Chat1Conversation({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<Chat1Conversation> createState() => _Chat1ConversationState();
}

class _Chat1ConversationState extends State<Chat1Conversation> {
  final Conversion _conversion = Provider.getConversions().first;
  final Key _formKey = GlobalKey<FormState>();
  late final TextEditingController _editingController;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _editingController.dispose();
  }

  final Gradient _gradient = const LinearGradient(
    colors: [
      Color(0xffef1385),
      Color(0xfff12280),
      Color(0xfff63d76),
      Color(0xfff84f70),
    ],
    stops: [
      0.2,
      0.4,
      0.6,
      0.8,
    ],
  );

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    return Theme(
      data: ThemeData(
        colorScheme: theme.colorScheme.copyWith(
          primary: const Color(0xfff84f70),
          secondary: const Color(0xffef1385),
        ),
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: _gradient,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chevron_left, size: 32.0),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                )
              ],
              centerTitle: true,
              title: Text(
                _conversion.contact.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            body: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: _conversion.massages.length,
                    itemBuilder: (BuildContext context, int position) {
                      if (_conversion.massages[position].sender.name ==
                          widget.id) {
                        return _leftMassage(_conversion.massages[position]);
                      } else {
                        return _rightMassage(_conversion.massages[position]);
                      }
                    },
                  ),
                ),
                _sendMassageForm(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _leftMassage(Massage massage) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                width: 75.0,
                height: 75.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(massage.sender.avatar),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    massage.sender.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    massage.sender.phone,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              massage.dateTime,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Text(
              massage.body,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rightMassage(Massage massage) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    massage.sender.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    massage.sender.phone,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16.0),
              Container(
                width: 75.0,
                height: 75.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(massage.sender.avatar),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text(
              massage.dateTime,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Text(
              massage.body,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sendMassageForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: Form(
        key: _formKey,
        child: Stack(
          children: [
            TextFormField(
              controller: _editingController,
              decoration: InputDecoration(
                hintText: 'Write massage ...',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Transform.translate(
                offset: const Offset(-8, 6),
                child: Container(
                  width: 35.0,
                  height: 35.0,
                  decoration: BoxDecoration(
                    gradient: _gradient,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send, color: Colors.white, size: 16.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
