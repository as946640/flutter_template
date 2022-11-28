import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final String text;

  final child;

  const Loading({
    Key? key,
    this.text = '加载中···',
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child ??
                const CircularProgressIndicator(
                  value: null,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
