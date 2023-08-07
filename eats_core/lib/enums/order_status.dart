import 'package:json_annotation/json_annotation.dart';

enum OrderStatus {
  @JsonValue('under_processing')
  underProcessing,
  @JsonValue('accepted')
  accepted,
  @JsonValue('completed')
  completed,
  @JsonValue('rejected')
  rejected,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('deleted')
  deleted,
}
