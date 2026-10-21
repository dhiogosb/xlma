# Power BI — Campinas (SP) | IBGE

Projeto isolado do suplemento Excel existente neste repositório.

**Município:** Campinas, SP — código IBGE **3509502**.

## Como utilizar

1. Abra o Power BI Desktop e crie um relatório em branco.
2. Em **Transformar dados > Nova fonte > Consulta em branco > Editor avançado**, cole o conteúdo de `powerquery/PopulacaoEstimada.m`.
3. Renomeie a consulta para `PopulacaoEstimada` e aplique as alterações.
4. Crie as medidas em `dax/medidas.dax` (uma medida por vez).
5. Monte os gráficos conforme `docs/layout.md`.

A consulta consome a API pública SIDRA/IBGE no momento da atualização. O código filtra estritamente Campinas (3509502), converte ano e população em números e descarta linhas inválidas.

**Importante:** este repositório contém o código-fonte reproduzível, **não** um arquivo `.pbix` compilado. O arquivo PBIX deve ser salvo pelo Power BI Desktop após a importação. A disponibilidade e os valores atuais da API ainda precisam ser validados durante a primeira atualização.

**Fontes:** [SIDRA/IBGE](https://sidra.ibge.gov.br/) e [API SIDRA](https://apisidra.ibge.gov.br/). Tabela 6579, variável 9324 (população residente estimada). Indicadores de anos diferentes não devem ser tratados como se fossem do mesmo ano.
