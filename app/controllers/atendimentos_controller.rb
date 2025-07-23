class AtendimentosController < ApplicationController
  before_action :set_atendimento, only: %i[ show edit update destroy ]


  def index

    if params[:paciente_id].present?
        @atendimentos = Atendimento.where(paciente_id: params[:paciente_id])
    else
      @atendimentos = Atendimento.all
    end

    respond_to do |format|
      format.html # carrega a view normalmente
      format.json { render json: @atendimentos.as_json(only: [:id, :data_sessao, 
      :tecnica_utilizada], 
       include: {
          paciente: {
            only: [:id, :nome, :email]
          }
      }
      
      ) }
    end
  end

  def show
  end


  def new
    @atendimento = Atendimento.new
  end

  def edit
  end

  def create
    @atendimento = Atendimento.new(atendimento_params)

    respond_to do |format|
      if @atendimento.save
        format.html { redirect_to @atendimento, notice: "Atendimento was successfully created." }
        format.json { render :show, status: :created, location: @atendimento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @atendimento.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @atendimento.update(atendimento_params)
        format.html { redirect_to @atendimento, notice: "Atendimento was successfully updated." }
        format.json { render :show, status: :ok, location: @atendimento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @atendimento.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @atendimento.destroy!

    respond_to do |format|
      format.html { redirect_to atendimentos_path, status: :see_other, notice: "Atendimento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atendimento
      @atendimento = Atendimento.find(params[:id])
      
    end

    def atendimento_params
        params.require(:atendimento).permit(
          :paciente_id,
          :data_sessao,
          :resumo,
          :observacoes_comportamentais,
          :intervencoes_realizadas,
          :reacoes_paciente,
          :encaminhamentos,
          :planos_terapeuticos,
          :hipoteses_diagnosticas,
          :tecnica_utilizada
      )
    end
end
