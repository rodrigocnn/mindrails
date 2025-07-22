class PacientesController < ApplicationController
  before_action :set_paciente, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @pacientes = Paciente.all
  end

  def show
    @readonly = true
  end

  def new
    @paciente = Paciente.new
  end

  def edit
  end

  def create
    @paciente = Paciente.new(paciente_params)

    if @paciente.save
      redirect_to pacientes_path, notice: "Paciente was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @paciente.update(paciente_params)
      redirect_to pacientes_path, notice: "Paciente was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @paciente.destroy!
    redirect_to pacientes_path, status: :see_other, notice: "Paciente was successfully destroyed."
  end

  private

  def set_paciente
    @paciente = Paciente.find(params[:id])
  end

  def paciente_params
    params.require(:paciente).permit(:nome, :data_nascimento, :email, :telefone, :cpf)
  end
end
