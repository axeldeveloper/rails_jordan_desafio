class Api::V1::SearchsController < ApplicationController

    def list
        vars = request.query_parameters
        vars['cpf']
        # @blacklist  = Blacklist.where(cpf: vars['cpf']).limit(1).first
        @blacklist  = Blacklist.find_by(cpf: vars['cpf'], active: true)
        if @blacklist 
            if @blacklist.cpf == vars['cpf']
                response = {:cpf => vars['cpf'], :situation => 'BLOCK', :row => @blacklist }
            end
        else
            response = {:cpf => vars['cpf'], :situation => 'FREE', :row => nil}
        end
        
        
        render :json => response
    end

    def exclude_list
        @blacklist = Blacklist.find(params[:id])   
        if @blacklist.update_attributes(setparams)   
            response = {:cpf => params['cpf'], :msg => EXCLUDE, :row => @blacklist }  
        else   
            response = {:cpf => vars['cpf'],  :msg => EXCLUDE_ERROR, :row => @blacklist }   
        end  

        render :json => response

    end
    
    def include_list

    end    
        

    def show
        if blacklist
            render json: blacklist
        else
            render json: blacklist.errors
        end
    end



    private
    
    def blacklist
        @blacklist ||= Blacklist.find(params[:id])
    end

    def setparams
        params.require(:blacklist).permit(
            :cpf, 
            :active) 
    end

end
