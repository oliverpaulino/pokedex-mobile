import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'connectivity_providers.dart';

/// Inicia el monitor global de conectividad sin bloquear la UI.
class ConnectivityBootstrap extends ConsumerStatefulWidget {
  final Widget child;

  const ConnectivityBootstrap({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<ConnectivityBootstrap> createState() =>
      _ConnectivityBootstrapState();
}

class _ConnectivityBootstrapState extends ConsumerState<ConnectivityBootstrap> {
  @override
  void initState() {
    super.initState();
    unawaited(ref.read(connectivityMonitorProvider).start());
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
