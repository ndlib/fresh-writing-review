class ErrorsController < AdminController

  def index
    @errors = ErrorLog.errors
  end


  def show
    @error = ErrorLog.find(params[:id])

    if @error.start
      @error.save!
    end
  end


  def update
    @error = ErrorLog.find(params[:id])

    if @error.resolve
      flash[:notice] = "Resolved Error ##{@error.id}"
      @error.save!
    end

    redirect_to errors_path()
  end

end
