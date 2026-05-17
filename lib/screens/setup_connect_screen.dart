import 'package:flutter/material.dart';

import '../localization/app_localizations.dart';
import '../models/stackchan_models.dart';
import '../stackchan/stackchan_client.dart';
import '../stackchan/stackchan_protocol.dart';
import '../theme/app_theme.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/status_pill.dart';
import 'home_conversation_screen.dart';

class SetupConnectScreen extends StatefulWidget {
  const SetupConnectScreen({super.key});

  static const routeName = '/setup';

  @override
  State<SetupConnectScreen> createState() => _SetupConnectScreenState();
}

class _SetupConnectScreenState extends State<SetupConnectScreen> {
  final _hostController = TextEditingController(text: '192.168.4.1');
  final _portController = TextEditingController(text: '8080');
  final StackchanClient _client = const DummyStackchanClient();
  StackchanConnectionMode _mode = StackchanConnectionMode.softAp;
  StackchanConnectionStatus _status = StackchanConnectionStatus.disconnected;

  @override
  void dispose() {
    _hostController.dispose();
    _portController.dispose();
    super.dispose();
  }

  Future<void> _testConnection() async {
    setState(() => _status = StackchanConnectionStatus.testing);
    final endpoint = StackchanEndpoint(
      host: _hostController.text.trim(),
      port: int.tryParse(_portController.text.trim()) ?? 8080,
      mode: _mode,
    );
    await _client.testConnection(endpoint);
    if (!mounted) {
      return;
    }
    setState(() => _status = StackchanConnectionStatus.connected);
  }

  void _continueToHome() {
    Navigator.of(
      context,
    ).pushReplacementNamed(HomeConversationScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return AppScaffold(
      title: 'stackchan-talk',
      child: ListView(
        padding: const EdgeInsets.fromLTRB(18, 8, 18, 28),
        children: [
          Text(
            strings.setupTitle,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 6),
          Text(
            strings.setupDescription,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.subtext),
          ),
          const SizedBox(height: 20),
          SegmentedButton<StackchanConnectionMode>(
            segments: const [
              ButtonSegment(
                value: StackchanConnectionMode.softAp,
                icon: Icon(Icons.wifi_tethering_rounded),
                label: Text('SoftAP'),
              ),
              ButtonSegment(
                value: StackchanConnectionMode.sta,
                icon: Icon(Icons.router_rounded),
                label: Text('Wi-Fi IP'),
              ),
            ],
            selected: {_mode},
            onSelectionChanged: (value) {
              setState(() {
                _mode = value.first;
                _hostController.text = _mode == StackchanConnectionMode.softAp
                    ? '192.168.4.1'
                    : '192.168.1.42';
              });
            },
          ),
          const SizedBox(height: 18),
          TextField(
            controller: _hostController,
            decoration: const InputDecoration(
              labelText: 'Host',
              prefixIcon: Icon(Icons.dns_rounded),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _portController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Port',
              prefixIcon: Icon(Icons.tag_rounded),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _status == StackchanConnectionStatus.testing
                      ? null
                      : _testConnection,
                  icon: const Icon(Icons.cable_rounded),
                  label: Text(strings.connectionTest),
                ),
              ),
              const SizedBox(width: 12),
              StatusPill(
                label: _statusLabel(context),
                color: _statusColor,
                icon: _statusIcon,
              ),
            ],
          ),
          const SizedBox(height: 22),
          _RecentConnections(
            items: const ['192.168.4.1:8080', '192.168.1.42:8080'],
            onSelect: (endpoint) {
              final parts = endpoint.split(':');
              setState(() {
                _hostController.text = parts.first;
                _portController.text = parts.last;
              });
            },
          ),
          const SizedBox(height: 28),
          ElevatedButton.icon(
            onPressed: _continueToHome,
            icon: const Icon(Icons.arrow_forward_rounded),
            label: Text(strings.goToConversation),
          ),
        ],
      ),
    );
  }

  String _statusLabel(BuildContext context) {
    final strings = context.strings;
    return switch (_status) {
      StackchanConnectionStatus.disconnected => strings.notConnected,
      StackchanConnectionStatus.testing => strings.testing,
      StackchanConnectionStatus.connected => strings.dummyConnected,
    };
  }

  Color get _statusColor {
    return switch (_status) {
      StackchanConnectionStatus.disconnected => AppColors.subtext,
      StackchanConnectionStatus.testing => AppColors.yellow,
      StackchanConnectionStatus.connected => AppColors.mint,
    };
  }

  IconData get _statusIcon {
    return switch (_status) {
      StackchanConnectionStatus.disconnected => Icons.link_off_rounded,
      StackchanConnectionStatus.testing => Icons.sync_rounded,
      StackchanConnectionStatus.connected => Icons.check_circle_rounded,
    };
  }
}

class _RecentConnections extends StatelessWidget {
  const _RecentConnections({required this.items, required this.onSelect});

  final List<String> items;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strings.recentConnections,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          for (final item in items)
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.history_rounded),
              title: Text(item),
              trailing: const Icon(Icons.north_west_rounded, size: 18),
              onTap: () => onSelect(item),
            ),
        ],
      ),
    );
  }
}
