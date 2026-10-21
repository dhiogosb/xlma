# Contrato de dados e publicação

## Fonte implementada
| Dataset | Fonte | Código | Granularidade | Atualização |
|---|---|---|---|---|
| PopulacaoEstimada | SIDRA/IBGE tabela 6579, variável 9324 | 3509502 | Município / ano | Atualização manual ou agendada no Power BI |

API: https://apisidra.ibge.gov.br/values/t/6579/n6/3509502/v/9324/p/all?formato=json

## Restrições
- Município sempre 3509502; bloquear valores de outros municípios.
- Não interpretar estimativas anuais como resultados do Censo 2022.
- Exibir ano de referência nos gráficos e indicadores.
- O Power BI Service exige credenciais da fonte Web configuradas (em geral anônimas para dados públicos) e autorização de publicação.
- Não declarar validação de API ou execução do PBIX sem evidência de teste.

## Critérios de aceite
1. API responde JSON com cabeçalho e linhas de dados.
2. Todos os dados têm D1C = 3509502.
3. D2C é ano válido; V é numérico; uma observação por ano.
4. Atualização Power Query conclui sem erro no Power BI Desktop.
5. Última estimativa confere com publicação IBGE/SIDRA.
6. Modelo publicado em workspace autorizado, sem credenciais no Git.

## Pendências
- Verificar disponibilidade da fonte pública no ambiente de execução.
- Acrescentar PIB, educação e domicílios somente após identificação e conferência das tabelas/variáveis oficiais.
- Construir o arquivo .pbix e validar visuais.
- Publicar no workspace após conexão Microsoft Power BI.
