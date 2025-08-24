package br.com.dio.pedidos.controller.contract;

import br.com.dio.pedidos.controller.dto.PedidoResponseDto;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/produtos")
public interface PedidoApi {

    @GetMapping
    ResponseEntity<List<PedidoResponseDto>> buscarProdutos();

    ResponseEntity<?> simularPedido();
}
