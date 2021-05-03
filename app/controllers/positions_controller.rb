class PositionsController < ApplicationController
  before_action :set_company, :set_i18n_careers, :set_i18n_contracts
  before_action :set_postion, only: [:edit, :show, :update]

  def index
    @positions = @company.positions
  end

  def new
    @position = @company.positions.new
  end

  def edit
  end

  def show
  end

  def create
    @position = @company.positions.new(params_positon)
    return redirect_to positions_path, notice: 'Sucesso parsa' if @position.save

    render :new, notice: 'Deu ruim :/'
  end

  def create
    return redirect_to positions_path, notice: 'Sucesso parsa' if @position.update(params_positon)

    render :new, notice: 'Deu ruim :/'
  end

  private

  def params_positon
    params.require(:position).permit(:name, :career, :contract, :remote, :publish, :city, :state, :summary, :description)
  end

  def set_postion
    @position = @company.positions.find(params[:id])
  end

  def set_company
    redirect_to new_company_path if current_user.company.nil?
    @company = current_user.company
  end

  def set_i18n_careers
    @careers = []
    Position.careers.each_with_index do |career, index|
      @careers << [
        Position.careers.to_a[index].first,
        I18n.t('activerecord.attributes.position.careers').values.to_a[index]
      ]
    end
  end

    def set_i18n_contracts
      @contracts = []
      Position.contracts.each_with_index do |contract, index|
        @contracts << [
          Position.contracts.to_a[index].first,
          I18n.t('activerecord.attributes.position.contracts').values.to_a[index]
        ]
      end
    end
end
