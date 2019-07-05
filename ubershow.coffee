refreshFrequency: 60000

showagenda = '~/org/todo.org'

command: "cat #{showagenda}"

style: """
  top: 40px
  left: 40px
  color: #fff
  font-family: Helvetica Neue

  h
    display: block
    text-align: left
    font-size: 24px
    font-weight: 100

  div
    display: block
    text-shadow: 0 0 1px rgba(#000, 0.5)
    font-size: 50px

  ol
    padding-left: 20px

  .completed
    color: #888
    font-weight: regular
    text-decoration:line-through


  .todolist
    padding-left: 20px
"""


render: -> """
    <h>todo</h>
    <pre class='todolist'></pre>

"""

update: (output, domEl) ->
  $(domEl).find('.todolist').html(output)
