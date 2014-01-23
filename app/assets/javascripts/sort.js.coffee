jQuery ->

  # this is a small hack; prevents width of objects during drag
  # from shrinking
  ready = ->
    count = $('#sortable li').length
    item_width = (width, count) ->
      return width / count + "px"

    desired_width = item_width($('.navbar').width(), count)
    $('#sortable li').css('width', desired_width)

    $('#sortable').sortable(
      axis: 'x'
      items: '.item'

      # highlight the row on drop to indicate an update
      stop: (e, ui) ->
        ui.item.effect('highlight', {}, 1000)
      update: (e, ui) ->
        update_url = $('#sortable').attr('update_url')
        item_id = ui.item.attr('data-post-id')
        position = ui.item.index()
        $.ajax(
          type: 'POST'
          url: update_url
          dataType: 'json'

          # the :thing hash gets passed to @thing.attributes
          # row_order is the default column name expected in ranked-model
          data: { id: item_id, post: { nav_order_position: position } }
        )
    )
  $(document).ready(ready)
  $(document).on('page:load', ready)

