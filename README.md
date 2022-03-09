# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

> As a user
> So that I can keep track of my tasks
> I want a program that I can add todo tasks to and see a list of them.

> As a user
> So that I can focus on tasks to complete
> I want to mark tasks as complete and have them disappear from the list. 

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._
```ruby
class ToDo
  def initialize(name) # name is a string
    # ...
  end

  def add(task) # task is a string
    # Throws an error if string is empty
    # No return value
  end

  def see_tasks()
    # Throws an error if no tasks have been set,
    # Otherwise returns formatted string of task list.
  end

  def remove_completed(task) # task is a string
    # Returns string showing task as complete
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._
``` ruby
# 1
new_todo = ToDo("Luci")
new_todo.add("feed the cat")
new_todo.see_tasks() 
# => "Luci, don't forget to: 
#     - feed the cat"

#2
new_todo = ToDo("Luci")
new_todo.add("feed the cat")
new_todo.add("do yoga")
new_todo.see_tasks() 
# => "Luci, don't forget to: 
#     - feed the cat
#     - do yoga"

#3
new_todo = ToDo("Luci")
new_todo.see_tasks()
# fails with "No tasks in To-Do list"

#4
new_todo = ToDo("Luci")
new_todo.add("")
# fails with "Please enter a task." 
```