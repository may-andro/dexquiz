import 'package:dependency_injector/dependency_injector.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SplashInfoWidget extends StatelessWidget {
  const SplashInfoWidget(
    this.receivedEvents, {
    required this.isEnabled,
    super.key,
  });

  final List<SetUpStatus> receivedEvents;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    if (!isEnabled) return const SizedBox.shrink();

    return ListView(
      shrinkWrap: true,
      children: [
        _ItemWidget(receivedEvents, setUpStatus: SetUpStatus.warmup),
        const Divider(color: Colors.grey),
        _ItemWidget(receivedEvents, setUpStatus: SetUpStatus.fetch),
        const Divider(color: Colors.grey),
        _ItemWidget(receivedEvents, setUpStatus: SetUpStatus.register),
        const Divider(color: Colors.grey),
        _ItemWidget(receivedEvents, setUpStatus: SetUpStatus.done),
      ],
    );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget(
    this.receivedStatusList, {
    required this.setUpStatus,
  });

  final List<SetUpStatus> receivedStatusList;
  final SetUpStatus setUpStatus;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: receivedStatusList.contains(setUpStatus)
          ? Icon(
              setUpStatus.icon,
              color: Color(context.isDarkMode ? 0xFFFFFFFF : 0xFF121212),
              size: 24,
            )
          : SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Color(context.isDarkMode ? 0xFFFFFFFF : 0xFF121212),
              ),
            ),
      title: Text(
        setUpStatus.label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.15,
          height: 24 / 16,
          color: Color(context.isDarkMode ? 0xFFFFFFFF : 0xFF121212),
        ),
      ),
    );
  }
}

extension _SetUpStatusMapper on SetUpStatus {
  IconData get icon {
    switch (this) {
      case SetUpStatus.warmup:
        return Icons.start_rounded;
      case SetUpStatus.fetch:
        return Icons.download_rounded;
      case SetUpStatus.register:
        return Icons.save_alt_rounded;
      case SetUpStatus.done:
        return Icons.download_done_rounded;
    }
  }

  String get label {
    switch (this) {
      case SetUpStatus.warmup:
        return 'Warming up the app  🔥';
      case SetUpStatus.fetch:
        return 'Fetching all dependencies  ⬇️';
      case SetUpStatus.register:
        return 'Registering the services  🎯';
      case SetUpStatus.done:
        return 'Setup is finished  🚀';
    }
  }
}
