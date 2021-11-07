class StudentsController < ApplicationController

    def index
        students = Student.all
        render json: students, status: :ok
        end
    
        def show
        student = Student.find(params[:id])
        render json: student, status: :ok
        end
    
        def create
            student = Student.create(student_params)
            if student
            render json: student, status: :created
            else
                render json: {error: "Please confirm infomation that you typed in"}, status: :unprocessable_entity
            end
        end
    
        def update
            student = Student.find_by(id: params[:id])
            if student
                student.update(student_params)
                render json: student, status: :accepted
            else
                render json: {error: "Student not found"}, status: :not_found
            end
        end
    
        def destroy
            student = Student.find_by(id: params[:id])
            if student
                student.destroy
            else
                render json: {error: "Student not found"}, status: :not_found
            end
        end
    
        private
    
        def student_params
            params.permit(:name, :major, :age, :instructor_id)
        end

end
