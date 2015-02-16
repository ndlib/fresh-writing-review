var TogetherJSConfig_siteName = "Beehive";
var TogetherJSConfig_toolName = "Collaborate";
var TogetherJSConfig_hubBase = "http://freestyle.library.nd.edu";
var TogetherJSConfig_cloneClicks = true;
var TogetherJSConfig_suppressJoinConfirmation = true;

$('#btnTogether').click(function(event) {
  event.preventDefault();
  TogetherJS(this);
  return false;
});
