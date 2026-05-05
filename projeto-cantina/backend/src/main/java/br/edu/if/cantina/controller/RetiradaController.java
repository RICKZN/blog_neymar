package br.edu.if.cantina.controller;

import br.edu.if.cantina.dto.RegistrarRetiradaRequest;
import br.edu.if.cantina.service.RetiradaService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/retiradas")
public class RetiradaController {
    private final RetiradaService retiradaService;

    public RetiradaController(RetiradaService retiradaService) {
        this.retiradaService = retiradaService;
    }

    @PostMapping
    public ResponseEntity<Map<String, String>> registrar(@RequestBody RegistrarRetiradaRequest request) {
        retiradaService.registrarRetirada(request);
        return ResponseEntity.ok(Map.of("status", "RETIRADA_CONFIRMADA"));
    }
}
