class ExamSheetsController < ApplicationController

    def new
        exam = Exam.find(params[:exam_id])
        exam_share = exam.exam_shares.find(params[:share_id])

        if exam_share.authenticate_share_token(params[:share])
          @exam_sheet = exam.exam_sheets.build
          @exam_sheet.add_empty_sheet_questions
          render :new
        else
          render :plain => "Invalid link"
        end
    end

    def create
        exam = Exam.find(params[:exam_id])
        if @exam_sheet = exam.exam_sheets.create(exam_sheet_params)
            redirect_to exam_exam_sheet_path(params[:exam_id], @exam_sheet.id)
        else
            flash[:errors] = @exam_sheet.sheet.errors.full_messages
            render :new
        end
    end

    def show
        exam = Exam.find(params[:exam_id])
        @exam_sheet = exam.exam_sheets.find(params[:id])
        render :show
    end

    def destroy
    end


    private
    def exam_sheet_params
        params.require(:exam_sheet).permit(
            :student_name,
            :exam_id,
            :id ,
            :question_sheets_attributes =>[
                :choosen_answer,
                :question_id ,
                :exam_sheet_id ,
                :id
            ]
        )
    end
end
