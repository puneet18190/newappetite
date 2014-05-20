#= require active_admin/base
#= require spin.min
$(document).ready ->
  $(".invite_user").click ->
    user_id = $(this).attr("id")
    target = document.getElementById('load-ajax')
    spinner = new Spinner().spin()
    target.appendChild(spinner.el)
    user_count = parseInt($(".panel h3").html().replace(/[^\d.]/g, ""))
    $.ajax
      type: "post"
      url: "/users/update_invite_user_status"
      data: "status=true&user_id=" + user_id
      async: false
      success: (response) ->
        $('body').find('#'+user_id+'').parent().parent().remove()
        $(this).parent().remove()
        $('.panel h3').html( (user_count - 1) + " Invitation Wait List")
        target.removeChild(spinner.el);
        return

      error: ->
        alert "Something went wrong"
        target.removeChild(spinner.el);
        return

    return

  return

