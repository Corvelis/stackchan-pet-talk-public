import 'stackchan_protocol.dart';

abstract interface class StackchanClient {
  Stream<StackchanClientEvent> get events;

  Future<StackchanConnectionResult> testConnection(StackchanEndpoint endpoint);

  Future<void> connect(StackchanEndpoint endpoint);

  Future<void> disconnect();
}

class DummyStackchanClient implements StackchanClient {
  const DummyStackchanClient();

  @override
  Stream<StackchanClientEvent> get events => const Stream.empty();

  @override
  Future<StackchanConnectionResult> testConnection(
    StackchanEndpoint endpoint,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    return StackchanConnectionResult(
      ok: true,
      message: 'dummy connected',
      endpoint: endpoint,
    );
  }

  @override
  Future<void> connect(StackchanEndpoint endpoint) async {}

  @override
  Future<void> disconnect() async {}
}
