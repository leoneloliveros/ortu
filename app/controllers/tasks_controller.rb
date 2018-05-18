class TasksController < ApplicationController
	def new
		@task = Task.new
		@title1 = "Crear Tarea"
		@title2 = @title1
	end
	def create
		@task = Task.new(task_params)
		@task.completed = false
		@task.save
	end
	def complete
		@task = Task.find(params[:id])
		@task.toggle(:completed)

		@task.save
	end
	def edit
		@task = Task.find(params[:id])
		@title1 = "Editar Tarea"
		@title2 = "Aceptar"
	end
	def update
		@task = Task.find(params[:id])
		@task.update(task_params)
	end
	def destroy
		@task = Task.find(params[:id])
		@task.destroy		
	end
	
	private
	def task_params
		params.require(:task).permit(:title, :description).merge(user: current_user)
	end
end
