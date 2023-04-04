class TaskCardModel {
  const TaskCardModel({
    required this.id,
    required this.formula,
    required this.task,
    required this.answer,
    required this.datetime,
    required this.type,
  });

  final String id;
  final String formula;
  final String task;
  final String answer;
  final String datetime;
  final String type;
}
