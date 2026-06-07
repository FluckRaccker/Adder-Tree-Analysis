# Adder-Tree-Analysis

Repositório para geração, teste e análise de arquiteturas de árvores de somadores em VHDL, com foco em comparação entre diferentes estruturas de soma para vetores de tamanho genérico. O projeto contém notebooks em Python para gerar automaticamente arquivos VHDL, arquivos de projeto do Quartus (`.qsf`/`.qpf`), vetores de teste e scripts de extração de métricas temporais obtidas no TimeQuest/Quartus.

O objetivo principal é facilitar a avaliação de diferentes topologias de somadores para larguras e quantidades variadas de vetores, permitindo comparar atraso de propagação, caminho crítico e comportamento funcional entre arquiteturas originais, diagonais, propostas e truncadas.

---

## Estrutura do repositório

```text
Adder-Tree-Analysis/
│
├── Codes/
│   ├── extractor.ipynb
│   ├── max_ff.ipynb
│   ├── multiplier_tester.ipynb
│   ├── original_tree_diagonal_generator.ipynb
│   ├── original_tree_generator.ipynb
│   ├── propose_tree_diagonal.ipynb
│   ├── propose_tree_generator.ipynb
│   ├── propose_tree_sqr_truncado.ipynb
│   ├── vectors_retangular_diagonal_tester.ipynb
│   ├── vectors_retangular_tester.ipynb
│   ├── vectors_tester.ipynb
│   ├── vectors_tester_original_diagonal.ipynb
│   └── vectors_trunc.ipynb
│
├── Generics_Tree/
│   ├── Original_Tree/
│   ├── Original_Tree_diagonal/
│   ├── Propose_Tree/
│   ├── propose_tree_diagonal/
│   └── propose_tree_trunc/
│
├── generic_multiplier/
├── generic_multiplier_sqr/
│
├── .gitignore
└── README.md
```

---

## Descrição das pastas

### `Codes/`

Contém os notebooks Python usados para gerar os projetos, criar os arquivos VHDL, montar arquivos de configuração do Quartus e testar as arquiteturas.

Principais grupos de notebooks:

- **Geradores VHDL**
  - `original_tree_generator.ipynb`
  - `original_tree_diagonal_generator.ipynb`
  - `propose_tree_generator.ipynb`
  - `propose_tree_diagonal.ipynb`
  - `propose_tree_sqr_truncado.ipynb`

- **Testadores funcionais**
  - `vectors_tester.ipynb`
  - `vectors_retangular_tester.ipynb`
  - `vectors_retangular_diagonal_tester.ipynb`
  - `vectors_tester_original_diagonal.ipynb`
  - `vectors_trunc.ipynb`
  - `multiplier_tester.ipynb`

- **Extração e análise de resultados**
  - `extractor.ipynb`
  - `max_ff.ipynb`

### `Generics_Tree/`

Contém os projetos gerados para diferentes arquiteturas de árvores de soma. Cada subpasta representa uma versão da arquitetura.

- `Original_Tree/`: arquitetura original da árvore de soma.
- `Original_Tree_diagonal/`: versão original com organização diagonal e quadrada.
- `Propose_Tree/`: arquitetura proposta.
- `propose_tree_diagonal/`: arquitetura proposta com organização diagonal e quadrada.
- `propose_tree_trunc/`: versão proposta com truncamento de bits.

### `generic_multiplier/` e `generic_multiplier_sqr/`

Pastas relacionadas aos testes de multiplicadores genéricos, incluindo versões retangulares e quadradas.

---

## Arquiteturas avaliadas

O repositório considera diferentes formas de implementar a soma de múltiplos vetores em VHDL:

1. **Árvore original**
   - Soma os vetores em níveis sucessivos.
   - Serve como referência inicial de comparação.

2. **Árvore original diagonal**
   - Reorganiza os sinais de entrada em uma estrutura diagonal e quadrada.
   - Busca alterar a distribuição dos caminhos lógicos e interconexões.

3. **Árvore proposta**
   - Versão modificada da árvore de somadores.
   - Desenvolvida para reduzir o caminho crítico ou melhorar a organização da lógica gerada pelo Quartus.

4. **Árvore proposta diagonal**
   - Combina a arquitetura proposta com a organização diagonal e quadrada dos sinais.

5. **Árvore proposta truncada**
   - Usa truncamento de bits em determinadas etapas.
   - Permite avaliar a troca entre precisão numérica, área e atraso.

6. **Multiplicadores genéricos**
   - Versões quadradas e retangulares usadas para validação de produtos parciais e testes associados às árvores de soma.

---

## Parâmetros principais

Os geradores foram desenvolvidos para trabalhar com arquiteturas genéricas, variando principalmente:

- `m`: número de vetores de entrada.
- `n`: largura em bits de cada vetor.
- Tipo da saída:
  - quadrada;
  - retangular;
  - diagonal;
  - truncada.
- Família e dispositivo FPGA usados no Quartus.

Exemplos de tamanhos avaliados:

```python
m_values = [16, 32, 64, 128, 256, 512]
n_values = [16, 24, 32, 48, 64, 96, 128]
```

Esses valores podem ser alterados diretamente nos notebooks de geração e teste.

---

## Geração dos arquivos VHDL

Os notebooks geradores criam entidades no formato:

```vhdl
entity sum<M>xn is
    generic(
        n : integer := <N>
    );
    port (
        a0, a1, ..., a<M-1> : in unsigned(n-1 downto 0);
        sum                 : out unsigned(... downto 0)
    );
end sum<M>xn;
```

Onde:

- `<M>` representa o número de vetores de entrada.
- `<N>` representa a largura de cada vetor.
- A largura da saída depende da arquitetura testada.

Cada notebook gera automaticamente os sinais internos, os níveis da árvore de soma e as conexões necessárias entre os estágios.

---

## Geração dos arquivos do Quartus

Além do VHDL, o projeto também utiliza geração e modificação automática de arquivos `.qsf`, permitindo configurar:

- família FPGA;
- dispositivo alvo;
- entidade de topo;
- arquivos VHDL incluídos no projeto;
- ferramenta de simulação;
- diretório de saída;
- opções básicas de compilação.

Exemplo de configuração usada nos projetos:

```tcl
set_global_assignment -name FAMILY "Cyclone V"
set_global_assignment -name DEVICE 5CGXFC9E7F35C8
set_global_assignment -name TOP_LEVEL_ENTITY sum16xn
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
```

Caso o projeto seja executado em outra placa, é necessário alterar `FAMILY` e `DEVICE` no `.qsf` ou no script que gera esse arquivo.

---

## Execução automática do Quartus

Alguns notebooks utilizam funções auxiliares para automatizar a compilação no Quartus. O fluxo geral é:

1. Alterar o valor do generic `n` no arquivo VHDL.
2. Localizar o arquivo `.qpf` do projeto.
3. Remover resultados antigos da pasta `output_files/`.
4. Executar a compilação do Quartus via linha de comando.
5. Gerar relatórios de temporização.
6. Extrair métricas dos arquivos `.txt` gerados.

Exemplo simplificado do fluxo usado:

```python
set_n(vhdl_file, n)
run_quartus(project_dir)
df = parse_paths(report_file)
metrics = compute_metrics(df)
critical_path = extract_critical_path(worst_file)
```

---

## Extração de métricas

Os notebooks de extração processam relatórios do TimeQuest/Quartus contendo atrasos entre portas de entrada e saída.

A tabela analisada segue o formato:

```text
Input Port | Output Port | RR | RF | FR | FF
```

Onde:

- `RR`: transição rising-to-rising;
- `RF`: transição rising-to-falling;
- `FR`: transição falling-to-rising;
- `FF`: transição falling-to-falling.

As funções de análise permitem obter:

- maior atraso `RR`;
- maior atraso `RF`;
- maior atraso `FR`;
- maior atraso `FF`;
- porta de entrada associada ao maior atraso;
- porta de saída associada ao maior atraso;
- caminho crítico reportado pelo Quartus.

Esses dados podem ser organizados em planilhas ou tabelas para comparar as arquiteturas.

---

## Testes funcionais

Os notebooks de teste geram vetores de entrada e comparam a saída esperada em Python com a saída da arquitetura VHDL.

Os testes são separados por tipo de arquitetura:

- testes para saída quadrada;
- testes para saída retangular;
- testes para arquitetura diagonal;
- testes para arquitetura truncada;
- testes para multiplicadores.

O fluxo típico é:

1. Gerar vetores de entrada em Python.
2. Calcular o resultado esperado.
3. Exportar os vetores para uso na simulação.
4. Executar a simulação do circuito.
5. Comparar a saída simulada com a saída esperada.

---

## Requisitos

### Software

- Python 3.10 ou superior.
- Quartus Prime Standard ou Lite.
- TimeQuest Timing Analyzer.
- Jupyter Notebook ou JupyterLab.

### Bibliotecas Python

Instalação sugerida:

```bash
pip install numpy pandas tqdm openpyxl matplotlib
```

Dependendo do notebook utilizado, outras bibliotecas podem ser necessárias.

---

## Como usar

### 1. Clonar o repositório

```bash
git clone <URL_DO_REPOSITORIO>
cd Adder-Tree-Analysis
```

### 2. Abrir os notebooks

```bash
jupyter notebook
```

ou:

```bash
jupyter lab
```

### 3. Gerar uma arquitetura

Abra um dos notebooks geradores em `Codes/`, por exemplo:

```text
Codes/propose_tree_generator.ipynb
```

Altere os parâmetros desejados:

```python
m_values = [16, 32, 64, 128]
n_values = [16, 32, 64, 128]
base_dir = r"caminho/para/Adder-Tree-Analysis/Generics_Tree/Propose_Tree"
```

Execute o notebook para gerar os arquivos VHDL e os projetos do Quartus.

### 4. Compilar no Quartus

A compilação pode ser feita manualmente pelo Quartus ou automaticamente pelos notebooks que chamam a ferramenta via linha de comando.

Exemplo de caminho no Windows:

```python
quartus_bin = r"C:\altera_lite\25.1std\quartus\bin64"
```

---

## Organização sugerida dos resultados

Para comparar as arquiteturas, recomenda-se armazenar os resultados em tabelas com colunas como:

| Arquitetura | Número de vetores | Largura `n` | Maior RR | Maior RF | Maior FR | Maior FF | Caminho crítico |
|------------|-------------------|-------------|----------|----------|----------|----------|-----------------|
| Original | 16 | 16 | - | - | - | - | - |
| Original diagonal | 16 | 16 | - | - | - | - | - |
| Proposta | 16 | 16 | - | - | - | - | - |
| Proposta diagonal | 16 | 16 | - | - | - | - | - |
| Proposta truncada | 16 | 16 | - | - | - | - | - |

Essa estrutura facilita a comparação em planilhas ou ferramentas de visualização.


---

## Observações importantes

- O valor de `n` é alterado diretamente no generic do VHDL pelos scripts Python.
- A entidade de topo no `.qsf` deve ser compatível com o nome do arquivo VHDL gerado.
- Para mudar de família FPGA, altere as opções `FAMILY` e `DEVICE` no `.qsf`.
- Os resultados de atraso dependem fortemente do dispositivo escolhido, da versão do Quartus e das opções de síntese/fitter.
- Para projetos grandes, principalmente com muitos vetores e larguras elevadas, a compilação pode consumir bastante memória e tempo.

---

## Objetivo acadêmico

Este repositório foi desenvolvido para apoiar a análise experimental de arquiteturas combinacionais em FPGA, permitindo avaliar como diferentes formas de organizar árvores de soma e multiplicadores afetam o atraso de propagação, o caminho crítico e a escalabilidade do circuito.

Os resultados podem ser utilizados em trabalhos acadêmicos relacionados a:

- arquiteturas digitais;
- FPGA;
- somadores em árvore;
- multiplicadores genéricos;
- análise de temporização;
- otimização de circuitos combinacionais;
- comparação entre topologias de hardware.

---

## Autor

Desenvolvido por Rafael Ferreira.

