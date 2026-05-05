# Análise de Requisitos

## Requisitos Funcionais (RF)
- **RF01**: Cadastrar estudantes com matrícula única, nome, turno e curso.
- **RF02**: Ler QR Code (matrícula) para identificar estudante.
- **RF03**: Registrar retirada de lanche com data/hora, turno e operador.
- **RF04**: Impedir mais de uma retirada por estudante no mesmo turno e dia.
- **RF05**: Priorizar estudantes do turno atual na listagem/fila.
- **RF06**: Gerenciar estoque de itens de lanche (entrada, saída e saldo).
- **RF07**: Reduzir automaticamente estoque ao confirmar retirada.
- **RF08**: Exibir alertas quando estoque estiver abaixo do mínimo.
- **RF09**: Gerar relatórios por período, turno e estudante.
- **RF10**: Permitir autenticação de operadores e administradores.

## Requisitos Não Funcionais (RNF)
- **RNF01**: API REST com tempo médio de resposta < 1s para registro de retirada.
- **RNF02**: Interface web responsiva para uso em tablet/computador da cantina.
- **RNF03**: Auditoria de retiradas e movimentações de estoque.
- **RNF04**: Banco relacional MySQL com integridade referencial.
- **RNF05**: Segurança com autenticação JWT e perfis (ADMIN, OPERADOR).
- **RNF06**: Disponibilidade mínima de 99% durante período letivo.
- **RNF07**: Logs estruturados para rastreabilidade de erros.

## Regras de Negócio (RN)
- **RN01**: O lanche é gratuito, sem cobrança.
- **RN02**: 1 estudante = 1 retirada por turno por dia.
- **RN03**: Em disputa por quantidade limitada, alunos do turno atual têm prioridade.
- **RN04**: Sem estoque, a retirada não pode ser concluída.
