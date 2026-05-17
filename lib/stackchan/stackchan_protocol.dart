import '../models/stackchan_models.dart';

class StackchanEndpoint {
  const StackchanEndpoint({
    required this.host,
    required this.port,
    required this.mode,
  });

  final String host;
  final int port;
  final StackchanConnectionMode mode;

  Uri get websocketUri =>
      Uri(scheme: 'ws', host: host, port: port, path: '/ws');

  String get label => '$host:$port';
}

class StackchanConnectionResult {
  const StackchanConnectionResult({
    required this.ok,
    required this.message,
    this.endpoint,
  });

  final bool ok;
  final String message;
  final StackchanEndpoint? endpoint;
}

sealed class StackchanClientEvent {
  const StackchanClientEvent();
}

class StackchanStatusEvent extends StackchanClientEvent {
  const StackchanStatusEvent(this.status);

  final StackchanStatus status;
}

class StackchanSpeakerEvent extends StackchanClientEvent {
  const StackchanSpeakerEvent(this.identity);

  final SpeakerIdentity identity;
}
