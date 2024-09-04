class ProponentController < ApplicationController
  def index
    @per_page = params[:per_page] || 5
    @page = params[:page] || 1

    @proponents = Proponent
      .page(@page)
      .per(@per_page)

    render json: { 
      proponents: @proponents
    }
  end

  def create
    params.permit!
    name, cpf, birth_date, wage, inss_discount, adress, phones = params[:data].values_at(
      :name, 
      :cpf, 
      :birth_date, 
      :wage, 
      :inss_discount,
      :adress,
      :phones
    )
    
    @proponent = Proponent.create(
      name: name,
      cpf: cpf,
      birth_date: birth_date,
      wage: wage,
      inss_discount: inss_discount,
      adress: Adress.new(adress),
      phones: phones.map{ |phone| Phone.new(phone) },
    )

    render json: { 
      proponent: @proponent
    }
  end
end