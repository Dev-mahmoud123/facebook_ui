import 'package:facebook_responsive_ui/config/palette.dart';
import 'package:flutter/material.dart';

class CreateRoomButton extends StatelessWidget {
  const CreateRoomButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          side: BorderSide(
            width: 3.0,
            color: Colors.blueAccent[100],
          ),
          textStyle: const TextStyle(color: Palette.facebookBlue)),
      onPressed: () {},
      child: Row(
        children: [
          ShaderMask(
              shaderCallback: (Rect bounds) =>
                  Palette.createRoomGradient.createShader(bounds),
              child: const Icon(
                Icons.video_call,
                color: Colors.white,
                size: 30,
              )),
          const SizedBox(
            width: 4.0,
          ),
          const Text('Create\nRoom')
        ],
      ),
    );
  }
}