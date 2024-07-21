enum Routes {
  splash("/", "splash"),
  onboarding("/onboarding", "onboarding"),
  home("/home", "home"),
  login("/login", "login"),
  profile("/profile", "profile"),
  settings("settings", "settings"),
  accountSetting("/account-setting", "account_setting"),
  task("task", "task"),
  taskDetail("task-detail", "task_detail"),
  theme("/theme", "theme");

  final String path;
  final String name;

  const Routes(this.path, this.name);
}
