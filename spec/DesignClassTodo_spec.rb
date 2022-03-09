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
end