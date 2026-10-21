# Layout proposto — Campinas (SP)

## Página 1: População

- **Cartão:** População Último Ano
- **Cartão:** Último Ano Disponível
- **Linha:** eixo PopulacaoEstimada[Ano], valor SUM(PopulacaoEstimada[Populacao])
- **Tabela:** Ano, Populacao e Variacao Populacional %
- **Rodapé:** Fonte: IBGE/SIDRA, tabela 6579, variável 9324. Município 3509502. Ano indicado no visual.

## Qualidade e validação

- Confirmar que os registros retornados têm D1C = 3509502.
- Conferir se Ano e Populacao são numéricos, não nulos e sem duplicidade por ano.
- Comparar último valor e ano com a tabela 6579 no SIDRA.
- Não atribuir ao Censo os números de estimativas populacionais.
- Não agregar população entre anos diferentes.
- Não publicar como concluído sem testar a atualização no Power BI Desktop.

## Próximas páginas

PIB, educação e domicílios exigem seleção explícita das tabelas e variáveis oficiais correspondentes, com granularidade e período documentados antes da inclusão.
