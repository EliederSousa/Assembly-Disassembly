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

----------------------------------------------

### Pesquisar

Ao pesquisar por uma instrução:
- Valores numéricos:
  - Não use 'h' após números em hexadecimal;
  - Em valores *imediate*, pesquisar sempre em decimal;
- Operandos:
  - Não dê espaços entre operandos (após a vírgula);
  - Tomar cuidado com dados a serem carregados. Exemplo: 
    ```assembly
    movups xmmword ptr [rax-6A88],xmm0       # IDA
    movups xmmword ptr ds:[rax-6A88],xmm0    # x64dbg
    ```
- Instruções:
  - Tomar cuidado com instruções J encpntradas em diferentes programas. Exemplo:
  ```assembly
  jnz short loc_1400EB150      # IDA
  jne nome_do_exe.1400EB150    # x64dbg
  ```
  
