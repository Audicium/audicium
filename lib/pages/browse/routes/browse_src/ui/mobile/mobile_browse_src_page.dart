import 'package:audicium/constants/utils.dart';
import 'package:audicium/pages/browse/routes/browse_src/ui/shared/book_display_list.dart';
import 'package:audicium_extension_base/audicium_extension_base.dart';
import 'package:flutter/material.dart';

class MobileBrowseSrcPage extends StatefulWidget {
  const MobileBrowseSrcPage({
    super.key,
  });

  @override
  State<MobileBrowseSrcPage> createState() => _MobileBrowseSrcPageState();
}

class _MobileBrowseSrcPageState extends State<MobileBrowseSrcPage> {
  late final ExtensionController controller = get<ExtensionController>();
  late final String title = '';

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  // final isGridView = true.obs;
  // final gridCount = 2.obs;

  @override
  Widget build(BuildContext context) {
    // appBar: AppBar(title: Text(title)),
    return Column(
      children: [
        AppBar(title: const Text('Browse Source')),
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: controller.searchController,
            onSubmitted: (value) async => controller.searchOrRefresh(),
            decoration: const InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: BookDisplayList(
            source: controller,
            gridCount: 3,
          ),
        ),
      ],
    );
  }
}
