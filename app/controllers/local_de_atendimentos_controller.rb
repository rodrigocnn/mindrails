class LocalDeAtendimentosController < ApplicationController
  before_action :set_local_de_atendimento, only: %i[ show edit update destroy ]

  def index
    @local_de_atendimentos = LocalDeAtendimento.all
    respond_to do |format|
      format.html 
      format.json { render json:  @local_de_atendimentos.as_json(only: [:id, :nome, :cidade]) }
    end
  end


  def show
  end

  def new
    @local_de_atendimento = LocalDeAtendimento.new
  end

  def edit
  end

  def create
    @local_de_atendimento = LocalDeAtendimento.new(local_de_atendimento_params)

    respond_to do |format|
      if @local_de_atendimento.save
        format.html { redirect_to local_de_atendimentos_path, notice: "Local de atendimento was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @local_de_atendimento.update(local_de_atendimento_params)
        format.html { redirect_to local_de_atendimentos_path, notice: "Local de atendimento was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @local_de_atendimento.destroy!

    respond_to do |format|
      format.html { redirect_to local_de_atendimentos_path, status: :see_other, notice: "Local de atendimento was successfully destroyed." }
    end
  end

  private
 
    def set_local_de_atendimento
      @local_de_atendimento = LocalDeAtendimento.find(params[:id])
    end

    def local_de_atendimento_params
      params.require(:local_de_atendimento).permit(:nome, :endereco, :bairro, :cidade, :estado)
    end
end
