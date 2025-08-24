package br.com.dio.produtos.service;

import br.com.dio.produtos.controller.dto.ProdutoRequestDto;
import br.com.dio.produtos.controller.dto.ProdutoResponseDto;
import br.com.dio.produtos.repository.ProdutoRepository;
import br.com.dio.produtos.repository.entity.Produto;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProdutoService {

    private final ProdutoRepository produtoRepository;

    public ProdutoResponseDto criarProduto(final ProdutoRequestDto request) {
        Produto entity = Produto.builder()
                .nome(request.nome())
                .descricao(request.descricao())
                .preco(request.preco())
                .build();
        return produtoRepository.save(entity).toDto();
    }

    public List<ProdutoResponseDto> buscarTodos (){
        return produtoRepository.findAll().stream().map(Produto::toDto).toList();
    }

    public ProdutoResponseDto buscarPorId(Long id){
        return produtoRepository.findById(id).map(Produto::toDto).orElseThrow(()-> new EntityNotFoundException("Produto não encontrado"));
    }
}
