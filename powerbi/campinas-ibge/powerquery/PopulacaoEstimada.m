let
    CodigoMunicipio = "3509502",
    Url = "https://apisidra.ibge.gov.br/values/t/6579/n6/" & CodigoMunicipio & "/v/9324/p/all?formato=json",
    Fonte = Json.Document(Web.Contents(Url)),
    Registros = Table.FromRecords(Fonte),
    // O primeiro registro da API SIDRA descreve os nomes das colunas.
    Cabecalho = Record.ToList(Registros{0}),
    Linhas = Table.Skip(Registros, 1),
    Renomeada = Table.RenameColumns(Linhas, List.Zip({Table.ColumnNames(Linhas), List.Transform(Cabecalho, each Text.From(_))}), MissingField.Ignore),
    // Os nomes de colunas da API variam conforme a seleção; utilizamos os identificadores originais.
    Bruta = Table.FromRecords(List.Skip(Fonte, 1)),
    Campos = Table.SelectColumns(Bruta, {"D1C", "D2C", "V"}, MissingField.UseNull),
    Campinas = Table.SelectRows(Campos, each Text.From([D1C]) = CodigoMunicipio),
    Tipos = Table.TransformColumns(Campinas, {
        {"D2C", each try Int64.From(Text.From(_)) otherwise null, Int64.Type},
        {"V", each try Number.FromText(Text.From(_), "en-US") otherwise null, type number}
    }),
    Validas = Table.SelectRows(Tipos, each [D2C] <> null and [V] <> null),
    Resultado = Table.RenameColumns(Validas, {{"D2C", "Ano"}, {"V", "Populacao"}}),
    Ordenada = Table.Sort(Resultado, {{"Ano", Order.Ascending}})
in
    Ordenada
