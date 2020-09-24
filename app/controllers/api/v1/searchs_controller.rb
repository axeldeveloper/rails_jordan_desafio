class Api::V1::SearchsController < ApplicationController

    include ActionView::Helpers::DateHelper

    def list
        vars = request.query_parameters
        cpf = vars['cpf']
        # @blacklist  = Blacklist.where(cpf: vars['cpf']).limit(1).first
        blacklist  = Blacklist.find_by(cpf: cpf, active: true)
        if blacklist     
            
            Searchlog.create(cpf: cpf, situation: BLOCK, blacklist: blacklist)      
            
            response = {
                :cpf => cpf, 
                :situation => 'BLOCK', 
                :row => blacklist 
            }    
        else
            # Searchlog.create(cpf: vars['cpf'] , situation: FREE, blacklist: blacklist)
            response = {
                :cpf => vars['cpf'], 
                :situation => 'FREE', 
                :row => nil
            }
        end 

        
        render :json => response
    end

    def update_list
        blacklist = Blacklist.find(params[:id])   
        if blacklist.update_attributes(set_params)   
            response = {:msg => EXCLUDE, :row => blacklist}  
        else   
            response = {:msg => EXCLUDE_ERROR, :row => nil }   
        end  

        render :json => response

    end
    
    def include_list
        blacklist = Blacklist.create!(set_params)
        if blacklist 
            
            Searchlog.create(cpf: params[:blacklist][:cpf] , situation: FREE, blacklist: blacklist)  
            
            response = { :msg => INCLUDE, :row => blacklist }  
        else
            response = { :msg => blacklist.errors, :row => nil }  
        end

        render :json => response
    end    
        

    def show
        if blacklist
            render json: blacklist
        else
            render json: blacklist.errors
        end
    end

    def status
        ultimate_query = Searchlog.group(:cpf).maximum(:created_at) 
        count_query = Searchlog.group(:cpf).count
        count = Blacklist.distinct.count(:cpf)
        response = {
            :total_cpf => count, 
            :now   => TIME_NOW, 
            :count_query => count_query,
            :ultimate_query => ultimate_query  
        }
        render :json => response 
    end

    
    private
    
    def blacklist
        @blacklist ||= Blacklist.find(params[:id])
    end

    def set_params  
        params.require(:blacklist).permit(
            :cpf, 
            :active) 
    end

end
