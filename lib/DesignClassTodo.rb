class ToDo
  def initialize(name) # name is a string
    @name = name
    @todo = []
  end

  def add(task)
    fail "Please enter a task" if task == ""
    @todo.push(task)
  end

  def see_tasks
    fail "No tasks in the To-Do list" if @todo == []
    task_list = @todo.join("\n- ")
    return "#{@name}, don't forget to: \n- #{task_list}"
    # Throws an error if no tasks have been set,
    # Otherwise returns formatted string of task list.
  end

  def remove_completed(task)
    if @todo.include?(task)
      @todo.delete(task)
      return "'#{task}' has been completed!"
    end
  end
end

