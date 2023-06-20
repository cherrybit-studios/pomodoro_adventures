class GearCatalog<T> {
  const GearCatalog({
    required this.name,
    required this.gears,
    required this.description,
  });

  final String name;
  final String description;
  final List<T> gears;
}
