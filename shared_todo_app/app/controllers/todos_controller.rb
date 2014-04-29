class TodosController < ApplicationController
  def index
    @todo_items = Todo.all
    @new_todo = Todo.new
    render :index
  end
  
  def delete
    unless Todo.nil?
      Todo.last.delete
      index      
    end
  end
  
  def add
    todo = Todo.create(:todo_item => params[:todo][:todo_item])
    unless todo.valid?
      flash[:error] = todo.errors.full_messages.join("<br>").html_safe
    else
      flash[:success] = "Todo added successfully".html_safe
    end
   redirect_to :action => 'index'
  end
  
  def complete
    unless params[:todos_checkbox].nil?
      params[:todos_checkbox].each do |check|
        unless check.nil?
           todo_id = check
           t = Todo.find_by_id(todo_id)
          if(t.completed)
            t.update_attribute(:completed, false)
          else
            t.update_attribute(:completed, true)
          end
        end
      end
    end
    redirect_to :action => 'index'
  end
end
