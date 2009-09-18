class SubsectionsController < ApplicationController

  before_filter :find_section
  def index
  end

  def show
    @subsection = @section.subsections.find(params[:id])
    @section_subsections = @section.subsections.all
  end

  def new
    @subsection = @section.subsections.build
  end

  def create
    @subsection = @section.subsections.build(params[:subsection])

    if @subsection.save
      flash[:notice] = "Subsection Added"
      respond_to do |format|
        format.html {redirect_to sections_path()}
      end
    else
      render :action => "new"
    end

  end

  def destroy
  end

  private
    def find_section
      @section = Section.find(params[:section_id])
    end

end
