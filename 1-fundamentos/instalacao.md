# Instalando o Erlang/Elixir

Para utilizar o Elixir, precisamos ter instalado:

- Erlang
- Elixir

> Para usuários de Linux, é recomendável instalar o Elixir com ASDF.

## Instalando o ASDF

Para instalar o ASDF é necessário ter o Git instalado.

Clone o repositório do ASDF:

```sh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0
```

Edite o arquivo .zshrc adicionando a seguinte a linha:

```sh
. $HOME/.asdf/asdf.sh
```

Para testar se está funcionando rode o comando:

```sh
asdf
```

O ASDF utiliza um sistema de plugins para suportar diversas linguagens, então instale os seguintes plugins:

```sh
asdf plugin add erlang
```

```sh
asdf plugin add elixir
```

Talvez seja necessário instalar dependência no SO antes de instalar uma versão do Erlang, para verificar as dependências de cada SO leia a [doc](https://github.com/asdf-vm/asdf-erlang).

Se um determindo projeto tiver o arquivo `.tool-versions` com entradas para Elixir ou Erlang, então você poderá instalar a versão exata do projeto executando o comando `asdf install`.

Caso não esteja em um projeto que precise de uma versão específica ou só queira só instalar o Erlang globalmente por exemplo, podemos utilizar o comando abaixo para verificar quais são as versões possíveis:

```sh
asdf list-all erlang
```

## Instalando o Erlang

Para instalar o Erlang via ASDF utilize o comando:

```sh
asdf install erlang 24.3.4.2
asdf global erlang 24.3.4.2
```

## Instalando o Elixir

Para instalar o Elixir via ASDF utilize o comando:

```sh
asdf install elixir 1.13.3
asdf global elixir 1.13.3
```

## Listando instalções

Para verificar quais linguagens e versões temos instaladas, podemos utilizar os comandos:

```sh
asdf list {nome-da-linguagem}
```

## Referências

- [Instalação do ASDF](https://asdf-vm.com/guide/getting-started.html)
- [Instalação guiada ASDF - Clube do Hardware](https://www.clubedohardware.com.br/forums/topic/1590823-instalando-o-asdf-programing-languages-version-manager-no-shell-zsh/)
- [Instalando Erlang e Elixir via ASDF - PluralSight](https://www.pluralsight.com/guides/installing-elixir-erlang-with-asdf)
- [Install Elixir with ASDF Linux - Youtube](https://www.youtube.com/watch?v=-I8V-FcuX2E)
