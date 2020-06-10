#language: pt

@get
Funcionalidade: Consultar endpoints da Webmotors

@get_information
Esquema do Cenário: Busca logomarcas de veiculos
  Dado a API da webmotors
  Quando realizar uma pesquisa por <tipo> com o valor <valor>
  Então o sistema deve retornar as informações cadastradas na base de dados juntamente com codigo de resultado da consulta <codigo_esperado>
  Exemplos:
  |tipo      |valor  |codigo_esperado|
  |'marca'   |'1'    |'200'          |
  |'modelo'  |'1'    |'200'          |
  |'modelo'  |'teste'|'400'          |
  |'modelo'  |'2,4'  |'400'          |
  |'versao'  |'1'    |'200'          |
  |'versao'  |'teste'|'400'          |
  |'versao'  |'2,4'  |'400'          |
  |'veiculos'|'1'    |'200'          |
  |'veiculos'|'teste'|'400'          |
  |'veiculos'|'2,4'  |'400'          |