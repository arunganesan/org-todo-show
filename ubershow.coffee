refreshFrequency: 60000

command: 'python ~/repos/org-todo-show/extract_tasks.py'

style: """
  top: 40px
  left: 40px
  color: #fff
  font-family: Helvetica Neue

  h1
    display: block
    text-align: left
    font-size: 24px
    font-weight: 100

  .list
    padding-left: 20px

  .highpri
    color: #D95204

  .mediumpri
    color: #F2B705
  
  .lowpri
    color: #84BF04
"""

render: -> """

    <pre class='todolist list'></pre>

    <pre class='highpri list'></pre>


    <pre class='mediumpri list'></pre>


    <pre class='lowpri list'></pre>
"""

update: (output, domEl) ->
  parts = output.split('###')
  $(domEl).find('.todolist').html(parts[0])
  $(domEl).find('.highpri').html(parts[1])
  $(domEl).find('.mediumpri').html(parts[2])
  $(domEl).find('.lowpri').html(parts[3])
