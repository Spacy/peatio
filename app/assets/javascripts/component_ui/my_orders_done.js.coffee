@MyOrdersDoneUI = flight.component ->
  @defaultAttrs
    table: 'table > tbody'
    empty: '.empty-row'

  @populate = (data) ->
    if _.isEmpty(data)
      @select('empty').show()
    else
      @select('empty').hide()

      for order in data
        $(JST["orders_done"](order)).appendTo(@select('table')).show('slow')

  @.after 'initialize', ->
    @populate gon.orders.done

