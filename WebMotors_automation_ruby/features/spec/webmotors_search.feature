#language:pt

@webmotors
Funcionalidade:  validar os campos de busca de "Marca", "Modelo" e "Versão"

Contexto: 
  Dado que esteja no site da webmotors

@pesquisa
Esquema do Cenário: Realizar busca por Marca, modelo e Versão
  Quando realizo a pesquisa por <Marca>, <Modelo> e <Versao>
  Então o sistema deverá apresentar no resultado
  """
  Honda City 1.5 Exl 16v Flex 4p Manual Novos e Usados
  """

  Exemplos:
    | Marca  | Modelo | Versao                       |
    |'Honda' |'City'  | '1.5 Exl 16v Flex 4p Manual' |

@estoque
Esquema do Cenário: Validar estoque da loja
  Dado que o usuário realiza o acesso a loja
  Quando realizar a pesquisa por <Marca> e <Modelo> e <Versao>
  Então o sistema deverá apresentar no resultado do estoque da loja
  """
  HONDA CITY
  """

  Exemplos:
    | Marca  | Modelo | Versao                         |
    |'Honda' |'City'  | '1.5 Sport 16v Flex 4p Manual' |
