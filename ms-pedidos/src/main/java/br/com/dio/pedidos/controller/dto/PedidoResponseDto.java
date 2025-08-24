package br.com.dio.pedidos.controller.dto;

public record PedidoResponseDto(Long id, String nome, String descricao, Double preco) {
}
