# Modelo LaTeX para Projeto de Pesquisa da UFRPE

Este repositório contém um modelo LaTeX para a criação de Projetos de Pesquisa da **Universidade Federal Rural de Pernambuco (UFRPE)**, conforme o modelo do Anexo I da **Resolução CEPE/UFRPE Nº 361**, de 17 de novembro de 2021.

## Visão Geral

O projeto consiste em dois arquivos principais:

1. **`principal.tex`**: O arquivo principal que utiliza a classe personalizada para formatar o projeto de pesquisa.
2. **`projetodepesquisa.cls`**: A classe LaTeX desenvolvida para atender às necessidades específicas da UFRPE, baseada na classe `scrartcl` do KOMA-Script, que oferece maior flexibilidade e personalização.

### Características

- **Seções Administrativas e Científicas**: O documento é dividido em duas partes principais:
  - **Seção Administrativa**: Contém informações sobre o título do projeto, vigência, áreas de atuação, linhas de pesquisa, palavras-chave, grupo de pesquisa e participantes.
  - **Seção Científica**: Contém o resumo, introdução, objetivos, metodologia, cronograma e referências.

- **Personalização de Seções**: Com os comandos `\admsection` e `\scisection`, você pode criar seções administrativas e científicas com formatação específica.

- **Cronograma de Atividades**: A classe inclui um comando `\schedule` que formata o cronograma de atividades em modo paisagem.

## Estrutura do Projeto

- **`principal.tex`**: Documento principal onde o projeto de pesquisa é descrito.
- **`projetodepesquisa.cls`**: Classe LaTeX para formatação do projeto de pesquisa da UFRPE.
- **`imagens/`**: Pasta contendo imagens necessárias, como o brasão da UFRPE.
- **`referencias.bib`**: Arquivo BibTeX contendo as referências bibliográficas do projeto.

## Personalização

Se precisar personalizar o estilo, você pode editar o arquivo `projetodepesquisa.cls` para alterar margens, formatação de seções ou outros aspectos da aparência do documento.

## Contribuindo

Contribuições são bem-vindas! Se você encontrar problemas ou tiver sugestões de melhorias, sinta-se à vontade para abrir uma _issue_ ou enviar um _pull request_.

## Licença

Este projeto está licenciado sob a **GNU General Public License v3.0**. Consulte o arquivo [LICENSE](./LICENSE) para mais detalhes.
