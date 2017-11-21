class GetuserController < ApplicationController

	@username = nil
	def get_user
		@username = params[:hackerearth]
		
		begin
		if(params[:hackerearth])
			resource = RestClient::Resource.new 'https://www.hackerearth.com/users/pagelets/'+@username+'/coding-data/'
			@data=resource.get
		end
		 @reponse=@data.index("700")
	     problemssolved=0
		 multiplier=1
		 
		if (@data.include? "700")
			if(@data[@reponse+7]>='0' && @data[@reponse+7]<='9')
				problemssolved+=(@data[@reponse+7].to_i)*multiplier
				multiplier*=10
			end
			
			if(@data[@reponse+6]>='0' && @data[@reponse+6]<='9')
				problemssolved+=(@data[@reponse+6].to_i)*multiplier
				multiplier*=10
			end

			if(@data[@reponse+5]>='0' && @data[@reponse+5]<='9')
				problemssolved+=(@data[@reponse+5].to_i)*multiplier
				multiplier*=10
			end
			
			if(@data[@reponse+4]>='0' && @data[@reponse+4]<='9')
				problemssolved+=(@data[@reponse+4].to_i)*multiplier
				multiplier*=10
			end
              
			@jsondata=Hash.new

			@jsondata['handle']=@username
			@jsondata['problemssolved']=problemssolved
			end
		rescue => e 
			@jsondata=Hash.new
			@jsondata['error']="Hackerearth user does not exist"	
		end	

		render :json=>@jsondata.to_json
	end
end