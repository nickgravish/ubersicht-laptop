refreshFrequency: 60000

# ToDoList Entries:
# Use a '-' for an open item
# Use a '+' for a completed item
todolistfile = '~/Dropbox/todo.md'

command: "cat #{todolistfile} | awk 'BEGIN {print \"<ol>\"} /^[-]/ {print \"<li>\"substr($0,2)\"</li>\"} /^[+]/ {print \"<li class=\\\"completed\\\">\"substr($0,2)\"</li>\"} END {print \"</ol>\"}'"

style: """
  top: 10px
  left: 33%
  width: 50%
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
    font-size: 12px

  ol
    padding-left: 20px

  .completed
    color: #888
    font-weight: regular
    text-decoration:line-through
"""


render: -> """
  <h>To do</h>
  <div class='todolist'></div>
"""

update: (output, domEl) ->
  $(domEl).find('.todolist').html(output)
