$(document).on "ready page:load", ->
  if jQuery(".developers-list-page").length > 0
    new DevelopersList(jQuery(".developers-list-page"))

class DevelopersList
  constructor: (@$elm)->
    @bind_event()

  bind_event: ->
    $user_area = @$elm.find('.user-area')
    $user_area.mouseenter (event)=>
      jQuery(".user-area").css("background-color","#E1E1E1")
      jQuery(event.target).closest(".user-area .item").css("background-color","yellow");
    $user_area.mouseleave (event)=>
      jQuery(event.target).closest(".user-area .item").css("background-color","#E1E1E1");
    @$elm.on "click", ".user-area", (event)=> 
      user_id  = jQuery(event.target).find('.mail').attr('data-id')
      $.ajax
        url: "/auth/users/log_in_user"
        method: "post"
        data:{
          'user_id':user_id
        }
      .success (msg) =>
        @$elm.find('.log-mark').addClass('hidden')
        jQuery(event.target).find('.information .log-mark').removeClass('hidden')
        @$elm.find('.loged-user').text(msg.current_user_name)


