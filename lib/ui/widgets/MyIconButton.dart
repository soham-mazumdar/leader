// import 'package:cbuddy/utils/ui_constants.dart';
// import 'package:flutter/material.dart';

// class MyIconButton extends StatelessWidget {
//   const MyIconButton({
//     Key key,
//     @required this.icon,
//     @required this.text,
//     @required this.marginTop,
//     @required this.marginBottom,
//     @required this.signIn,
//   }) : super(key: key);

//   final IconData icon;
//   final String text;
//   final double marginTop;
//   final double marginBottom;
//   final Function signIn;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: signIn,
//       child: Container(
//         // width: 200,
//         margin: EdgeInsets.fromLTRB(0,marginTop,0,marginBottom),
//         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//         decoration: BoxDecoration(
//           color: AppColors.four,
//           borderRadius: BorderRadius.circular(5)
//         ),
//         child: Wrap(
//           crossAxisAlignment: WrapCrossAlignment.center,
//           children: [
//             Icon(icon),
//             SizedBox(width: 10),
//             Text(text),
//           ],
//         )
//       ),
//     );
//   }
// }