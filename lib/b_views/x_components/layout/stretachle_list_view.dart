// import 'package:flutter/material.dart';
//
// class StretchableListView extends StatefulWidget {
//   final List<Widget> children;
//
//   StretchableListView({required this.children});
//
//   @override
//   _StretchableListViewState createState() => _StretchableListViewState();
// }
//
// class _StretchableListViewState extends State<StretchableListView> {
//   final _scrollController = ScrollController();
//   double _stretchFactor = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//   }
//
//   @override
//   void dispose() {
//     _scrollController.removeListener(_onScroll);
//     super.dispose();
//   }
//
//   void _onScroll() {
//     final maxExtent = _scrollController.position.maxScrollExtent;
//     final currentExtent = _scrollController.offset;
//     final stretchDelta = maxExtent - currentExtent;
//     final stretchFactor = stretchDelta.clamp(0.0, 100.0) / 100.0;
//     setState(() {
//       _stretchFactor = stretchFactor;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       controller: _scrollController,
//       physics: BouncingScrollPhysics(),
//       itemCount: widget.children.length,
//       itemBuilder: (context, index) {
//         final child = widget.children[index];
//         return AnimatedContainer(
//           duration: Duration(milliseconds: 200),
//           height: child.preferredSize.height * (1.0 + _stretchFactor),
//           child: child,
//         );
//       },
//     );
//   }
// }
