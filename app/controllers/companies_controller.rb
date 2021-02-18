class CompaniesController < ApplicationController
  def new
    @company = current_user.build_company
  end

  def create
    @company = current_user.build_company(company_params)
    redirect_to @company, notice: 'Empresa cadastrada com sucesso!' if @company.save
    
   
    render :new, notice: 'oi'
  end

  def edit
  end

  private

  def company_params
    params.require(:company).permit(:name, :url, :logo)
  end
end
