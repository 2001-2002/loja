class ProdutosController < ApplicationController
  def index
    @produtos = Produto.order(nome: :desc)
    @produto_final_estoque = Produto.order(:quantidade).limit 1

  end

  def create
    produto = params.require(:produto).permit(:nome, :descricao, :preco, :quantidade)
    Produto.create produto
    redirect_to root_path
  end
end
