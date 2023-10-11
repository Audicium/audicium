import 'package:flutter/material.dart';

class CollapsibleTextBox extends StatefulWidget {
  const CollapsibleTextBox({
    super.key,
    this.description = '',
  });

  final String? description;

  @override
  State<CollapsibleTextBox> createState() => _CollapsibleTextBoxState();
}

class _CollapsibleTextBoxState extends State<CollapsibleTextBox> {
  bool _isExpanded = false;

  TextStyle descriptionStyle = const TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return widget.description != null && widget.description!.isNotEmpty
        ? GestureDetector(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_isExpanded)
                  Text(widget.description!, style: descriptionStyle)
                else
                  Text(
                    widget.description!,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: descriptionStyle,
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _isExpanded ? 'Show less' : 'Show more',
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          )
        : const Text('No description found');
  }
}
