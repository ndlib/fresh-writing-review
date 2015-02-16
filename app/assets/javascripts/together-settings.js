var TogetherJSConfig_siteName = "Fresh Writing";
var TogetherJSConfig_toolName = "Collaborate";
var TogetherJSConfig_hubBase = "https://freestyle.library.nd.edu:8443";
var TogetherJSConfig_cloneClicks = true;
var TogetherJSConfig_suppressJoinConfirmation = true;

$('#btnTogether').click(function(event) {
  event.preventDefault();
  TogetherJS(this);
  return false;
});
