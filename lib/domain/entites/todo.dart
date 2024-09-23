class TodoEntity {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;

  TodoEntity(
      {required this.id,
      required this.title,
      required this.description,
      this.isCompleted = false});
}
