enum Routes {
  splash("/", "splash"),
  onboarding("/onboarding", "onboarding"),
  login("login", "login"),
  forgotPassword("forgot-password", "forgot_password"),
  signup("signup", "signup"),
  home("/home", "home"),
  settings("settings", "settings"),
  createTask("create-task", "create_task"),
  taskDetails("task-detail/id=:id", "task_detail"),
  sharedTask("shared-task/:id", "shared_task"),
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
