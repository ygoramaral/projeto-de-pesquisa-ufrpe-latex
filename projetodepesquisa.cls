\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{projetodepesquisa}[2024/10/15 Classe para Projeto de Pesquisa da UFRPE]
\LoadClass[a4paper, 11pt]{scrartcl}
% Modelo LaTeX para Projeto de Pesquisa da UFRPE
% Baseado no modelo do Anexo I da Resolução CEPE/UFRPE Nº 361, de 17 de novembro de 2021.
% Essa classe é baseada na classe scrartcl do KOMA-Script, que oferece uma maior 
% flexibilidade e opções de personalização quando comparado com o padrão do LaTeX.
% Autor: Ygor Amaral Barbosa Leite de Sena
% E-mail: ygor.amaral@ufrpe.br

\newcommand{\limittopmargin}{4.7cm}	% Margem onde o brasão toca o limite superior da página
\newcommand{\headeroffset}{1.27cm}	% Distância adicional entre o brasão e o limite superior

% A margem superior é definida dinâmicamente de acordo com \limittopmargin e \headeroffset
\newlength{\adjustedtopmargin}
\setlength{\adjustedtopmargin}{\limittopmargin}
\addtolength{\adjustedtopmargin}{\headeroffset} % É a soma de \limittopmargin com \headeroffset

% Definição das demais margens do documento
\newcommand{\documentleftmargin}{2cm}
\newcommand{\documentrightmargin}{1cm}
\newcommand{\documentbottommargin}{2.54cm}

% Carregando pacotes necessários
\RequirePackage[english,brazil]{babel} % Definição do idioma padrão para português do Brasil
\RequirePackage[utf8]{inputenc} % Para o funcionamento correto de acentuação
\RequirePackage[T1]{fontenc} % Para o funcionamento correto de acentuação
\RequirePackage{lipsum} % Para geração de texto de preenchimento
\RequirePackage{tcolorbox} % Para criar o retângulo ao redor do nome das seções
\RequirePackage{xcolor} % Para personalização das cores
\RequirePackage{newtx} % Fonte do texto em estilo Times
\RequirePackage{indentfirst} % indentar o primeiro parágrafo
\RequirePackage{tabularx} % Para tabelas com largura ajustável
\RequirePackage{multirow} % Para mesclar células em tabelas
\RequirePackage{pdflscape} % Para páginas em modo paisagem
\RequirePackage{graphicx} % Para inserir imagens
\RequirePackage{scrlayer-scrpage} % Para personalizar cabeçalho e rodapé
\RequirePackage[
	head=4.18cm,					% Altura do cabeçalho
	headsep=\baselineskip,			% Distância entre o cabeçalho e o texto
	top=\adjustedtopmargin,			% Margem superior
	bottom=\documentbottommargin,	% Margem inferior
	left=\documentleftmargin,		% Margem esquerda
	right=\documentrightmargin		% Margem direita
]{geometry}	% Definição das margens

% Definição do cabeçalho e rodapé
\newcommand{\headerfooter} {
	\clearpairofpagestyles % Limpa qualquer cabeçalho e rodapé definidos anteriormente
	
	% Definir o cabeçalho centralizado
	\ihead{} % Espaço vazio à esquerda
	\chead{%
		\normalfont  % Usa a fonte normal (remove o itálico)
		\includegraphics[height=3cm]{imagens/ilustracao/brasao\_ufrpe} \\[0.2em]
		\textsf{\textbf{UNIVERSIDADE FEDERAL RURAL DE PERNAMBUCO}} \\
		\textsf{\textbf{PROJETO DE PESQUISA}}
	}
	\ohead{} % Espaço vazio à direita
	
	% Remove a numeração de páginas do rodapé
	\cfoot{} % Limpa o rodapé central (onde estaria a numeração)
}

\AtBeginDocument{
	% Ativar o estilo de cabeçalho padrão do KOMA-Script
	\pagestyle{scrheadings}
	
	\headerfooter % Definindo o cabeçalho e rodapé
	
	% Guarda o valor de textwidth para uma página no modo retrato (o padrão)
	\newlength{\portraittextwidth}
	\setlength{\portraittextwidth}{\textwidth}
	
	% Definição da largura do texto em modo paisagem
	\newlength{\landscapetextwidth}
	\setlength{\landscapetextwidth}{\paperheight}
	\addtolength{\landscapetextwidth}{-\documentleftmargin}
	\addtolength{\landscapetextwidth}{-\documentrightmargin}
}

% Define a indentação de 1,25 cm para a primeira linha
\setlength{\parindent}{1.25cm}

% Definição da espessura da borda dos retângulos
\newcommand{\borderthickness}{0.5pt}

% Definição da espessura da borda das tabelas
\setlength{\arrayrulewidth}{\borderthickness}

% Definição da espessura da borda dos retângulos das seções científicas
\newcommand{\scisectionborderthickness}{1.5pt}

% Configurações de espaçamento entre linhas
\renewcommand{\baselinestretch}{1} % Espaçamento simples

\renewcommand{\maketitle}{} % Desativa o maketitle

% Espaçamento padrão entre as seções (e subs...) e as definições fontes para as seções (subs...)
\RedeclareSectionCommand[
	beforeskip=1\baselineskip,   % Espaçamento antes da seção
	afterskip=1pt,               % Espaçamento depois da seção
	indent=0pt,                  % Sem indentação
	font=\normalfont\bfseries,   % Define a fonte
]{section}

\RedeclareSectionCommand[
	beforeskip=1\baselineskip,   % Espaçamento antes da subseção
	afterskip=1pt,               % Espaçamento depois da subseção
	indent=0pt,                  % Sem indentação
	font=\normalfont\bfseries,   % Define a fonte
]{subsection}

\RedeclareSectionCommand[
	beforeskip=1\baselineskip,   % Espaçamento antes da subsubseção
	afterskip=1pt,               % Espaçamento depois da subsubseção
	indent=0pt,                  % Sem indentação
	font=\normalfont\bfseries,   % Define a fonte
]{subsubsection}

% Comando para iniciar a seção de identificação (administrativa)
\newcommand{\identification} {
	\ifdim\pagetotal>0pt % Verifica se já há conteúdo na página
		\newpage % Se houver, força nova página
	\fi
	\begin{center}
		\normalfont\bfseries
		I~\space{\normalfont--}~\space IDENTIFICAÇÃO~\space{\normalfont--}~\space SEÇÃO ADMINISTRATIVA
	\end{center}
}

% Comando para iniciar a seção de detalhamento (científico)
\newcommand{\detailing} {
	\ifdim\pagetotal>0pt % Verifica se já há conteúdo na página
		\newpage % Se houver, força nova página
	\fi
	\begin{center}
		\normalfont\bfseries
		II~\space{\normalfont--}~\space DETALHAMENTO~\space{\normalfont--}~\space SEÇÃO CIENTÍFICA
	\end{center}
}

% Comando para criar uma seção administrativa
\newcommand{\admsection}[2][] {
	\refstepcounter{section}% Atualiza o contador de seção
	\bigskip % Espaçamento entre as seções
	\ifx&#1& % Verifica se o argumento opcional foi fornecido
		% Se o argumento opcional não foi fornecido
		{\noindent\normalfont\bfseries\thesection~\space{\normalfont--}~\space\MakeUppercase{#2}}\par
	\else
		% Se o argumento opcional foi fornecido
		{\noindent\normalfont\bfseries\thesection~\space{\normalfont--}~\space\MakeUppercase{#2}~\space\textnormal{#1}}\par
		% O comando opcional nesse caso é uma observação ao lado do título da seção
	\fi
}

% Comando para criar uma seção científica
\newcommand{\scisection}[1] {
	\refstepcounter{section}% Atualiza o contador de seção
	\bigskip % Espaçamento entre as seções
	\begin{tcolorbox}[standard jigsaw, opacityback=0, colframe=black, width=\textwidth, boxrule=\scisectionborderthickness, sharp corners, left=0mm, right=0mm, top=0mm, bottom=0mm]
		{\normalfont\bfseries\thesection. \MakeUppercase{#1}} % Exibe o número da seção e o título
	\end{tcolorbox}
}

% Redefinindo o estilo da \section no KOMA-Script
\setkomafont{section}{\normalfont\bfseries} % Define a fonte da seção
\setkomafont{sectioning}{\normalfont\bfseries} % Configura a fonte para as outras seções (subseção, subsubseção)

% Comando para criar uma subseção científica
\newcommand{\scisubsection}[1] {
	\subsection{#1}
}

% Comando para criar uma subsubseção científica
\newcommand{\scisubsubsection}[1] {
	\subsubsection{#1}
}

% Comando para criar a seção de título do projeto
\newcommand{\projecttitle}[1] {
	\admsection{Título}
	\begin{tcolorbox}[standard jigsaw, opacityback=0, colframe=black, sharp corners, width=\textwidth, boxrule=\borderthickness, left=0.5mm, right=0.5mm, top=0.5mm, bottom=0.5mm, before skip=0.5mm, after skip=0.5mm]
		#1
	\end{tcolorbox}
}

% Comando para criar a seção de vigência do projeto
\newcommand{\term}[2] {
	\admsection[(até 60 meses)]{Vigência:}
	\begin{tcolorbox}[standard jigsaw, opacityback=0, colframe=black, sharp corners, width=\textwidth, boxrule=\borderthickness, left=0.5mm, right=0.5mm, top=0.5mm, bottom=0.5mm, before skip=0.5mm, after skip=0.5mm]
		Início Previsto (mês/ano): #1\\
		Término Previsto (mês/ano): #2
	\end{tcolorbox}
}

% Comando para criar a seção de área do projeto
\newcommand{\projectarea}[6] {
	\admsection[(de acordo com a tabela do CNPq)]{Classificação da Área do Projeto:}
	{\noindent\begin{tabularx}{\textwidth}{|>{\raggedright\arraybackslash}X|}
		\hline
		a) Nome da Área: #1  \\ \hline
		Número do Código: #2 \\ \hline
		\\ \hline
		b) Nome da Subárea: #3 \\ \hline
		Número do Código: #4  \\ \hline
		\\ \hline
		c) Nome da Especialidade (4º nível do conhecimento): #5 \\ \hline
		Número do Código: #6 \\ \hline
	\end{tabularx}} \par
}

% Comando para criar a seção de linha de pesquisa
\newcommand{\researcharea}[1]{%
  \admsection[(informar em qual(is) linha(s) se enquadra o projeto)]{Linha de Pesquisa:}
  {\noindent\begin{tabularx}{\textwidth}{|>{\raggedright\arraybackslash}X|}
    \hline
    #1
  \end{tabularx}} \par
}

% Comando para criar um item de linha de pesquisa
\newcommand{\raitem}[1]{%
  #1 \\ \hline
}

% Comando para criar a seção de palavras-chave
\newcommand{\keywords}[6] {
	\admsection[(informar no mínimo 04 palavras que possibilitem a recuperação do projeto)]{Palavras-chave:}
	{\noindent\begin{tabularx}{\textwidth}{|>{\raggedright\arraybackslash}X|>{\raggedright\arraybackslash}X|}
		\hline
		1. #1 & 4. #4  \\ \hline
		2. #2 & 5. #5 \\ \hline
		3. #3 & 6. #6 \\ \hline
	\end{tabularx}} \par
}

% Comando para criar a seção de grupo de pesquisa
\newcommand{\researchgroup}[1] {
	\admsection[(informar link do grupo de pesquisa no Diretório de Grupos de Pesquisa do CNPQ)]{Grupo de Pesquisa:}
	\begin{tcolorbox}[standard jigsaw, opacityback=0, colframe=black, sharp corners, width=\textwidth, boxrule=\borderthickness, left=0.5mm, right=0.5mm, top=0.5mm, bottom=0.5mm, before skip=0.5mm, after skip=0.5mm]
		#1
	\end{tcolorbox}
}

% Comando para criar a seção de participantes
\newcommand{\members}[1] {
	\admsection{Participantes}
	#1
}

% Comando para definir cada participante do projeto
\newcommand{\member}[8]{
	\vspace{\baselineskip} % Espaçamento entre os participantes
	{\noindent\begin{tabularx}{\textwidth}{>{\raggedright\arraybackslash}X}
		Nome: #1 \\ \hline
		CPF (Brasileiro) ou Passaporte (Estrangeiro): #2 \\ \hline
		SIAPE (servidor da UFRPE): #3 \\ \hline
		E-mail: #4 \\ \hline
		Vinculação: #5 \\ \hline
		Função: #6 \\ \hline
		Carga horária semanal dedicada ao projeto (em número inteiros): #7 \\ \hline
		Link para o currículo Lattes: #8 \\ \hline
	\end{tabularx}} 
	\par
}

% Comando para definir a função de cada participante
\newcommand{\memberrole}[3]{
	\hspace{1cm} Coordenador ( #1 ) \hspace{0.5cm} Colaborador ( #2 ) \hspace{0.5cm} Consultor ( #3 )
}

% Personalizando o layout do abstract com uma caixa usando tcolorbox
\renewenvironment{abstract} {
	\detailing
    \begin{tcolorbox}[standard jigsaw, opacityback=0, colframe=black, sharp corners, width=\textwidth, boxrule=\borderthickness, left=0.5mm, right=0.5mm, top=0.5mm, bottom=0.5mm]
		{ 
			\normalfont\bfseries RESUMO \\
		}
}
{
    \end{tcolorbox}
    \newpage
	\setcounter{section}{0}
}

% A página do cronograma deverá ficar no modo paisagem
% Entretanto, não podemos usar a abordagem padrão do LaTeX (via pdflscape)
% Com pdflscape, a página é realmente rotacionada, incluindo margens, cabeçalho e rodapé
% Para manter o padrão do modelo da UFRPE, precisamos rotacionar apenas a página, mas as margens, cabeçalho e rodapé não
% Essa característica foge do habitual em documentos LaTeX
% Por isso precisamos fazer de uma forma mais manual essa página em modo paisagem
\newcommand{\schedule}[1] {
	\clearpage % Garante que a mudança de orientação comece em uma nova página

	\KOMAoptions{paper=landscape, DIV=6} % Alterna para modo paisagem (rotaciona a página no pdf)
	
	\recalctypearea % Recalcula a área útil da página no modo paisagem, é aqui que a página é rotacionada de fato
	
	% O KOMA-Script tenta calcular as margens automaticamente, o que não deu certo para este caso
	% Fiz um workaround para as margens funcionar como o desejado
	% TODO: Melhorar este trecho de código no futuro.
	\newcommand{\temprightmargin}{-7.65cm} % Definindo uma margem a direita temporária
	\newlength{\tempbottommargin} % Definindo uma margem inferior temporária
	\setlength{\tempbottommargin}{8.8cm} % 8.8cm é quando o texto toca o limite inferior
	\addtolength{\tempbottommargin}{\documentbottommargin} % Finalmente definir a margem inferior
	
	% Redefinir as margens, para essa página que foi rotacionada
	\newgeometry{top=\adjustedtopmargin, bottom=\tempbottommargin, left=\documentleftmargin, right=\temprightmargin}
	
	\headerfooter % O cabeçalho e rodapé precisam ser redefinidos para funcionarem adequadamente
	
	\scisection{Cronograma de Atividades}
	#1
	
	\clearpage % Garante que o conteúdo do cronograma esteja em uma página separada
	\KOMAoptions{paper=portrait} % Volta ao modo retrato
	\recalctypearea % Recalcula novamente a área útil para retrato, restaurando...
	
	% Ajusta as margens de volta para o modo retrato
	\restoregeometry % Retorna as margens para as configurações originais
	
	\headerfooter % O cabeçalho e rodapé precisam ser redefinidos para funcionarem adequadamente
}

% Comando para criar um quadro de atividades no cronograma para um determinado ano
\newcommand{\yearbox}[2] {
	{\noindent\footnotesize\begin{tabularx}{\textwidth}{|X|X|*{12}{>{\centering\arraybackslash}p{6mm}|}} % Colunas expansíveis para as duas primeiras e largura fixa para os meses
		\hline
		\multicolumn{1}{|c|}{\multirow{2}{*}{\textbf{ATIVIDADES}}} & \multicolumn{1}{c|}{\multirow{2}{*}{\textbf{RESPONSÁVEIS}}} & \multicolumn{12}{c|}{\textbf{ANO #1}} \\
		\cline{3-14}
		& & \textbf{Jan} & \textbf{Fev} & \textbf{Mar} & \textbf{Abr} & \textbf{Mai} & \textbf{Jun} & \textbf{Jul} & \textbf{Ago} & \textbf{Set} & \textbf{Out} & \textbf{Nov} & \textbf{Dez} \\
		\hline
		#2
	\end{tabularx}} \par
	\vspace{\baselineskip}
}

% Comando para definir uma atividade no cronograma
\newcommand{\activity}[4]{
	#1 & #2 & #3 #4
}

% Comando para definir em quais meses do primeiro semestre a atividade será realizada
\newcommand{\fistsemester}[6] {
	#1 & #2 & #3 & #4 & #5 & #6 & 
}

% Comando para definir em quais meses do segundo semestre a atividade será realizada
\newcommand{\secondsemester}[6] {
	#1 & #2 & #3 & #4 & #5 & #6 \\ \hline
}

% Redefinindo o ambiente thebibliography para personalizar o título
\renewenvironment{thebibliography}[1]
{\scisection{Referências Bibliográficas} % Substitui o \section* padrão por um título customizado
	\begin{list}{\@biblabel{\arabic{enumi}}}
		{\settowidth\labelwidth{\@biblabel{#1}}%
			\leftmargin\labelwidth
			\advance\leftmargin\labelsep
			\@openbib@code
			\usecounter{enumi}%
			\let\p@enumi\@empty
			\renewcommand\theenumi{\arabic{enumi}}}}
	{\end{list}}

% Comando para criar o bloco de assinatura
\newcommand{\signatureblock}[2]{
	\vspace{#1}
	{\normalfont\bfseries\large\noindent DATA E ASSINATURA DO COORDENADOR:}
	\begin{tcolorbox}[standard jigsaw, opacityback=0, colframe=black, width=\textwidth, boxrule=\borderthickness, sharp corners, left=0mm, right=0mm, top=8mm, bottom=8mm]
		\hspace{0.5cm} #2 \hspace{1cm} Ass: %\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
	\end{tcolorbox}
	% Como as assinaturas são digitais, comentei a linha para assinar
}

\endinput 