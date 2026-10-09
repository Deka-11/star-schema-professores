# Modelagem Dimensional — Star Schema de Professores

## 📌 Sobre o Projeto

Este projeto foi desenvolvido como parte de um desafio prático da **Digital Innovation One (DIO)**, com o objetivo de aplicar os conceitos de modelagem dimensional por meio da criação de um **Star Schema (Esquema em Estrela)**.

A proposta consiste em transformar um modelo relacional de uma universidade em um modelo dimensional, utilizando os professores como principal objeto de análise.

O projeto foi desenvolvido utilizando **MySQL e MySQL Workbench**, permitindo a criação das tabelas, a definição de chaves primárias e estrangeiras e a visualização dos relacionamentos por meio de um diagrama EER.

## 🎯 Objetivos

- Aplicar os conceitos de modelagem dimensional.
- Desenvolver um esquema em estrela com foco nos professores.
- Criar uma tabela fato central e tabelas dimensão.
- Estabelecer relacionamentos entre as tabelas utilizando chaves primárias e estrangeiras.
- Implementar uma dimensão de datas para análises temporais.
- Praticar SQL e modelagem de bancos de dados.
- Documentar a estrutura desenvolvida para facilitar sua compreensão e reutilização.

## 🛠️ Tecnologias Utilizadas

- **MySQL:** criação e estruturação do banco de dados.
- **MySQL Workbench:** desenvolvimento dos scripts SQL e construção do diagrama EER.
- **SQL:** definição das tabelas, chaves primárias e estrangeiras.
- **GitHub:** versionamento, documentação e publicação do projeto.

## 🗂️ Estrutura do Modelo Dimensional

O projeto utiliza uma tabela fato central, relacionada a cinco tabelas dimensão.

### Tabela Fato — `fato_professor`

Representa o contexto de análise das ofertas de disciplinas associadas aos professores.

Campos:

- `idFato` — chave primária.
- `idProfessor` — referência ao professor.
- `idDepartamento` — referência ao departamento.
- `idDisciplina` — referência à disciplina.
- `idCurso` — referência ao curso.
- `idData` — referência à data.
- `Quantidade_Ofertas` — medida destinada à contabilização das ofertas.

A granularidade proposta considera uma linha por oferta de disciplina associada a um professor, curso e data.

### Tabelas Dimensão

**1. `dados_professor`**

Armazena informações de identificação dos professores.

- `idProfessor` (PK)
- `Nome_Professor`

**2. `dados_departamento`**

Armazena informações dos departamentos universitários.

- `idDepartamento` (PK)
- `Nome`
- `Campus`

**3. `dados_disciplina`**

Contém informações sobre as disciplinas.

- `idDisciplina` (PK)
- `Nome_Disciplina`
- `Carga_Horaria`

**4. `dados_curso`**

Contém as informações de identificação dos cursos.

- `idCurso` (PK)
- `Nome_Curso`

**5. `dados_data`**

Dimensão criada para permitir análises temporais.

- `idData` (PK)
- `Data_Oferta`
- `Dia`
- `Mes`
- `Trimestre`
- `Semestre`
- `Ano`

## ⭐ Diagrama Star Schema

O diagrama apresenta a tabela `fato_professor` no centro, conectada às cinco dimensões por relacionamentos de um para muitos (1:N).

![Diagrama Star Schema de Professores](Star-Schema_Professores.png)

A estrutura foi desenvolvida e visualizada por meio do MySQL Workbench.

## 🔗 Relacionamentos

| Tabela Dimensão | Tabela Fato | Cardinalidade |
|---|---|---|
| dados_professor | fato_professor | 1:N |
| dados_departamento | fato_professor | 1:N |
| dados_disciplina | fato_professor | 1:N |
| dados_curso | fato_professor | 1:N |
| dados_data | fato_professor | 1:N |

As chaves estrangeiras garantem a integridade referencial entre a tabela fato e as dimensões.

## 🧠 Decisões de Modelagem

O modelo foi desenvolvido a partir do diagrama relacional fornecido no desafio.

Durante a transformação, foram adotadas as seguintes decisões:

- Exclusão das tabelas relacionadas aos alunos e matrículas, pois não fazem parte do foco da análise.
- Criação de dimensões específicas para professores, departamentos, disciplinas e cursos.
- Criação da dimensão de datas, conforme solicitado no enunciado.
- Inclusão de atributos descritivos complementares para enriquecer o modelo dimensional.
- Definição de uma tabela fato para centralizar as relações entre professor, disciplina, curso, departamento e período.

Como o modelo relacional original não disponibiliza dados de ofertas com datas, a estrutura pressupõe a existência dessas informações para um cenário analítico futuro.

## 📊 Possibilidades de Análise

Com o modelo populado, será possível desenvolver análises como:

- Quantidade de professores por departamento.
- Quantidade de disciplinas ministradas por professor.
- Distribuição de disciplinas entre cursos.
- Quantidade de ofertas de disciplinas por semestre ou ano.
- Comparação das atividades acadêmicas entre departamentos.

Essas análises poderão apoiar a criação de relatórios e dashboards utilizando ferramentas de Business Intelligence.

## 📁 Arquivos do Repositório

| Arquivo | Descrição |
|---|---|
| `star_schema_professores.sql` | Script SQL de criação das tabelas e relacionamentos |
| `Star_Schema_Professores.png` | Imagem do diagrama dimensional |
| `README.md` | Documentação do projeto |

## 📚 Aprendizados

O desenvolvimento deste projeto permitiu colocar em prática conhecimentos de:

- Modelagem relacional e dimensional.
- Diferenças entre tabelas fato e dimensão.
- Definição de granularidade.
- Chaves primárias e estrangeiras.
- Relacionamentos 1:N.
- Estruturação de bancos de dados utilizando SQL.
- Documentação técnica de projetos de dados.

## ✅ Conclusão

O projeto demonstra a aplicação dos princípios de modelagem dimensional na organização de dados acadêmicos, criando uma estrutura voltada à análise das atividades dos professores.

A implementação também reforça a importância de definir corretamente o objeto de análise, a granularidade dos registros e os relacionamentos entre as tabelas.

O modelo desenvolvido constitui uma base estrutural para futuras análises e soluções de Business Intelligence.

---

**Projeto desenvolvido para fins educacionais como parte de um desafio da Digital Innovation One (DIO).**
