class SubsectionsController < ApplicationController

  uses_tiny_mce :options => {
                              :theme => 'advanced',
                              :theme_advanced_resizing => true,
                              :plugins => %w{ safari pagebreak style layer table save advhr advimage advlink emotions iespell inlinepopups insertdatetime preview media searchreplace print contextmenu paste directionality fullscreen noneditable visualchars nonbreaking xhtmlxtras template },
                              :theme_advanced_toolbar_location => "top",
			      :theme_advanced_toolbar_align => "left",
			      :theme_advanced_statusbar_location => "bottom"
                            }

  before_filter :find_section

  def index
  end

  def show
    @logged_in = logged_in?
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

  def edit
    @subsection = @section.subsections.find(params[:id])
  end

  def update
    @subsection = Subsection.find(params[:id])
    
    respond_to do |format|
      if @subsection.update_attributes(params[:subsection])
        flash[:notice] = 'Subsection successfully updated.'
        format.html {redirect_to(@section, @subsection)}
        format.xml {head :ok}
      else
        flash[:notice] = 'Unable to save subsection.'
        format.html { render :action => "edit"}
        format.xml { render :xml => @section.errors, :status => :unprocessable_entity}
      end
    end
  end


  private
    def find_section
      @section = Section.find(params[:section_id])
    end

end
