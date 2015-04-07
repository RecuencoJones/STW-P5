# Execution order

- Execute mysql schema script from module [Database](Database/src/main/resources/stw-prediccion.sql)
- Run `java -jar XmlParser.jar <url>`
- Run `java -jar JsonGenerator.jar <filename> <path>`
- Run `java -jar JsonParser.jar <url> <path>`