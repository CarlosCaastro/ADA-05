Projeto ADA Módulo 5

- Camada Bronze é uma copia dos dados csv da http://insideairbnb.com/.
- Utilizei pandas para carregar os dados no banco de dados. Ao realizar os testes utilizando pyspark, retornava erro de timeout na conexão.
- Silver, realizei tratamento de normalização dos campos.
- Fiz a segregação, para a criação de uma tabela reviewer (contém os dados do revisor) e hospedador(contém informações do host)
- Para a tabela silver_acomodacao_airbnb, tratei as colunas de forma a melhorar adequação do campo a informação. Padronizei os nomes para português. Removi as duplicadas, passando a chave a ser ID_ACOMODACAO.
- Tabela silver_hospedador_airbnb, consolidei as informações do host nessa tabela. Ela é derivadfa da tabela listings. Nessa tabela a chave seria o ID_HOST. Aqui removi as duplicadas e a chave passou a ser ID_HOST.
- Tabela silver_preco_acomodacao_airbnb, tratei as informações númericas da acomodação trazendo o último status da tabela da acomodação. Tratei os campos de preço, data e transformei em booleano a disponibilidade. A chave da tabela é o próprio ID_ACOMODACAO.
- Tabela silver_preco_geral_airbnb, de forma similar ao tratamento da silver_preco_acomodacao_airbnb porém mantendo todo o histórico dos preços por data da acomodação.
- Tabela silver_review_airbnb, tratei os campos de forma a normalizar seguindo a lógica do projeto. Nessa tabela existe o ID_REVISOR que pode ser usado para realicionamento com a tabelar silver_reviewer_airbnb. A chave dessa tabela é ID_REVISAO
- Tabela silver_reviewer.airbnb, removi os duplicados com base na reviewer_id e reviewer_name e deixei em upper case o nome do revisor.

Tabelas gold:
- Criei uma tabela com informações de preco medio, preco medio ajustado, valor mais recente e data mais recente de uma acomodação. A chave dessa tabela é ID_ACOMODACAO
- Criei uma outra tabela com informações de quantidade de revisões e data da ultima revisão de uma acomodação. A chave dessa tabela também é ID_ACOMODACAO.
- Crie uma view contendo informações de quais acomodações estão livres, data da última scrape, quantidade de acomodações,quantidade de reviews avaliações e o link da acomodação que está livre seguindo a última atualização do dado.
- Uma outra view, bem similar a anterior porém retornando acomodações que estão livres e o host é um superhost.

![image](https://github.com/CarlosCaastro/ADA-05/assets/110546779/9bf7fde8-c2f9-4b68-bcf2-f11ca949cbf8)
