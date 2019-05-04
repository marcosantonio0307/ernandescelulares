class ServicesController < ApplicationController

	def index
		@services = Service.all
	end

	def new
		@service = Service.new
	end

	def create
		values = params.require(:service).permit!
		@service = Service.create values

		if @service.save
			redirect_to services_open_path, notice: 'Ordem de Serviço Cadastrada com Sucesso!'
		else
			render :new
		end
	end

	def destroy
		id = params[:id]
		Service.destroy id
		redirect_to services_open_path, notice: 'Ordem de Serviço Excluída!'
	end

	def edit
		@service = Service.find(params[:id])
	end

	def update
		@service = Service.find(params[:id])
		values = params.require(:service).permit!
		@service.update values

		if @service.save
			redirect_to @service, notice: 'Ordem de Serviço Alterada com Sucesso!'
		elsif
			render :edit
		end
	end

	def open
		@services = Service.where "status like ?", "Aberta"
	end

	def finish
		@service = Service.find(params[:id])

		if @service.status == 'Aberta'
			@service.update(status: 'Concluída')
			redirect_to @service, notice: 'Ordem de Serviço Concluída com Sucesso!'
		else
			redirect_to @service, notice: 'Ordem de serviço ja esta finalizada!'
		end
	end

	def search
		@client = params[:client]
		@services = Service.where "client like ?", "%#{@client}%"
	end

	def show
		@service = Service.find(params[:id])
		respond_to do |format|
			format.html
			format.pdf { render template: "services/print", pdf: 'print'}
		end
	end
end
