class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = current_user.companies.build
  end

  def create
    @company = current_user.companies.build(company_params)
    if @company.save
      redirect_to company_url(@company), :notice => "Company created successfully"
    else
      render 'new'
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
      redirect_to company_url(company)
    else
      render 'edit'
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.delete
    redirect_to user_url(current_user)
  end

  private

  def company_params
    params.require(:company).permit(:name, :image, :description)
  end


end
