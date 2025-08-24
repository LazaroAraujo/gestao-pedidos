package br.com.dio.pedidos.repository.client;

import br.com.dio.pedidos.controller.dto.PedidoResponseDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@FeignClient(name = "produtoService", url = "http://localhost:8100",path = "/produtos")
@Component
public interface ProductClient {

    @GetMapping("/buscar-todos")
    ResponseEntity<List<PedidoResponseDto>> buscarProdutos();
}
