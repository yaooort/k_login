
import 'package:flutter/material.dart';

class CircularSwitchTab extends StatefulWidget {
  final List<String> options;
  final int value;
  final ValueChanged<int> onChanged;
  final double itemWidth;
  final double itemHeight;
  final Color selectedColor;
  final Color backgroundColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Duration duration;
  final Curve curve;
  final TextStyle textStyle;

  const CircularSwitchTab({
    super.key,
    required this.options,
    required this.value,
    required this.onChanged,
    this.itemWidth = 150,
    this.itemHeight = 50,
    this.selectedColor = Colors.blue,
    this.backgroundColor = Colors.grey,
    this.selectedTextColor = Colors.white,
    this.unselectedTextColor = Colors.grey,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  }) : assert(options.length == 2, '必须提供2个选项');

  @override
  State<CircularSwitchTab> createState() => _CircularSwitchTabState();
}

class _CircularSwitchTabState extends State<CircularSwitchTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.itemHeight,
      decoration: BoxDecoration(
        color: widget.backgroundColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(widget.itemHeight / 2),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: widget.duration,
            curve: widget.curve,
            left: widget.value * widget.itemWidth,
            child: Container(
              width: widget.itemWidth,
              height: widget.itemHeight,
              decoration: BoxDecoration(
                color: widget.selectedColor,
                borderRadius: _buildBorderRadius(widget.value),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: widget.options.asMap().entries.map((entry) {
              final index = entry.key;
              final text = entry.value;
              return _buildTabItem(index, text);
            }).toList(),
          ),
        ],
      ),
    );
  }

  BorderRadius _buildBorderRadius(int selectedIndex) {
    return BorderRadius.only(
      topLeft: selectedIndex == 0
          ? Radius.circular(widget.itemHeight / 2)
          : Radius.zero,
      bottomLeft: selectedIndex == 0
          ? Radius.circular(widget.itemHeight / 2)
          : Radius.zero,
      topRight: selectedIndex == 1
          ? Radius.circular(widget.itemHeight / 2)
          : Radius.zero,
      bottomRight: selectedIndex == 1
          ? Radius.circular(widget.itemHeight / 2)
          : Radius.zero,
    );
  }

  Widget _buildTabItem(int index, String text) {
    return GestureDetector(
      onTap: () => widget.onChanged(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: widget.itemWidth,
        height: widget.itemHeight,
        alignment: Alignment.center,
        child: Text(
          text,
          style: widget.textStyle.copyWith(
            color: widget.value == index
                ? widget.selectedTextColor
                : widget.unselectedTextColor,
          ),
        ),
      ),
    );
  }
}