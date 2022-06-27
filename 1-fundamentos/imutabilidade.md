# Imutabilidade

Supondo que temos uma variável string chamada `name`, e então queremos formatá-la em caixa baixa, em um linguagem orientada à objeto, poderiamos modificar o valor da variável em memória fazendo algo do tipo:

```java
String name = "Jonatas";

System.out.println(name.toUpperCase());
```

Porém numa abordagem mais funcional, o correto é não alterar o valor original em memória, e sim criar um novo valor modificado:

```elixir
name = "Jonatas"

String.downcase(name)
# jonatas
```

Se chamar a variável criada anteriormente, ela vai continuar com o mesmo valor:

```elixir
name
# Jonatas
```

E mesmo reatribuindo o valor à mesma variável, ainda assim estaremos criando um novo espaço de memória, o valor `Jonatas` assim como qualquer outro valor antigo, ainda continuará guardado, porém o Elixir consegue identificar que ele não está mais sendo utilizado:

```elixir
name = "Johnny"
# Johnny
```

Esse conceito é importante porque temos que garantir que ao trabalhar com processamento assíncrono ou concorrente, a memória não está sendo alterada no mesmo momento e ela poderá ser lida ou reatribuida com segurança.

Isso pode gerar a dúvida: "_Então o Elixir vai consumir muita memória?_", e não, porque o Elixir possui uma maquina virtual otimizada para isso, sempre identificando o que não está sendo utilizado e limpando o lixo, além de outras estratégias de apoveitamento de dados.
