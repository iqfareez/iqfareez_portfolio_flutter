import 'package:flutter/material.dart';
import 'package:tap_builder/tap_builder.dart';

class AnimatedStateButton extends StatelessWidget {
  const AnimatedStateButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTapBuilder(
      onTap: () {},
      builder: (context, state, cursorLocation, cursorAlignment) {
        cursorAlignment = state == TapState.hover
            ? Alignment(-cursorAlignment.x, -cursorAlignment.y)
            : Alignment.center;
        return AnimatedContainer(
          height: 200,
          transformAlignment: Alignment.center,
          transform: Matrix4.rotationX(-cursorAlignment.y * 0.2)
            ..rotateY(cursorAlignment.x * 0.2)
            ..scale(
              state == TapState.hover ? 0.94 : 1.0,
            ),
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: state == TapState.pressed ? 0.6 : 0.8,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1607030298395-ed979957b555?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMXx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
                    fit: BoxFit.cover,
                  ),
                ),
                AnimatedContainer(
                  height: 200,
                  transformAlignment: Alignment.center,
                  transform: Matrix4.translationValues(
                    cursorAlignment.x * 3,
                    cursorAlignment.y * 3,
                    0,
                  ),
                  duration: const Duration(milliseconds: 200),
                  child: Center(
                    child: Text(
                      'AnimatedTapBuilder',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 200),
                    alignment:
                        Alignment(-cursorAlignment.x, -cursorAlignment.y),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.01),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(
                                state == TapState.pressed ? 0.5 : 0.0),
                            blurRadius: 200,
                            spreadRadius: 130,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
