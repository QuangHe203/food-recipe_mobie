import 'package:flutter/material.dart';

class FilterContainer extends StatefulWidget {
  final String imageUrl;
  final String text;
  final double width;
  final bool isChecked;
  final Function(bool) onToggled;

  const FilterContainer({
    Key? key,
    required this.imageUrl,
    required this.text,
    required this.width,
    required this.isChecked,
    required this.onToggled,
  }) : super(key: key);

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<FilterContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onToggled(!widget.isChecked);
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
            child: Container(
              width: widget.width,
              height: 58,
              decoration: BoxDecoration(
                color: widget.isChecked ? Color(0xFFFBDD41) : Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Color(0xFFFBDD41),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 5, 5, 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: widget.isChecked
                          ? Icon(
                        Icons.check,
                        size: 48,
                        color: Colors.white,
                      )
                      :
                      Image.network(
                        widget.imageUrl,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
