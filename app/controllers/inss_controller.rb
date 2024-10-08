class InssController < ApplicationController
  def discount
    # TODO, move this logic to an helper in order to clean the controller
    @wage = params[:wage].to_f
    @total_discount = 0


    ### 1st range
    @total_discount = 1045 * 0.075
    # 78.37
    
    ### 2nd range
    if @wage > 1045.0 
      wage_ceil = @wage >= 2089.60 ? @wage : 2089.60
      
      @total_discount += (2089.60 - 1045) * 0.09      
      # 172.38      
    end
    
    ### 3rd range
    if @wage > 2089.61 
      wage_ceil = @wage >= 3134.40 ? @wage : 3134.40
      
      @total_discount += (3134.40 - 2089.60) * 0.12            
      # 203.75
    end
    
    ### 4th range
    if @wage > 3134.40 
      wage_ceil = @wage >= 6101.06 ? @wage : 6101.06
      
      @total_discount += (6101.06 - 3134.40) * 0.14   
    end

    render json: { 
      total_discount: @total_discount.floor(2) 
    }
  end
end
