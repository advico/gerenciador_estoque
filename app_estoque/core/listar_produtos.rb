require'terminal-table'
def listar_produtos(produtos)
  mensagem_amarelo("====== Lista de produtos ======", false, false)

  if produtos.empty?
    puts "A lista está vazia."
  else
    
    rows = produtos.map do |produto|
      [produto[:id], produto[:nome], produto[:descricao], produto[:preco], produto[:quantidade]]
    end
    
    
    table = Terminal::Table.new :headings => ['ID', 'Nome', 'Descrição', 'Preço', 'Quantidade'], :rows => rows
    puts table
    mensagem_amarelo("Digite enter para continuar ...", false, false)
    gets
    limpar_tela
  end
end