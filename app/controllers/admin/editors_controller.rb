class Admin::EditorsController < ApplicationController

  layout 'admin'

  def index
    @editors = EditorQuery.all
  end

  def new
    @editor = Editor.new
  end

  def create
    @editor = Editor.new(params.require(:editor).permit(:username))
    if @editor.save
      redirect_to admin_editors_path
    else
      render action: :new
    end
  end

  def destroy
    @editor = EditorQuery.find(params[:id])
    @editor.destroy
    redirect_to admin_editors_path
  end

end
