class InstructorsController < ApplicationController

    def index
    instructors = Instructor.all
    render json: instructors, status: :ok
    end

    def show
    instructor = Instructor.find(params[:id])
    render json: instructor, status: :ok
    end

    def create
        instructor = Instructor.create(instructor_params)
        if instructor
        render json: instructor, status: :created
        else
            render json: {error: "Please confirm the name"}, status: :unprocessable_entity
        end
    end

    def update
    instructor = Instructor.find_by(id: params[:id])
    if instructor
        instructor.update(instructor_params)
        render json: instructor, status: :accepted
    else
        render json: {error: "Instructor not found"}, status: :not_found
    end
end

    def destroy
        instructor = Instructor.find_by(id: params[:id])
        if instructor
        instructor.destroy
        else
            render json: {error: "Instructor not found"}, status: :not_found
        end

    end

    private

    def instructor_params
        params.permit(:name)
    end
end
