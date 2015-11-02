$(document).on "ready page:load", ->
  if jQuery(".developers-list-page").length > 0
    new DevelopersList(jQuery(".developers-list-page"))

class DevelopersList
  constructor: (@$elm)->
    @bind_event()

  bind_event: ->
    $user_area = @$elm.find('.user_area')
    $user_area.mouseenter (event)=>
      jQuery(".user_area").css("background-color","#E1E1E1")
      jQuery(event.target).closest(".user_area .item").css("background-color","yellow");
    $user_area.mouseleave (event)=>
      jQuery(event.target).closest(".user_area .item").css("background-color","#E1E1E1");
    @$elm.on "click", ".user_area", (event)=> 
      mail  = jQuery(event.target).find('.mail').text()
      $.ajax
        url: "/auth/users/log_in_user"
        method: "post"
        data:{
          'user_email':mail
        }
      .success (msg) =>
        @$elm.find('.log-mark').addClass('hidden')
        jQuery(event.target).find('.information .log-mark').removeClass('hidden')
        @$elm.find('.loged-user').text(msg.currrent_user_name)


