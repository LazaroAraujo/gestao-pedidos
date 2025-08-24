package br.com.dio.produtos.controller.contract;

import br.com.dio.produtos.controller.dto.ProdutoRequestDto;
import br.com.dio.produtos.controller.dto.ProdutoResponseDto;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/produtos")
public interface ProdutoApi {

    @PostMapping
    ResponseEntity<ProdutoResponseDto> salvar(@RequestBody ProdutoRequestDto produtoRequestDto);

    @GetMapping("/buscar-todos")
    ResponseEntity<List<ProdutoResponseDto>> buscarTodos();

    @GetMapping("/{id}")
    ResponseEntity<ProdutoResponseDto> buscarPorId(@PathVariable Long id);
}
