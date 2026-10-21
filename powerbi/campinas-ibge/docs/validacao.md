# Validação SQL conceitual / Power Query

Na tabela PopulacaoEstimada:
- Não permitir Ano nulo.
- Não permitir Populacao nula ou negativa.
- Confirmar unicidade de Ano.
- A API deve retornar apenas D1C = 3509502 antes da transformação.
- Conferir os anos disponíveis e registrar a data de atualização.

## Checklist de revisão
- [ ] Endpoint acessível
- [ ] Schema D1C / D2C / V confirmado
- [ ] Filtro Campinas verificado
- [ ] Valores confrontados com IBGE
- [ ] Power BI Desktop atualizado
- [ ] PBIX salvo
- [ ] Publicado no workspace
