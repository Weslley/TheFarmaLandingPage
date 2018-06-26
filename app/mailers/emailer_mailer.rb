class EmailerMailer < ApplicationMailer
  def send_mail(mensagem)
    @mensagem = mensagem
    attachments.inline['logo.png'] = File.read(Rails.root.join("app/assets/images/logo.png"))
    mail(:to => "weslleyocara@hotmail.com", :cc => "weslleyocara@hotmail.com", :subject => "PROPOSTA THEFARMA")
  end
end
