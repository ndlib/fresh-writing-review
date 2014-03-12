$(document).scroll ->
  scrollPosition = $(document).scrollTop()
  scrollReference = 440
  if scrollPosition >= scrollReference
    $(".follow").addClass "fixed"
    windoww = $(window).width()
    rightp = (windoww - 880) / 2
    $(".follow").css "left", rightp
    $(".top").css "display","block"
  else
    $(".follow").removeClass "fixed"
    $(".follow").addClass "abs"
    $(".top").css "display","none"
  return
