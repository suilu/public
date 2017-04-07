class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:destroy]



  # POST /comments
  # POST /comments.json
  def create

      @project = Project.find(params[:project_id])
      @comment = @project.comments.new(comment_params)
      @comment.user = current_user

      respond_to do |format|
        if @comment.save
          format.html { redirect_to :back, notice: '发表评论成功！' }
          format.json { render json: @comment, status: :created, location: @comment }
        else
          format.html { render action: "new" }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end


  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to :back, alert: '删除评论成功！' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:project_id, :body, :user_id)
    end
end
