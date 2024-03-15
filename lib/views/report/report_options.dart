class ReportOptions {
  int id;
  String reason;
  bool isSelected;

  ReportOptions({
    required this.id,
    required this.reason,
    this.isSelected = false,
  });
}
