require 'spec_helper'

describe "In shared_todo_app - " do
  before do

    @t1 = Todo.create(todo_item: "Draw Money", completed: "true")
    @t2 = Todo.create(todo_item: "Buy Milk", completed: "true")
    @t3 = Todo.create(todo_item: "Pay bill", completed: "false")
  end


 describe "Complete and Incomplete todos - " do

    it "Should have 'Toggle Todos' button" do 
        visit '/todos/index'
        page.should have_button('Toggle Todos')
    end

    it "Completed todos Should be striked and other todos should not be striked"  do 
      visit '/todos/index'
      page.should have_selector('strike', :text=> 'Draw Money')
      page.should have_selector('strike', :text=> 'Buy Milk')
      page.should_not have_selector('strike', :text=> 'Pay bill')
    end 
    
    it "Should be able to complete a pending todo, (non striked to striked)"  do
      visit '/todos/index'
      find(:css, "#todos_checkbox_[value='3']").set(true)
      click_on "Toggle Todos"
      cur_todo = Todo.find(3)
      cur_todo.completed.should eql true  
    end
  

    it "Should be able to mark a completed todo to pending and rest of todos unaffected (striked to non striked)"  do
      visit '/todos/index'
      find(:css, "#todos_checkbox_[value='1']").set(true)
      click_on "Toggle Todos"
      cur_todo = Todo.find(1)
      cur_todo.completed.should eql false

      rest_todo = Todo.find(3)
      rest_todo.completed.should eql false
    end

  end


end
