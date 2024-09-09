require 'terminal-table'

def retirar_estoque(produtos)
  mensagem_amarelo("====== Escolha o produto que deseja remover ======", false, false)

  if produtos.empty?
    puts "A lista está vazia."
  else
    # Corrigido: Mapear apenas os campos necessários para a tabela
    rows = produtos.map do |produto|
      [produto[:id], produto[:nome], produto[:quantidade]]
    end
    
    # Exibir tabela com as colunas corretas
    table = Terminal::Table.new :headings => ['ID', 'Nome', 'Quantidade'], :rows => rows
    puts table
    
    mensagem_azul("Digite o ID do produto:", false, false)
    id = gets.to_i
    
    # Corrigido: Verificar corretamente o ID do produto
    produto = produtos.find { |p| p[:id] == id }
    
    unless produto
      limpar_tela
      mensagem_vermelho("Produto do ID (#{id}) não encontrado", false, false)
      mensagem_amarelo("Digitar novamente (s/n)", false, false)
      opcao = gets.chomp.downcase
      
      if opcao == "s" || opcao == "sim"
        retirar_estoque(produtos)
      end
      return
    end
    
    limpar_tela
    mensagem_azul("Digite a quantidade a ser retirada de #{amarelo(produto[:nome])}:", false, false)
    mensagem_verde("Quantidade atual: (#{amarelo(produto[:quantidade])}):", false, false)
    quantidade_retirada = gets.to_i
    
    # Corrigido: Atualizar a quantidade do produto de forma adequada
    produto[:quantidade] -= quantidade_retirada

    mensagem_verde("Retirada realizada com sucesso!", true, true, 3)
    listar_produtos(produtos)
  end
end
