class EmployeesController < ApplicationController
    before_action :find_employee, only: [:show, :edit, :update]

    def index
        @employees = Employee.all
    end
     
    def new
        @errors = flash[:errors]
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create
        new_employee = Employee.create(employee_params)
        if new_employee.valid?
            redirect_to employee_path(new_employee)
        else 
            flash[:errors] = new_employee.errors.full_messages
            redirect_to new_employee_path
        end 
    end 

    def show
        
    end 

    def edit
        @errors = flash[:errors]
        @dogs = Dog.all
    end

    def update
        @employee.update(employee_params)
    
        if @employee.valid?
            redirect_to employee_path(@employee)
        else 
            flash[:errors] = @employee.errors.full_messages
            redirect_to edit_employee_path(@employee)
        end 
    end

    private 

    def find_employee
        @employee = Employee.find(params[:id])
    end
    
    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end
end
