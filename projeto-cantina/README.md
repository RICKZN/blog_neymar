# Sistema de Controle de Distribuição de Lanche - IF

Projeto base para controle de distribuição gratuita de lanche em um Instituto Federal.

## Stack
- **Backend:** Java 21 + Spring Boot
- **Frontend:** Vue.js 3 + Vite
- **Banco de dados:** MySQL 8

## Regras de negócio principais
1. Cada estudante possui um QR Code com seu número de matrícula.
2. O responsável da cantina escaneia a matrícula no sistema.
3. Cada estudante pode retirar **apenas 1 lanche por turno por dia**.
4. O sistema prioriza estudantes do turno atual (manhã/tarde/noite) na fila de atendimento.
5. Toda retirada válida baixa automaticamente o estoque.

## Estrutura
- `backend/`: API REST com regras de negócio
- `frontend/`: Interface para operador da cantina
- `docs/`: análise de requisitos e modelagem

## Execução rápida
### Banco de dados
1. Crie um banco MySQL chamado `cantina_if`.
2. Execute o script `docs/schema.sql`.

### Backend
```bash
cd backend
./mvnw spring-boot:run
```

### Frontend
```bash
cd frontend
npm install
npm run dev
```

## Fluxo de retirada
1. Operador escaneia QR (matrícula).
2. Frontend chama `POST /api/retiradas`.
3. Backend valida:
   - aluno existe;
   - não retirou no mesmo turno e dia;
   - estoque disponível;
4. Se aprovado, registra retirada e baixa 1 unidade do item de lanche.
5. Retorna comprovante para tela.
