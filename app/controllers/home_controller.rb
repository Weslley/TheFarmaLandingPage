class HomeController < ApplicationController
  def index
  end

  def create
    begin
      @mensagem = Mensagem.new(mensagem_params)
      @mensagem.e_nome = @mensagem.e_cnpj = @mensagem.e_telefone = true

      if @mensagem.valid?
        EmailerMailer.send_mail(@mensagem).deliver_now
        flash[:notice] = "Mensagem enviada com sucesso."
        redirect_to controller: "home", action: "index"
      else
        flash[:error] = "Erro ao enviar mensagem."
        render :index
      end
    rescue => exception
      flash[:error] = "Erro ao enviar mensagem. #{exception}"
      render :index
    end
  end

  private

  def mensagem_params
    params.require(:mensagem).permit(:nome, :email, :telefone, :cnpj)
  end
end
