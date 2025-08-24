package br.com.dio.pedidos.controller;

import br.com.dio.pedidos.controller.contract.PedidoApi;
import br.com.dio.pedidos.controller.dto.PedidoResponseDto;
import br.com.dio.pedidos.service.PedidoService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class PedidoController implements PedidoApi {

    private final PedidoService pedidoService;

    @Override
    public ResponseEntity<List<PedidoResponseDto>> buscarProdutos() {
        return ResponseEntity.ok(pedidoService.buscarProdutos());
    }

    @Override
    public ResponseEntity<?> simularPedido() {
        return null;
    }
}
