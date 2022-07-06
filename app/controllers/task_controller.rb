class TaskController < ApplicationController
  before_action :authorize
  def get_tasks
    render json: Task.all
  end
end
