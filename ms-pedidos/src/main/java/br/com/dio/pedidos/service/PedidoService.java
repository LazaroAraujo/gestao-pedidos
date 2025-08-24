package br.com.dio.pedidos.service;

import br.com.dio.pedidos.controller.dto.PedidoResponseDto;
import br.com.dio.pedidos.repository.client.ProductClient;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PedidoService {

    private final ProductClient productClient;

    public List<PedidoResponseDto> buscarProdutos(){
        return productClient.buscarProdutos().getBody();
    }
}
