class PagesController < ApplicationController
  #GET /pages
  def index
    @pages = Page.all
  end

  #GET /pages/:id
  def show
    @page = Page.find(params[:id])
  end

  #GET /pages/new
  def new
    @page = Page.new
  end

  #GET /pages/:id/edit
  def edit
    @page = Page.find(params[:id])

  end

  #POST /pages
  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to page_path(@page)
    else
      render :new
    end
  end

#PUT /PATCH /pages/:id
  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      redirect_to page_path(@page)
    else
      render :edit
    end
  end

  private
    def page_params
      params.require(:page).permit(:body, :author, :title)
    end
end