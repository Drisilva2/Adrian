require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should insert value" do
    task = Task.new(title: "juanpa", completed: "true");
    assert task.save
  end
end

