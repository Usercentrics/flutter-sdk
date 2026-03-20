import 'package:flutter/services.dart';

abstract class GetDpsMetadataBridge {
  const GetDpsMetadataBridge();

  Future<Map<String, dynamic>?> invoke({
    required MethodChannel channel,
    required String templateId,
  });
}

class MethodChannelGetDpsMetadata extends GetDpsMetadataBridge {
  const MethodChannelGetDpsMetadata();

  static const String _name = 'getDpsMetadata';

  @override
  Future<Map<String, dynamic>?> invoke({
    required MethodChannel channel,
    required String templateId,
  }) async {
    final result = await channel.invokeMethod<Map?>(_name, templateId);
    return result?.cast<String, dynamic>();
  }
}
