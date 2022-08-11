class Queen {
  const Queen({
    required this.location,
    required this.threatenedFields,
  });

  final int location;
  final List<int> threatenedFields;
}
