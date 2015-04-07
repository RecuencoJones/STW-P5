# Execution order

- Execute mysql schema script from module [Database](PrediccionParser/src/main/resources/stw-prediccion.sql)
- Run jar at [XmlParser](XmlParser)
- Run jar at [JsonGenerator](JsonGenerator)
- Start server at [JsonParser](JsonParser)