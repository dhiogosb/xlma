let
    CodigoMunicipio = "3509502",
    Fonte = Json.Document(Web.Contents("https://apisidra.ibge.gov.br", [RelativePath = "values/t/6579/n6/" & CodigoMunicipio & "/v/9324/p/all", Query = [formato = "json"]])),
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
