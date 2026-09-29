# Procedures para Manipulação de Dados — Universidade e E-commerce

Duas stored procedures, uma para cada cenário, seguindo o mesmo padrão: uma variável de controle (`p_acao`) decide, via `IF`/`ELSEIF`, se a procedure faz um **INSERT**, **UPDATE** ou **DELETE**.

## Arquivos

| Arquivo | Conteúdo |
|---|---|
| `procedure_universidade.sql` | Cria o banco/tabela `universidade.aluno` (assumido, ver observação) e a procedure `sp_manipula_aluno` |
| `procedure_ecommerce.sql` | Procedure `sp_manipula_produto`, reaproveitando o esquema lógico já criado no desafio de e-commerce (tabela `produto`) |

## Padrão da variável de controle

```
p_acao = 1  →  INSERT
p_acao = 2  →  UPDATE
p_acao = 3  →  DELETE
qualquer outro valor → mensagem de ação inválida
```

As demais variáveis da procedure recebem os dados da entidade (nome, valores, chaves) e são usadas conforme a ação: no `INSERT` o `id` não é informado (é gerado automaticamente); no `UPDATE`/`DELETE`, o `id` identifica o registro afetado.

## Como executar

```bash
mysql -u seu_usuario -p < procedure_universidade.sql
mysql -u seu_usuario -p < procedure_ecommerce.sql
```

Cada arquivo já seleciona o banco correto (`USE`) antes de criar a procedure, e ao final chama a procedure três vezes (inserir, atualizar, excluir) como demonstração, seguida de um `SELECT` para conferir o resultado.

## Observação

O cenário de e-commerce reaproveita a tabela `produto` já definida no desafio de projeto lógico anterior. Já para a universidade não havia um esquema definido no enunciado deste desafio — foi assumida uma tabela simples `aluno` (nome, curso, email, matrícula). Se a disciplina já tiver um esquema de universidade específico, é só me passar que eu adapto a procedure a ele.
