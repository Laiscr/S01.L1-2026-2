# IA_REPORT.md

## 1. Identificação

- **Nome completo:** Laís Carlos Rodrigues
- **Matrícula:** 681

---

## 2. Histórico de Prompts

### Modelo utilizado: Gemini Flash

---

### Prompt 1

**Pergunta enviada à IA:**

> Baseado neste material, me ensine mais do Prolog com exemplos mais claros para eu entender os exercícios. Não os resolva, quero que me ensine a linguagem para que eu consiga resolvê-los.

**Resposta obtida:**

A maior virada de chave em Prolog é mudar a mentalidade de **como fazer** (C++, Java, Python) para **o que é verdade**. Em vez de escrever passos e loops, você cria um banco de dados lógico e faz perguntas a ele.

**1. Fatos, Constantes e Variáveis**

Tudo começa com **fatos** — verdades absolutas da base de conhecimento:

```prolog
casa(harry, grifinoria).
casa(hermione, grifinoria).
casa(draco, sonserina).
feitico(harry, expelliarmus).
feitico(hermione, wingardium_leviosa).
```

Regras de sintaxe: letras minúsculas (`harry`, `grifinoria`) são constantes (átomos); letras maiúsculas (`X`, `Aluno`) são variáveis lógicas — o Prolog *descobre* quais valores se encaixam nelas; `_` é a variável anônima ("não me importa o valor, só quero saber se existe"); e todo fato termina obrigatoriamente com `.`.

**2. Regras: Conectando Condições (E e OU)**

A estrutura é sempre `conclusao :- condicoes.` (lê-se: a conclusão é verdadeira **se** as condições forem verdadeiras). A vírgula `,` significa **E** e o ponto e vírgula `;` significa **OU**.

A vírgula tem prioridade sobre o ponto e vírgula, assim como a multiplicação tem prioridade sobre a soma. Use parênteses para agrupar o `OU`:

```prolog
% Jeito CERTO (com parênteses agrupando o OU):
monitor(Aluno) :-
    (casa(Aluno, grifinoria) ; casa(Aluno, corvinal)),
    feitico(Aluno, expelliarmus).
```

Sem os parênteses, o Prolog entenderia: "ser da Grifinória (sem precisar saber feitiço nenhum) OU (ser da Corvinal E saber expelliarmus)".

**3. Comparações e Diferença (`\=`)**

Para garantir que duas variáveis descobertas pelo Prolog não sejam a mesma coisa, use `\=` (diferente):

```prolog
colegas_de_casa(A, B) :-
    casa(A, C),
    casa(B, C),
    A \= B.
```

O `A \= B` vem por último porque o Prolog precisa primeiro preencher `A` e `B` com nomes reais antes de poder compará-los. Se você colocar `A \= B` na primeira linha, quando ambos ainda estão vazios, a comparação falha imediatamente.

**4. Recursão: Cadeias e Linhagens**

Em Prolog não existem laços `for` ou `while`. Para percorrer uma cadeia de tamanho desconhecido, usa-se recursão. Toda recursão exige duas regras com o mesmo nome: o caso base (onde para) e o passo recursivo (que avança um nível e chama a própria regra):

```prolog
% Fatos
inspirou(merlin, dumbledore).
inspirou(dumbledore, harry).
inspirou(harry, ginny).

% Caso base: inspiração direta
legado(Mestre, Aprendiz) :-
    inspirou(Mestre, Aprendiz).

% Passo recursivo
legado(Mestre, Aprendiz) :-
    inspirou(Mestre, Intermediario),
    legado(Intermediario, Aprendiz).
```

Ao perguntar `?- legado(merlin, Quem).`, o Prolog responde `dumbledore`, depois `harry`, depois `ginny` — avançando um nível a cada "Next".

**Checklist antes de rodar no SWISH:** abra o arquivo base e observe os nomes exatos dos predicados já cadastrados. Use exatamente os mesmos nomes e a mesma ordem de argumentos.

---

### Prompt 2

**Pergunta enviada à IA:**

> Por que `cla(sakura, X)` falha em vez de responder sem clã? O que o Prolog faz com informação ausente?

**Resposta obtida:**

Isso acontece por causa de um princípio fundamental chamado **Suposição do Mundo Fechado** (*Closed-World Assumption* — CWA).

Para o Prolog, o arquivo `.pl` carregado é o universo inteiro. **Tudo o que é verdade está escrito na base de conhecimento; qualquer coisa que não esteja lá é automaticamente considerada falsa.**

**O que acontece com `cla(sakura, X)`**

O Prolog varre todos os fatos `cla(...)` procurando algum com `sakura` como primeiro argumento. Como não existe nenhum, a variável `X` não consegue se unificar em nenhum valor e o Prolog responde `false` — não que Sakura não tenha clã, mas que "não há prova disso na base".

**O impacto nas regras com duas pessoas**

Se você escrever a regra de rivais exigindo `cla(A, ClaA)` e `cla(B, ClaB)`, o Prolog vai abortar qualquer par onde um dos ninjas não tenha clã cadastrado — pois a condição falha antes mesmo de chegar no `ClaA \= ClaB`. Isso é esperado no exercício: apenas ninjas com clã cadastrado passam por esse filtro.

**E se quiséssemos encontrar quem não tem clã?**

Usamos o operador de negação por falha (`\+`):

```prolog
sem_cla(Ninja) :-
    ninja(Ninja),
    \+ cla(Ninja, _).
```

Como `cla(sakura, _)` dá `false`, o `\+` transforma em `true`. O `\+` inverte o resultado da tentativa de prova.

---

### Prompt 3

**Pergunta enviada à IA:**

> O que acontece se a recursão não tiver caso base? Por exemplo: erro, loop infinito ou false?

**Resposta obtida:**

A resposta curta é: depende de como os dados estão conectados, mas em quase todos os casos resulta em **loop infinito** (que estoura a memória com erro de *Stack Overflow*).

**Cenário 1: Loop Infinito (recursão antes de qualquer fato)**

Se a chamada recursiva vem antes de qualquer fato que limite a busca:

```prolog
% ERRADO: recursão antes de qualquer verificação de fato
linhagem(M, D) :-
    linhagem(M, Z),
    mestre(Z, D).
```

O Prolog entra em queda livre: para saber `linhagem(jiraiya, naruto)`, precisa de `linhagem(jiraiya, Z)`, que por sua vez precisa de `linhagem(jiraiya, Z2)`, para sempre, sem olhar um único fato `mestre`. O SWISH trava e mostra **Stack limit exceeded**.

**Cenário 2: Dá `false` (fato antes, mas a cadeia tem fim)**

```prolog
% ERRADO: só o passo recursivo, sem caso base
linhagem(M, D) :-
    mestre(M, Z),
    linhagem(Z, D).
```

Aqui o Prolog avança pela cadeia (`jiraiya → minato → kakashi → naruto`), mas quando chega ao fim e precisa de `linhagem(naruto, naruto)`, não acha nenhum fato `mestre(naruto, Z)` que leve a lugar algum. O backtracking retorna todo o caminho sem encontrar prova e responde `false`.

*Nota: se houvesse um ciclo nos dados (A ensinou B e B ensinou A), esse mesmo código sem caso base entraria em loop infinito.*

**Resumo prático**

Por isso a ordem é essencial: caso base primeiro (conexão direta), passo recursivo depois (avança um passo e chama a própria regra).

---

### Prompt 4

**Pergunta enviada à IA:**

> O que o `\+` faz e por que ele exige que a variável já esteja preenchida?

**Resposta obtida:**

O operador `\+` significa **"não provável"** (negação por falha). Ele tenta provar a condição à sua frente: se o Prolog **falhar**, o `\+` transforma em **sucesso**; se o Prolog **provar**, o `\+` transforma em **falha**.

**O jeito ERRADO (variável vazia antes do `\+`):**

```prolog
precisa_descanso(A) :-
    \+ status(A, disponivel).
```

Quando se pergunta `?- precisa_descanso(X).`, a variável `A` está vazia. O Prolog então pergunta internamente: *"Existe alguém na base cujo status seja `disponivel`?"*. Como `aria` está disponível, dá `true`. O `\+` inverte para `false` e a consulta falha imediatamente, sem testar mais ninguém.

**O jeito CERTO (preenchendo a variável antes do `\+`):**

```prolog
precisa_descanso(A) :-
    classe(A, _),
    \+ status(A, disponivel).
```

Passo a passo: `classe(A, _)` preenche `A = aria` → `\+ status(aria, disponivel)` dá `false` (aria está disponível) → backtracking → `A = brom` → `\+ status(brom, disponivel)` dá `true` (brom está ferido) → resposta: `X = brom`.

Em resumo: sempre **gere os candidatos** primeiro com um fato positivo, depois **filtre** com o `\+`.

---

### Prompt 5

**Pergunta enviada à IA:**

> Como eliminar respostas duplicadas? (vi que existe, mas não foi ensinado no material)

**Resposta obtida:**

No Prolog, respostas duplicadas acontecem porque o motor de busca entrega uma solução para cada caminho lógico que der certo. Existem três formas principais de eliminar essas duplicatas:

**1. Na consulta usando `setof/3` ou `distinct/1`**

Mantém as regras limpas e filtra apenas na hora de perguntar no SWISH:

```prolog
% distinct: entrega um resultado por vez, descartando repetições
?- distinct(ninja_versatil(X)).

% setof: coleta tudo numa lista ordenada e sem repetições
?- setof(X, ninja_versatil(X), Lista).
```

**2. Dentro da regra com o operador de corte (`!`)**

```prolog
versatil(Aluno) :-
    feitico(Aluno, F1),
    feitico(Aluno, F2),
    F1 \= F2,
    !.
```

**Cuidado:** o `!` funciona bem para testar um aluno específico (`?- versatil(harry).`), mas em consultas abertas (`?- versatil(Quem).`) trava na primeira pessoa encontrada e impede o Prolog de continuar. Para consultas abertas, `distinct` ou `setof` são muito mais seguros.

**3. Quebrando a simetria com `@<` (ordenação alfabética)**

Quando duplicatas vêm de pares simétricos como `(fogo, raio)` e `(raio, fogo)`, troque `\=` por `@<`:

```prolog
versatil(Aluno) :-
    feitico(Aluno, F1),
    feitico(Aluno, F2),
    F1 @< F2.
```

Como `"fogo"` vem antes de `"raio"` no alfabeto, `(fogo, raio)` passa, mas `(raio, fogo)` falha — cortando metade das repetições na raiz.

Dica: como o material avisa que "Respostas repetidas são normais", deixe as regras no formato padrão para o corretor e use `distinct(...)` apenas para visualização durante os testes.

---

### Prompt 6

**Pergunta enviada à IA:**

> Como eu testaria cada regra isoladamente antes de rodar a query final?

**Resposta obtida:**

A melhor estratégia é usar **testes de sanidade** diretamente na caixa de consulta (*Query*) do SWISH, usando constantes (nomes reais que você já sabe que estão no banco) em vez de variáveis abertas.

**1. Teste de Caso Positivo (deve dar `true`)**

Escolha um personagem que certamente cumpre todos os requisitos da regra:

```prolog
?- monitor(harry).
```

Se retornar `false`, errou algum operador, esqueceu parênteses ou digitou o nome de algum predicado errado.

**2. Teste de Caso Negativo (deve dar `false`)**

Escolha um personagem que cumpre apenas metade da regra:

```prolog
?- monitor(hermione).
```

Se retornar `true` por engano, o `OU` (`;`) está sem parênteses e aprovando qualquer um da Grifinória.

**3. Teste de Borda (para comparações e recursão)**

```prolog
?- rivais(naruto, naruto).        % deve dar false (filtro A \= B)
?- linhagem(jiraiya, minato).     % caso base — deve dar true
?- linhagem(jiraiya, kakashi).    % 1 passo recursivo — deve dar true
?- linhagem(naruto, jiraiya).     % sentido inverso — deve dar false
```

**Dica extra: `trace.`**

Se um teste isolado falhar sem motivo aparente, use `trace.` antes da consulta (`?- trace, monitor(harry).`). O SWISH abre um painel mostrando cada tentativa do Prolog: onde ele acertou (`Exit`) e exatamente onde falhou (`Fail`).

---

### Prompt 7

**Pergunta enviada à IA:**

> Dê mais exemplos.

**Resposta obtida:**

Quatro cenários inspirados no estilo dos exercícios do relatório, usando um universo de desenvolvimento de software:

```prolog
% Fatos base
projeto(ana, backend).
projeto(bruno, frontend).
projeto(carla, backend).
projeto(diego, dados).

linguagem(ana, python).
linguagem(bruno, javascript).
linguagem(carla, java).
linguagem(diego, python).

status(ana, ativo).
status(bruno, ativo).
status(carla, inativo).
linguagem(ana, javascript).
linguagem(carla, csharp).

mentor(lucas, ana).
mentor(lucas, bruno).
mentor(lucas, diego).
equipe(ana, alfa).
equipe(bruno, beta).
equipe(diego, alfa).

depende(app_web, api_rest).
depende(api_rest, banco_dados).
depende(banco_dados, driver_sql).
depende(app_web, biblioteca_ui).
```

**Cenário 1 — Combinando E e OU (modelo do Exercício 1)**

```prolog
apto_api(Dev) :-
    (projeto(Dev, backend) ; projeto(Dev, dados)),
    (linguagem(Dev, python) ; linguagem(Dev, go)).
```

Os parênteses garantem que o Prolog primeiro encontre quem é de `backend` ou `dados` e depois verifique obrigatoriamente se a mesma pessoa sabe `python` ou `go`. `apto_api(ana)` → `true`; `apto_api(carla)` → `false` (backend mas só Java).

**Cenário 2 — Duas características diferentes na mesma entidade (modelo do Exercício 2)**

```prolog
fullstack(Dev) :-
    status(Dev, ativo),
    linguagem(Dev, L1),
    linguagem(Dev, L2),
    L1 \= L2.
```

`status` filtra logo quem está ativo; depois o Prolog busca dois fatos de linguagem diferentes. Para `bruno` (só JavaScript), `L1` e `L2` sempre recebem `javascript` e nunca passam pelo `L1 \= L2`.

**Cenário 3 — Relação entre duas pessoas diferentes (modelo do Exercício 3)**

```prolog
parceiros_de_troca(A, B) :-
    mentor(M, A),
    mentor(M, B),
    A \= B,
    equipe(A, EqA),
    equipe(B, EqB),
    EqA \= EqB.
```

Com `?- parceiros_de_troca(ana, Quem).`: `M = lucas`; `B = ana` falha no `A \= B`; `B = bruno` passa e `alfa \= beta` confirma → resposta `Quem = bruno`; `B = diego` passa o `A \= B` mas `alfa \= alfa` falha → descartado.

**Cenário 4 — Cadeia de dependências com recursão (modelo do Exercício 4)**

```prolog
% Caso base: dependência direta
precisa_de(Pacote, Dep) :-
    depende(Pacote, Dep).

% Passo recursivo
precisa_de(Pacote, Dep) :-
    depende(Pacote, Intermediario),
    precisa_de(Intermediario, Dep).
```

Com `?- precisa_de(app_web, OQue).`: o caso base responde `api_rest` e `biblioteca_ui`; o passo recursivo avança por `api_rest` → `banco_dados` → `driver_sql`. Quando chega em `driver_sql` e `biblioteca_ui` sem mais fatos `depende`, a recursão encerra naturalmente.

---

### Prompt 8

**Pergunta enviada à IA:**

> Me dê exemplos dos erros que o material mostra.

**Resposta obtida:**

Os 4 erros mais comuns no primeiro contato com Prolog, com exemplos práticos de cada:

**1. Maiúscula vira variável**

```prolog
% Errado: Prolog entende Aria como "qualquer pessoa"
?- classe(Aria, maga).

% Certo:
?- classe(aria, maga).
```

**2. Esquecer o ponto final (`.`)**

```prolog
% Errado: Prolog tenta juntar as duas linhas e gera erro de sintaxe
classe(aria, maga)
classe(brom, guerreiro).

% Certo:
classe(aria, maga).
classe(brom, guerreiro).
```

O erro de sintaxe aponta para a **linha 2** (a seguinte ao problema), o que costuma confundir.

**3. Espaço antes do parêntese**

```prolog
% Errado:
classe (aria, maga).

% Certo:
classe(aria, maga).
```

Nos slides do PDF pode aparecer espaço por formatação, mas no SWISH real gera erro imediato.

**4. Fatos espalhados (`discontiguous`)**

```prolog
% Errado: fatos do mesmo predicado divididos em dois lugares
classe(aria, maga).
status(aria, disponivel).
classe(brom, guerreiro).   % <-- separado do grupo anterior!

% Certo:
classe(aria, maga).
classe(brom, guerreiro).

status(aria, disponivel).
status(brom, ferido).
```

O código roda, mas o SWISH exibe aviso amarelo: `Warning: Clauses of classe/2 are not together in the source-file`.

---

### Prompt 9

**Pergunta enviada à IA:**

> Prolog tem muita relação com matemática discreta né?

**Resposta obtida:**

Sim, total! O Prolog é praticamente **Matemática Discreta executável**:

**Lógica de Predicados (1ª Ordem):** Os predicados do Prolog (`mestre(M, D)`, `cla(A, C)`) são literalmente os predicados matemáticos `P(x, y)`. As variáveis maiúsculas funcionam como quantificadores existenciais quando você faz uma consulta ("existe algum x que satisfaz isso?").

**Implicação Lógica e Cláusulas de Horn:** O símbolo `:-` é o operador de implicação escrito ao contrário. A regra `A :- B, C.` é exatamente a fórmula lógica `(B e C) → A`, chamada de **Cláusula de Horn** na lógica matemática.

**Relações e Teoria dos Conjuntos:** Uma base de fatos como `caminho(origem, destino)` define um conjunto de pares ordenados `(x, y) ∈ R` — uma relação binária sobre um domínio de elementos.

**Grafos e Fecho Transitivo:** O Exercício 4 (`linhagem`) é a implementação direta do fecho transitivo `R+` de um grafo direcionado.

**Indução Matemática:** A estrutura da recursão em Prolog (caso base + passo recursivo) segue exatamente o raciocínio da prova por indução.

Quando você olha os exercícios pensando como relações em grafos e fórmulas proposicionais, a sintaxe do Prolog fica muito mais natural de montar.

---

### Prompt 10

**Pergunta enviada à IA:**

> Minha regra 1 está dando problema com o mestre. Como posso consertar?

```prolog
% ==========================================
% RELATÓRIO 14 - BANCO DE DADOS: O MUNDO NINJA
% ==========================================

% Fatos: Linhagem de treinamento
mestre(hashirama, hiruzen).
mestre(tobirama, hiruzen).
mestre(hiruzen, jiraiya).
mestre(hiruzen, tsunade).
mestre(hiruzen, orochimaru).
mestre(jiraiya, minato).
mestre(jiraiya, nagato).
mestre(jiraiya, naruto).
mestre(minato, kakashi).
mestre(minato, obito).
mestre(minato, rin).
mestre(kakashi, naruto).
mestre(kakashi, sasuke).
mestre(kakashi, sakura).
mestre(tsunade, sakura).
mestre(orochimaru, sasuke).
mestre(orochimaru, kabuto).
mestre(guy, lee).
mestre(guy, neji).
mestre(guy, tenten).
mestre(kurenai, hinata).
mestre(kurenai, kiba).
mestre(kurenai, shino).
mestre(asuma, shikamaru).
mestre(asuma, ino).
mestre(asuma, choji).
mestre(naruto, konohamaru).

% Fatos: Natureza do chakra
natureza(naruto, vento).
natureza(sasuke, fogo).
natureza(sasuke, raio).
natureza(sakura, terra).
natureza(kakashi, raio).
natureza(kakashi, agua).
natureza(kakashi, terra).
natureza(jiraiya, fogo).
natureza(jiraiya, terra).
natureza(hiruzen, fogo).
natureza(hiruzen, terra).
natureza(hashirama, terra).
natureza(hashirama, agua).
natureza(tobirama, agua).
natureza(obito, fogo).
natureza(itachi, fogo).
natureza(itachi, agua).
natureza(asuma, vento).
natureza(gaara, vento).
natureza(deidara, terra).
natureza(deidara, raio).
natureza(kisame, agua).
natureza(boruto, raio).
natureza(boruto, vento).

% Fatos: Clã
cla(naruto, uzumaki).
cla(nagato, uzumaki).
cla(boruto, uzumaki).
cla(sasuke, uchiha).
cla(itachi, uchiha).
cla(obito, uchiha).
cla(minato, namikaze).
cla(kakashi, hatake).
cla(hashirama, senju).
cla(tobirama, senju).
cla(tsunade, senju).
cla(hiruzen, sarutobi).
cla(asuma, sarutobi).
cla(konohamaru, sarutobi).
cla(hinata, hyuga).
cla(neji, hyuga).
cla(shikamaru, nara).
cla(ino, yamanaka).
cla(choji, akimichi).
cla(kiba, inuzuka).
cla(shino, aburame).

% Fatos: Vila de origem
vila(naruto, konoha).
vila(sasuke, konoha).
vila(sakura, konoha).
vila(kakashi, konoha).
vila(jiraiya, konoha).
vila(tsunade, konoha).
vila(hiruzen, konoha).
vila(hashirama, konoha).
vila(minato, konoha).
vila(guy, konoha).
vila(lee, konoha).
vila(hinata, konoha).
vila(shikamaru, konoha).
vila(gaara, suna).
vila(kisame, kiri).
vila(deidara, iwa).
vila(nagato, ame).

% Fatos: Organização
organizacao(itachi, akatsuki).
organizacao(kisame, akatsuki).
organizacao(deidara, akatsuki).
organizacao(nagato, akatsuki).
organizacao(obito, akatsuki).
organizacao(jiraiya, sannin).
organizacao(tsunade, sannin).
organizacao(orochimaru, sannin).

% Fatos: Invocação
invocacao(naruto, sapo).
invocacao(jiraiya, sapo).
invocacao(minato, sapo).
invocacao(tsunade, lesma).
invocacao(orochimaru, cobra).
invocacao(sasuke, falcao).
invocacao(kakashi, cao_ninja).

% Regra 1:
mestre(sasuke, boruto).
mestre(naruto, boruto).

aprendiz_de_elite(Ninja) :-
    ( mestre(kakashi, Ninja) ; mestre(sasuke, Ninja) ),
    ( natureza(Ninja, raio) ; natureza(Ninja, fogo) ).

% ?- aprendiz_de_elite(Ninja).

% Regra 2:
ninja_versatil(Ninja) :-
    natureza(Ninja, X),
    natureza(Ninja, Y),
    X \= Y,
    vila(Ninja, konoha).

% ?- ninja_versatil(Ninja).

% Regra 3:
rivais(A, B) :-
    mestre(M, A),
    mestre(M, B),
    A \= B,
    cla(A, C1),
    cla(B, C2),
    C1 \= C2.

% ?- rivais(naruto, B).

% Regra 4:
linhagem(M, D) :-
    mestre(M, D).

linhagem(M, D) :-
    mestre(M, Z),
    linhagem(Z, D).

% ?- linhagem(jiraiya, D).
```

**Resposta obtida:**

O problema na Regra 1 é exatamente o **erro #4 do slide 16 (Fatos espalhados / `discontiguous`)**.

Lá no topo do arquivo estão todos os fatos `mestre(...)`, mas dentro da seção `% Regra 1:` você escreveu `mestre(sasuke, boruto).` e `mestre(naruto, boruto).` separados do bloco original. Com os fatos do mesmo predicado divididos em dois lugares, o Prolog dispara: `Warning: Clauses of mestre/2 are not together in the source-file`.

**Como consertar:** mova essas duas linhas para o topo do arquivo, logo abaixo de `mestre(naruto, konohamaru).`:

```prolog
mestre(naruto, konohamaru).
mestre(sasuke, boruto).     % <-- adicionar aqui
mestre(naruto, boruto).     % <-- adicionar aqui
```

**Revisão rápida das 4 regras**

A sintaxe e o raciocínio lógico ficaram excelentes em todas: a Regra 1 tem os parênteses agrupando os dois `;` corretamente; a Regra 2 verifica duas naturezas diferentes antes de checar a vila; a Regra 3 preenche mestres e clãs antes de aplicar os `\=`; e a Regra 4 tem o caso base na frente e o passo recursivo logo abaixo, sem risco de loop. Depois de subir os dois fatos do Boruto para o bloco de `mestre`, o aviso desaparece e todas as queries rodam limpas.

---

## 3. Relatório de Aprendizado

### Como a resposta me ajudou (ou falhou em me ajudar) na solução do problema:

As respostas funcionaram como uma aula de Prolog antes de eu tentar os exercícios. Cada prompt cobriu um conceito diferente com exemplos no mesmo estilo do relatório, o que tornou tudo muito mais fácil de aplicar. O Prompt 10 foi o mais prático: a IA revisou meu código completo e apontou exatamente qual era o problema.

### De que forma ela solucionou a minha dúvida:

Entendi que o Prolog exige uma mudança de mentalidade, não se programa passos, mas se "declaram" verdades (pontente essa frase hein). Os pontos mais importantes foram: a vírgula tem prioridade sobre o ponto e vírgula (use parênteses para agrupar o `OU`); variáveis precisam estar preenchidas antes de usar `\=` e `\+`; toda recursão precisa de caso base; e fatos do mesmo predicado devem ficar agrupados no arquivo para evitar o aviso `discontiguous`.

### O que aprendi com aquele retorno para aplicar em problemas futuros:

Aprendi a testar regras isoladamente com constantes antes de abrir para variáveis: um caso positivo, um negativo e um de borda. Aprendi também que `\+` não descobre valores, apenas testa perguntas de sim/não sobre algo já conhecido. E que, antes de rodar a query final, é bom sempre verificar se todos os fatos do mesmo predicado estão agrupados no arquivo.