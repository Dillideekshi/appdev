import 'dart:convert';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VideoCall extends StatefulWidget {
  final String channelName;

  VideoCall({required this.channelName});

  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  late final AgoraClient _client;
  bool _loading = true;
  String tempToken = "";

  @override
  void initState() {
    super.initState();
    getToken();
  }

  Future<void> getToken() async {
    final apiUrl =
        "https://agora-node-tokenserver-1.davidcaleb.repl.co/access_token?channelName=${widget.channelName}";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          tempToken = data["token"];
        });

        _client = AgoraClient(
          agoraConnectionData: AgoraConnectionData(
            appId: "d3e6d265bb04493bbe1e2388d3e2754a",
            tempToken: "007eJxTYFh+6UzNPMsil5/xtpp58fnZQtOXeO5P7ov4K5Ib/OXiygQFhhTjVLMUIzPTpCQDExNL46SkVMNUI2MLC6C4kbmpSeLtjtrUhkBGBpuutYyMDBAI4rMxJBYUpKSWMTAAALPWINY=",
            channelName: "appdev",
          ),
          enabledPermission: [Permission.camera, Permission.microphone],
        );

        Future.delayed(Duration(seconds: 1)).then(
          (value) => setState(() => _loading = false),
        );
      } else {
        // Handle error, show error message or retry logic
        print("Failed to fetch token: ${response.statusCode}");
      }
    } catch (e) {
      // Handle network or other errors
      print("Error fetching token: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  AgoraVideoViewer(
                    client: _client,
                  ),
                  AgoraVideoButtons(client: _client),
                ],
              ),
      ),
    );
  }
}
