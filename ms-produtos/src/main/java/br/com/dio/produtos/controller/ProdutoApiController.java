package br.com.dio.produtos.controller;

import br.com.dio.produtos.controller.contract.ProdutoApi;
import br.com.dio.produtos.controller.dto.ProdutoRequestDto;
import br.com.dio.produtos.controller.dto.ProdutoResponseDto;
import br.com.dio.produtos.service.ProdutoService;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class ProdutoApiController implements ProdutoApi {

    private final ProdutoService produtoService;

    @Override
    public ResponseEntity<ProdutoResponseDto> salvar(ProdutoRequestDto produtoRequestDto) {
        return ResponseEntity.ok(produtoService.criarProduto(produtoRequestDto));
    }

    @Override
    public ResponseEntity<List<ProdutoResponseDto>> buscarTodos() {
        return ResponseEntity.ok(produtoService.buscarTodos());
    }

    @Override
    public ResponseEntity<ProdutoResponseDto> buscarPorId(Long id) {
        try {
            return ResponseEntity.ok(produtoService.buscarPorId(id));
        } catch (EntityNotFoundException e) {
            return ResponseEntity.notFound().build();
        }
    }
}
