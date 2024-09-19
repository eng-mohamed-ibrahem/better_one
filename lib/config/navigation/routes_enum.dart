enum Routes {
  splash("/", "splash"),
  onboarding("/onboarding", "onboarding"),
  login("login", "login"),
  forgotPassword("forgot-password", "forgot_password"),
  // resetPassword("reset-password", "reset_password"),
  signup("signup", "signup"),
  home("/home", "home"),
  settings("settings", "settings"),
  task("task", "task"),
  taskDetail("task-detail/id=:id", "task_detail"),
  profile("profile", "profile"),
  notificationSetting("notification-setting", "notification_setting"),
  searchSetting("search-setting", "search_setting"),
  search("search", "search"),
  notification("notification", "notification"),
  changePassword("change-password", "change_password"),
  changeEmail("change-email", "change_email"),
  changeName("change-name", "change_name"),
  feedback("feedback", "feedback"),
  feedbackDetail("feedback-detail", "feedback_detail");

  final String path;
  final String name;

  const Routes(this.path, this.name);
}
