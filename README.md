# Movies

- Arquitetura: Clean.
- Linguagem: Dart.

## Demo

![Farmers Market Finder Demo](demo/movie-clean.gif)


## Implementação e Layout

### Core
 - Constants (Boas práticas de unificaçõo de strings e cores do projeto)
 - Erros (Classe Failure abstrata para tratamentos de execeptions)
 - Exception (Métodos para tratamentos de execeptions)
 - Route (Rotas de regisro de página do app)
 - UseCases (Abrastração para padrão Model e parâmetros no usecases de feature)
 - Widgets (Abstração para injeção de controller no estado do widget page)
 
### Feature
 - Movies (Categorias de filmes em exibição e em breve, contém cartaz do filme e avaliação)
 - Detail (Mais informações sobre o filme, banner, avaliação, total de avaliações, titulo, ano, tempo, resumo e elenco)
