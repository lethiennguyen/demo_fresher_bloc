// enum EnumMyTask {
//   all,
//   workTaskAssigned,
//   myWorkTask,
//   workTaskAssignment,
//   workTaskTracking
// }
//
// class EnumMyTaskHelper {
//   String getType(EnumMyTask type) {
//     switch (type) {
//       case EnumMyTask.workTaskAssigned:
//         return "WorkTaskAssigned";
//       case EnumMyTask.all:
//         return '';
//       case EnumMyTask.myWorkTask:
//         return "MyWorkTask";
//       case EnumMyTask.workTaskAssignment:
//         return "WorkTaskAssignment";
//       case EnumMyTask.workTaskTracking:
//         return "WorkTaskTracking";
//     }
//   }
//
//   Map<EnumMyTask, MapEntry<String, String>> get getTitle => {
//         EnumMyTask.workTaskAssigned:
//             const MapEntry("WorkTaskAssigned", "Tất cả"),
//         EnumMyTask.myWorkTask: const MapEntry("MyWorkTask", "Theo tên"),
//         EnumMyTask.workTaskAssignment:
//             const MapEntry("WorkTaskAssignment", "Tồn kho"),
//         EnumMyTask.workTaskTracking: const MapEntry(
//             "WorkTaskTracking", LocaleKeys.my_task_work_task_tracking),
//       };
// }
