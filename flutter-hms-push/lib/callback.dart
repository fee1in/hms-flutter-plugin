class ClickNotificationCallback {
  final String redirectUrl;
  ClickNotificationCallback.create(Map argument)
      : redirectUrl = argument["app_redirect_url"]?.toString();
}
