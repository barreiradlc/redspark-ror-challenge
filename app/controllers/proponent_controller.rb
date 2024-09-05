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

  def report
    # TODO, implementar estrutura com query do rails para facilitar a compreensão
    sql = %{
      SELECT 
          CASE
              WHEN wage BETWEEN 0 AND 1045 THEN 'Faixa 1 (0 - 1045)'
              WHEN wage BETWEEN 1045.01 AND 2089.60 THEN 'Faixa 2 (1045.01 - 2089.60)'
              WHEN wage BETWEEN 2089.61 AND 3134.40 THEN 'Faixa 3 (2089.61 - 3134.40)'
              WHEN wage BETWEEN 3134.41 AND 6101.06 THEN 'Faixa 4 (3134.41 - 6101.06)'
          END AS faixa_salarial,
          STRING_AGG(name, ', ' ORDER BY name) AS proponents,
          COUNT(*) AS total_proponents,
          AVG(wage) AS media_salarial
      FROM proponents
      GROUP BY faixa_salarial
      ORDER BY MIN(wage);
    }
    @proponents_report = ActiveRecord::Base.connection.execute(sql)        

    render json: { 
      proponents_report: @proponents_report
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