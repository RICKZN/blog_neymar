package br.edu.if.cantina.dto;

public record RegistrarRetiradaRequest(String matricula, Long itemEstoqueId, String turnoAtual, Long operadorId) {}
