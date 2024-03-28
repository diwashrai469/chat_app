class UrlRouteString {
  String attendance = "/attendance?user_id=";
  String singleAttendance = "/attendance?_id=";
  String manualEntry = "/attendance/manualEntry";
  String login = "/users/login";
  String resetPassword = "/users/reset-pw";
  String payroll = "/payroll";
  String paySlip = "/payslip?user_id=";
  String assignedTask = "/tasks?assigned_to=";
  String createdByMe = "/tasks?created_by=";
  String createTask = "/tasks";
  String deleteTask = "/tasks/operations/delete";
  String changeStatusToClose = "/tasks/operations/markAsClose";
  String changeStatusToOpen = "/tasks/operations/markAsOpen";
  String editTask = "/tasks/operations";
  String getUser = "/users";
  String getSingleUser = "/users?_id=";
  String clockIn = "/attendance/clockin";
  String clockOut = "/attendance/clockout";
  String checkClockinStatus = "/attendance/check-clock-in-status";
  String userConfig = "/users/config";
  String holidays = "/settings/holidays";
  String timeOff = "/attendance/timeoffs?user_id=";
  String deleteTimeOff = "/attendance/";
  String leaveType = "/settings/leave-types";
  String applyTimeOff = "/attendance/applyForTimeOff";
  String singleHoliday = "/settings/holidays?_id=";
  String notification = "/users/notifications";
  String todayWorklogs = "/worklog/my/today";
  String addWorklogs = "/worklog/addUpdateTodaysWorkLog";
  String allWorkLogs = "/worklog";
  String singleWorkLogs = "/worklog?_id=";
  String checkAppVersion = "/misc/checkAppVersion?version=";
  String salaryCalculation = "/payroll/salaryCalculate";
  String misc = "/misc/getPresignedURL?filename=";

  //admin
  String approveRejectTimeOff = "/attendance/timeoffs/approveRejectTimeOff";
  String getRole = "/settings/roles";
  String getPolicy = "/settings/policies";
  String todayAttendence = "/reports/admin/adminGetAttendanceToday";
  String overview = "/reports/admin/overview";
  String adminPendingTimeoffs = "/reports/admin/adminPendingTimeoffs";
  String adminGetAttendanceToday = "/reports/admin/adminGetAttendanceToday";
  String adminGetWorklogToday = "/reports/admin/adminGetWorklogToday";
  String adminGetSingleWorklogToday =
      "/reports/admin/adminGetWorklogToday?_id=";
  String adminInviteMember = "/settings/team/invite";
  String adminManualEntries = "/attendance?is_manual=true";
  String adminManualEntriesStatus =
      "/attendance/manualEntry/approveRejectManualEntry";
}
