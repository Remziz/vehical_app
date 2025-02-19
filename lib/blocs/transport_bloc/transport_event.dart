part of 'transport_bloc.dart';

sealed class TransportEvent extends Equatable {
  const TransportEvent();

  @override
  List<Object> get props => [];
}

final class LoadTransportData extends TransportEvent {
  final String userId;

  const LoadTransportData(this.userId);

  @override
  List<Object> get props => [userId];
}
