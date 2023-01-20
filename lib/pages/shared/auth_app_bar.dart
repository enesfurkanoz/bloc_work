import 'package:flutter/material.dart';
import '../../../core/extensions/context_extentions.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: context.heightFraction(3),
            flexibleSpace: const FlexibleSpaceBar(
              background: AspectRatio(aspectRatio: 2/3,child: Image(fit: BoxFit.cover,image: NetworkImage('https://picsum.photos/200/300'),),),
            ),
          );
  }
}