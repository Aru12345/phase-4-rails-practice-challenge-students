class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def index
        students=Student.all
        render json: students

    end

    def destroy
        student=find_student
        student.destroy
        head :no_content

    end

    def create
        student=Student.create!(student_params)
        render json: student,status: :created,serializer: StudentSerializer

    end

    def update
        student=find_student
        if student
            student.update(student_params)
            render json: student,serializer: StudentSerializer
        else
            render json: {error: "Student not found"},status: :not_found
        end

    end

    private
    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
      end

    def student_params
        params.permit(:name,:major,:age)

    end


    def find_student
        Student.find(params[:id])

    end

    def  render_not_found_response
        render json: {error: "Student not found"}, status: :not_found

    end
end
