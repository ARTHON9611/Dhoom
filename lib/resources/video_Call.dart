import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class videoCall extends StatelessWidget {
  final AgoraClient _client = AgoraClient(agoraConnectionData: AgoraConnectionData(appId: "0d32d3ca29e14768b26fec348600c899", channelName: "test",tempToken: "007eJxTYHA788nta9FV/uVLN0jf1HskufpKjM13F8nDc2fb9jMV+ZsqMBikGBulGCcnGlmmGpqYm1kkGZmlpSYbm1iYGRgkW1hayupcTGkIZGRonBPCwAiFID4LQ0lqcQkDAwBbIx7c"),
  enabledPermission: [Permission.camera,Permission.microphone]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [AgoraVideoViewer(client: _client),
      AgoraVideoButtons(client: _client)]),
    );
  }
}