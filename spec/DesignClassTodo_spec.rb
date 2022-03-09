require 'DesignClassTodo'

RSpec.describe ToDo do
  it "returns a task on the to-do list" do
    new_todo = ToDo.new("Luci")
    new_todo.add("feed the cat")
    expect(new_todo.see_tasks).to eq "Luci, don't forget to: \n- feed the cat"
  end

  it "returns more than one task" do
    new_todo = ToDo.new("Luci")
    new_todo.add("feed the cat")
    new_todo.add("do yoga")
    expect(new_todo.see_tasks).to eq "Luci, don't forget to: \n- feed the cat\n- do yoga"
  end

  context "no tasks in list to see" do
    it "fails" do
      new_todo = ToDo.new("Luci")
      expect { new_todo.see_tasks }.to raise_error "No tasks in the To-Do list"
    end
  end 

  context "no task is added" do
    it "fails" do
      new_todo = ToDo.new("Luci")
      expect { new_todo.add("") }.to raise_error "Please enter a task"
    end
  end

  context "when a user enters a completed a task" do
    it "informs the user that the specified completed task has been removed from the to-do list" do
      new_todo = ToDo.new("Luci")
      new_todo.add("feed the cat")
      expect(new_todo.remove_completed("feed the cat")).to eq "'feed the cat' has been completed!"
    end

    it "removes the specified task from the todo list" do
      new_todo = ToDo.new("Luci")
      new_todo.add("feed the cat")
      new_todo.remove_completed("feed the cat")
      expect{ new_todo.see_tasks }.to raise_error "No tasks in the To-Do list"
    end

    it "removes the specified task from the todo list" do
      new_todo = ToDo.new("Luci")
      new_todo.add("feed the cat")
      new_todo.remove_completed("feed the cat")
      new_todo.add("do yoga")
      expect(new_todo.see_tasks).to eq "Luci, don't forget to: \n- do yoga"
    end

    it "fails if task doesn't exist" do
      new_todo = ToDo.new("Luci")
      new_todo.add("feed the cat")
      expect { new_todo.remove_completed("do yoga") }.to raise_error "'do yoga' task does not exist"
    end
  end
end