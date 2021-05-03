class CompaniesController < ApplicationController
  def new
    @company = current_user.build_company
  end

  def create
    @company = current_user.build_company(company_params)
    return redirect_to root_path, notice: 'Empresa cadastrada com sucesso!' if @company.save
    
    render :new, notice: 'deu ruim'
  end

  def edit
    @company = current_user.company
  end

  def update
    
  end
  
  private

  def company_params
    params.require(:company).permit(:name, :url, :logo)
  end
end
