class Mensagem
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :nome, :email, :telefone, :cnpj
  attr_accessor :e_nome, :e_email, :e_telefone, :e_cnpj

  validates :nome, presence: true, :if => :e_nome
  validates :email, presence: true, :if => :e_email
  validates :telefone, presence: true, :if => :e_telefone
  validates :cnpj, presence: true, :if => :e_cnpj

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end
