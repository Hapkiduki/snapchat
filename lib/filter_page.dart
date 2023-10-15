import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key, required this.filter});

  final String filter;

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late final ArCoreFaceController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onArCoreViewCreated(ArCoreFaceController controller) {
    _controller = controller;
    _loadFilter();
  }

  Future<void> _loadFilter() async {
    final textureBytes = await rootBundle.load(widget.filter);
    _controller.loadMesh(
      textureBytes: textureBytes.buffer.asUint8List(),
      skin3DModelFilename: 'default',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtros'),
      ),
      body: ArCoreFaceView(
        onArCoreViewCreated: _onArCoreViewCreated,
        enableAugmentedFaces: true,
      ),
    );
  }
}
