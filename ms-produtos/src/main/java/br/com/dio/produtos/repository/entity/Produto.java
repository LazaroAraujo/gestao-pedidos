package br.com.dio.produtos.repository.entity;

import br.com.dio.produtos.controller.dto.ProdutoResponseDto;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "produto")
public class Produto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;
    private String descricao;
    private Double preco;

    public ProdutoResponseDto toDto(){
        return new ProdutoResponseDto(this.id, this.nome, this.descricao, this.preco);
    }

}
