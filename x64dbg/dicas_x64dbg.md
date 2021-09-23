# Dicas x64dbg
 
 
### Plugins MUST HAVE (encontre-os na pasta plugins_backup):

- **MapoAnalyzer:** Para achar as funções, strings, decompilar.  

![MapoAnalyzer](https://github.com/EliederSousa/Engenharia-Reversa-Disassembly-/blob/main/x64dbg/plugins_backup/MapoAnalyzer/mapo.png)

- **ASLR Removal:**	"Address space layout randomization (ASLR) é uma técnica de segurança da informação que previne ataques de execução arbitrária de código." O plugin remove essa proteção. 
 
![ASLR Removal](https://github.com/EliederSousa/Engenharia-Reversa-Disassembly-/blob/main/x64dbg/plugins_backup/ASLR_Removal/aslr.png)

- **Claw Search:** Pesquisa por valores igual ao do Cheat Engine.  

![Claw Search](https://github.com/EliederSousa/Engenharia-Reversa-Disassembly-/blob/main/x64dbg/plugins_backup/ClawSearch/claw.png)

- **XFindOut:** Permite encontrar o que acessa/escreve em um endereço particular da memória.  

![xFindOut](https://github.com/EliederSousa/Engenharia-Reversa-Disassembly-/blob/main/x64dbg/plugins_backup/xFindOut/xfindout.png)

- **xAnalyzer:** Adiciona referências às strings na aba CPU.

----------------------------------------------------------------

### Símbolos

Lembre-se de verificar qual é o módulo que você está visualizando. Para seguir para o módulo desejado, vá na aba 'Símbolos' e procure pelo módulo desejado.

----------------------------------------------------------------

### Pesquisar

Ao pesquisar por uma instrução:
- Valores numéricos:
  - Não use 'h' após números em hexadecimal;
  - Em valores *imediate*, pesquisar sempre em decimal;
  - Exemplo:
    ```assembly
    cmp rcx,1Eh       # ao invés de pesquisar assim (IDA)
    cmp rcx,30        # pesquise assim (x64dbg)
    ```
- Operandos:
  - Não dê espaços entre operandos (após a vírgula);
  - Tomar cuidado com dados a serem carregados. Exemplo: 
    ```assembly
    movups xmmword ptr [rax-6A88],xmm0       # IDA
    movups xmmword ptr ds:[rax-6A88],xmm0    # x64dbg
    ```
- Instruções:
  - Tomar cuidado com instruções J encontradas em diferentes programas. Exemplo:
    ```assembly
    jnz short loc_1400EB150      # IDA
    jne nome_do_exe.1400EB150    # x64dbg
    ```
- Codecaves:
  - Para pesquisar um local adequado para um *codecave*, verifique se o local é apropriado (fim do segmento .text).
  - Pesquisar por padrões (CTRL+B) pode ser útil, usando:
    - *00* como pesquisa de locais sem instruções (*add byte ptr ds:[rax], al*)
    - *90* para pesquisar locais com a instrução *NOP*.
