package br.edu.if.cantina.service;

import br.edu.if.cantina.dto.RegistrarRetiradaRequest;
import org.springframework.stereotype.Service;

@Service
public class RetiradaService {

    public void registrarRetirada(RegistrarRetiradaRequest request) {
        // Fluxo esperado:
        // 1. Buscar estudante por matrícula (QR Code).
        // 2. Verificar se já retirou no turno/data.
        // 3. Verificar prioridade de turno.
        // 4. Validar estoque > 0.
        // 5. Registrar retirada e baixar estoque em transação única.
        if (request.matricula() == null || request.matricula().isBlank()) {
            throw new IllegalArgumentException("Matrícula é obrigatória");
        }
    }
}
