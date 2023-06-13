part of 'map_cubit.dart';

class MapState extends Equatable {
  const MapState({
    this.selected,
  });

  final LocationId? selected;

  @override
  List<Object?> get props => [selected];
}
