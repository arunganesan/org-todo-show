refreshFrequency: 5000

command: 'python ~/repos/org-todo-show/extract_tasks.py'

style: """
  top: 40px
  left: 40px
  color: #fff
  font-family: Source Code Pro Medium

  pre
    font-family: Source Code Pro Light
    font-size: 0.75em

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
    Chosen for today
    <pre class='todaylist list'></pre>
    
    Todo
    <pre class='todolist list'></pre>
    
    Prioritized
    <pre class='highpri list'></pre>

    <pre class='mediumpri list'></pre>

    <pre class='lowpri list'></pre>

"""

update: (output, domEl) ->
  parts = output.split('###')
  $(domEl).find('.todolist').html(parts[0].trim())
  $(domEl).find('.highpri').html(parts[1].trim())
  $(domEl).find('.mediumpri').html(parts[2].trim())
  $(domEl).find('.lowpri').html(parts[3].trim())
  
  $(domEl).find('.todaylist').html(parts[4].trim())
