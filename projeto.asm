;------------------------------------------------------------------------------------
;                               Periferico de entrada
;------------------------------------------------------------------------------------

ON_OFF          EQU 0020H ; Onde o utilizador ira ligar a maquina
OK              EQU 0030H ; Onde o utilizador ira selecionar o OK
Opcao           EQU 0040H ; Onde o utilizador ira escolher a opcao
Dinheiro        EQU 0050H ; Onde o utilizador ira introduzir as moedas/notas
Escrita         EQU 0060H ; Onde o utilizador ira introduzir a passe do stock ou o nº
                          ; de pepe

;------------------------------------------------------------------------------------
;              Labels para quem usar saber onde inserir os valores
;------------------------------------------------------------------------------------

Place 0028H
String "ON_OFF" 
Place 0038H
String "OK"
Place 0048H
String "Opcao"
Place 0058H
String "Dinheiro"
Place 0068H
String "Escrita"

;-------------------------------------------------------------------------------------
;                                Periferico de saida
;-------------------------------------------------------------------------------------

InicioEcra      EQU 0090H
FimEcra         EQU 00FFH

;-------------------------------------------------------------------------------------
;                                      Constantes
;-------------------------------------------------------------------------------------
CaracterVazio   EQU 20H

Comprar         EQU 1
UsarCartao      EQU 2
Stock           EQU 3

Continuar       EQU 1
Cancelar        EQU 5

Recarregar      EQU 2

Seguinte        EQU 1

Porto           EQU 1
Lisboa          EQU 2
Faro            EQU 3
Braga           EQU 4

CustoPorto      EQU 150
CustoLisboa     EQU 250
CustoFaro       EQU 350
CustoBraga      EQU 450

Valor5Euros     EQU 500
Valor2Euros     EQU 200
Valor1Euro      EQU 100
Valor50Cent     EQU 50
Valor20Cent     EQU 20
Valor10Cent     EQU 10

stackPointer    EQU 0000H


;--------------------------------------------------------------------------------------
;    Base de dados, aqui ficarao os enderecos onde irá ser guardada as informacoes
;     necessarias a serem usadas pelo programa, como numero de PEPEs, moedas em 
;                                 stock e entre outros
;--------------------------------------------------------------------------------------

Place 0110H
String "Passe"                      ; endereco e palavra-passe para aceder ao stock
NumeroDePepes       EQU 0120H       ; endereco onde vai ficar guardado o numero de pepes existentes atualmente
TotalPagar          EQU 0130H       ; endereco onde fica guardado o total a pagar dos bilhetes escolhidos
QuantidadeNotas5    EQU 0140H       ; endereco onde fica guardado o total de notas de 5
QuantidadeMoedas2   EQU 0150H       ; endereco onde fica guardado o total de moedas de 2
QuantidadeMoedas1   EQU 0160H       ; endereco onde fica guardado o total de moedas de 1
QuantidadeMoedas50  EQU 0170H       ; endereco onde fica guardado o total de moedas de 50
QuantidadeMoedas20  EQU 0180H       ; endereco onde fica guardado o total de moedas de 20
QuantidadeMoedas10  EQU 0190H       ; endereco onde fica guardado o total de moedas de 10
DinheiroInserido    EQU 01A0H       ; endereco onde fica guardado o montade que o usuario inseriu com moedas
TrocoAdevolver      EQU 01B0H       ; endereco onde fica guardado o troco a devolver ao utilizador
BaseDeDados         EQU 1000H       ; endereco onde vao ficar guardados os numeros de pepe e o seu saldo
FimBaseDeDados      EQU 1070H       ; endereco do fim da base de dados

;--------------------------------------------------------------------------------------
;                                  Menus de informacao
;--------------------------------------------------------------------------------------

Place 01D0H
MenuPrincipal:
    String " MAQUINA VENDAS "
    String "      METRO     "
    String "                "
    String "1-Comprar       "
    String "2-Usar Cartao   "
    String "3-Stock         "
    String "                "

Place 0250H
MenuCompra:
    String "  Menu Estacao  "
    String "1-Porto:  1.50  "
    String "2-Lisboa: 2.50  "
    String "3-Faro:   3.50  "
    String "4-Braga:  4.50  "
    String "                "
    String "5-Cancelar      "

Place 02D0H
MenuTalao:
    String "  PEPE  GERADO  "
    String "      000       "
    String "TROCO:   0.00   "
    String "                "
    String "                "
    String "                "
    String "                "

Place 0350H
MenuCodigoPEPE:
    String "  INTRODUZA N.  "
    String "      PEPE      "
    String "XXXXX           "
    String "                "
    String "1-Continuar     "
    String "5-Cancelar      "
    String "                "

Place 03D0H
MenuCompraPEPE:
    String "   SALDO PEPE   "
    String "                "
    String "        00.00   "
    String "                "
    String "1-Comprar       "
    String "2-Recarregar    "
    String "                "

Place 0450H
MenuStock1:
    String "-- Stock 1/3 -- "
    String "Notas  5 Euro:  "
    String "  000           "
    String "Moeda  2 Euro:  "
    String "  000           "
    String "Moeda  1 Euro:  "
    String "1-Seguinte      "

Place 04D0H
MenuStock2:
    String "-- Stock 2/3 -- "
    String "  000           "
    String "Moeda 50 Cent:  "
    String "  000           "
    String "Moeda 20 Cent:  "
    String "  000           "
    String "1-Seguinte      "

Place 0550H
MenuStock3:
    String "-- Stock 3/3 -- "
    String "Moeda 10 Cent:  "
    String "  000           "
    String "                "
    String "                "
    String "                "
    String "2-Voltar        "

Place 05D0H
EcraSucesso:
    String "--- SUCESSO  ---"
    String "                "
    String "     COMPRA     "
    String "    FEITA COM   "
    String "     SUCESSO    "
    String "                "
    String "OK pra continuar"

Place 0650H
EcraErro:
    String "----- ERRO -----"
    String "                "
    String "    SELECIONE   "
    String "    UMA OPCAO   "
    String "     VALIDA     "
    String "                "
    String "OK pra continuar"

Place 06D0H
PasseErro:
    String "----- ERRO -----"
    String "                "
    String "     CODIGO     "
    String "     UNICO      "
    String "     ERRADO     "
    String "                "
    String "----- ERRO -----"

Place 0750H
DisplayMaisBilhetes:
    String "      QUER      "
    String "    COMPRAR     "
    String "      MAIS      "
    String "    BILHETES?   "
    String "                "
    String "   OK-1(SIM)    "
    String "   OK-2(NAO)    "

Place 07D0H
DisplayTotalPagar:
    String "     TOTAL      "
    String "                "
    String "     00.00      "
    String "                "
    String " INSIRA MOEDAS  "
    String "   E  DEPOIS    "
    String "OK PRA CONTINUAR"

Place 0850H
DisplayTotalPagarCartao:
    String "     TOTAL      "
    String "                "
    String "     00.00      "
    String "                "
    String " IREMOS RETIRAR "
    String "    DO SALDO    "
    String "OK pra continuar"

Place 08D0H
EcraErroMoeda:
    String "----- ERRO -----"
    String "                "
    String "    INTRODUZA   "
    String "    UMA MOEDA   "
    String "     VALIDA     "
    String "                "
    String "OK pra continuar"

Place 0950H
MenuStock:
    String "   INTRODUZA    "
    String "    PASSWORD    "
    String "                "
    String "XXXXX           "
    String "1-Repor Stock   "
    String "2-Ver Stock     "
    String "5-Cancelar      "

Place 09D0H
MenuUsarCartao:
    String "                "
    String "    UTILIZAR    "
    String "     CARTAO     "
    String "                "
    String "1-Comprar       "
    String "2-Recarregar    "
    String "                "

Place 06D0H
PepeErro:
    String "----- ERRO -----"
    String "                "
    String "      PEPE      "
    String "      NAO       "
    String "     EXISTE     "
    String "                "
    String "OK pra continuar"



;--------------------------------------------------------------------
;                             Inicio do programa
;--------------------------------------------------------------------

Place 0000H
Inicio:
    MOV R0, Principio       ; guarda no R0 o endereco do principio do programa
    JMP R0                  ; salta para o endereco em questao


Place 0A50H
Principio:
    MOV SP, stackPointer        ; stack pointer inicializada com o endereço fornecido nas variaveis
    CALL LimpaDisplay           ; chama a rotina de limpar o display para ficar todo em branco
    CALL LimpaPerifericos       ; chama a rotina de limpar os perifericos
    MOV R0, ON_OFF              ; guarda no R0 o endereço do periferico de entrada de ligar e desligar a maquina

LeOnOff:
    MOVB R1, [R0]               ; guarda em R1 o valor introduzido no periferico de entrada
    CMP R1, 1                   ; verifica se o valor e 1
    JNE LeOnOff                 ; se nao for igual salta para a rotina LeOnOff, fica num loop a espera de um valor no per. de entrada

Ligado:
    MOV R2, MenuPrincipal       ; no R2 fica guardado o endereco do display MenuPrincipal
    CALL MostraDisplay          ; chama a rotina de mostra display para mostrar o display anterior
    CALL LimpaPerifericos       ; chama a rotina que limpa os perifericos de entrada

LeOpcao:
    MOV R0, Opcao               ; guarda no R0 o endereco da opcao
    MOVB R1, [R0]               ; guarda no R1, o valor que esta no endereco de R0

    CMP R1, 0                   ; compara com 0 
    JEQ LeOpcao                 ; se for fica em loop ate ter um valor diferente de 0 

    CMP R1, Comprar             ; se o valor for igual a Comprar (1)
    JEQ RotinaComprar           ; entao salta para a rotina de comprar

    CMP R1, UsarCartao          ; se o valor for igual a UsarCartao (2)
    JEQ SaltoUsarCartao            ; entao salta para a rotina de usar cartao

    CMP R1, Stock               ; se o valor for igual a Stock (3)
    JEQ SaltoStock             ; entao salta para a rotina de stock

    CALL RotinaErro             ; se nao for nenhuma das disponiveis chama a rotina de erro
    JMP Ligado                  ; e volta ao Ligado



;---------------------------------------------------------------------------
;    Rotinas para comprar bilhete sem cartão, ao comprar bilhetes desta
;     forma gera um bilhete (PEPE) reutilizavel para compras futuras
;---------------------------------------------------------------------------

;---------------
; Rotina Comprar
;---------------
RotinaComprar:
    MOV R3, 0                   ; R3 guarda o total a pagar de bilhetes
RotinaComprar2:
    MOV R2, MenuCompra          ; R2 guarda o endereco do menu de compra
    CALL MostraDisplay          ; chama a rotina de mostrar o display
    CALL LimpaPerifericos       ; chama a rotina de limpar os perifericos

LeOpcaoCompra:
    MOV R0, Opcao               ; guarda em R0 o endereco da Opcao
    MOVB R1, [R0]               ; guarda em R1 o valor que esta no endereco

    CMP R1, 0                   ; se for 0 fica em loop
    JEQ LeOpcaoCompra

    CMP R1, Porto               ; se for igual a Porto (1) 
    JEQ RotinaMaisBilhetes      ; salta para a rotina de mais bilhetes

    CMP R1, Lisboa              ; se for iguala a Lisboa (2)
    JEQ RotinaMaisBilhetes      ; salta para a rotina de mais bilhetes

    CMP R1, Faro                ; se for igual a Faro (3)
    JEQ RotinaMaisBilhetes      ; salta para a rotina de mais bilhetes

    CMP R1, Braga               ; se for igual a Braga (4)
    JEQ RotinaMaisBilhetes      ; salta para a rotina de mais bilhetes

    CMP R1, Cancelar            ; se for igual a Cancelar (5)
    JEQ Ligado                  ; volta para o Ligado

    CALL RotinaErro             ; se nao for nenhuma das opcoes chama a rotina de erro
    
    JMP RotinaComprar2          ; e volta para a rotina de comprar 2


;---------------------
; Rotina mais bilhetes
;---------------------
RotinaMaisBilhetes:
    MOV R0, TotalPagar          ; guarda em R0 o endereco de total a pagar
    
    CMP R1, 1                   ; se for igual a 1
    JEQ BPorto                  ; salta para o bilhete do porto
    CMP R1, 2                   ; se for igual a 2
    JEQ BLisboa                 ; salta para o bilhete de Lisboa
    CMP R1, 3                   ; se for igual a 3
    JEQ BFaro                   ; salta para o bilhete de Faro
    CMP R1, 4                   ; se for igual a 4
    JEQ BBraga                  ; salta para o bilhete de Braga

BPorto:
    MOV R2, CustoPorto          ; guarda em R2 o custo do bilhete para o Porto
    ADD R3, R2                  ; adiciona ao R3 (total a pagar) o valor de R2 (CustoPorto)
    MOV [R0], R3                ; no valor do endereco de memoria do total a pagar mete o valor de R5
    JMP ecraMaisBilhetes        ; salta para o ecra a perguntar se quer mais bilhetes
BLisboa:
    MOV R2, CustoLisboa         ; guarda em R2 o custo do bilhete para Lisboa
    ADD R3, R2                  ; adiciona ao R5 (total a pagar) o valor de R2 (CustoLisboa)
    MOV [R0], R3                ; no valor do endereco de memoria do total a pagar mete o valor de R5
    JMP ecraMaisBilhetes        ; salta para o ecra a perguntar se quer mais bilhetes
BFaro:
    MOV R2, CustoFaro           ; guarda em R2 o custo do bilhete para Faro
    ADD R3, R2                  ; adiciona ao R5 (total a pagar) o valor de R2 (CustoFaro)
    MOV [R0], R3                ; no valor do endereco de memoria do total a pagar mete o valor de R5
    JMP ecraMaisBilhetes        ; salta para o ecra a perguntar se quer mais bilhetes
BBraga:
    MOV R2, CustoBraga          ; guarda em R2 o custo do bilhete para Braga
    ADD R3, R2                  ; adiciona ao R5 (total a pagar) o valor de R2 (CustoBraga)
    MOV [R0], R3                ; no valor do endereco de memoria do total a pagar mete o valor de R5

ecraMaisBilhetes:
    MOV R2, DisplayMaisBilhetes ; guarda em R2 o endereco do display de mais bilhetes
    CALL MostraDisplay          ; chama a rotina de mostar display
    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos
LeOpcaoBilhetes:
    MOV R0, OK                  ; guarda em R0 o endereco de perfiferico de entrada OK
    MOVB R1, [R0]               ; guarda em R1 o valor do periferico de entrada

    CMP R1, 0                   ; compara se o valor e 0
    JEQ LeOpcaoBilhetes         ; se sim fica em loop a espera de um valor aceite

    CMP R1, 1                   ; compara se o valor e 1
    JEQ RotinaComprar2          ; se sim salta para a rotina de comprar mais bilhetes

    CMP R1, 2                   ; compara se o valor e 2
    JEQ RotinaPagamento         ; se sim salta para a rotina de pagamento dos bilhetes

    CALL RotinaErro             ; se nao e nenhum dos outros chama a rotina de erro 
    JMP Ligado                  ; e salta para o ligado

;--------------------------------------------------------------------------------------------
;                           Saltos a meio para nao ficar out of bounds
;--------------------------------------------------------------------------------------------

SaltoUsarCartao:
    JMP RotinaCartao

SaltoStock:
    JMP RotinaStock



;--------------------------------------------------------------------------------------------
;                               Fim dos saltos a meio do programa
;--------------------------------------------------------------------------------------------

;-----------------
; Rotina Pagamento
;-----------------
RotinaPagamento:
    MOV R0, TotalPagar          ; R0 vai guaradr o endereco de total a pagar
    MOV R1, [R0]                ; R1 vai guardar o valor no endereco de memoria de R0
    MOV R3, DinheiroInserido    ; R3 guarda o endereço do dinheiro total inserido
    MOV R4, 0                   ; R4 vai ter o total inserido pelo user 
RotinaPagamento2:
    MOV R2, DisplayTotalPagar   ; guarda em R2 o endereco do display que mostra o total a pagar
    CALL MostraDisplay          ; chama a rotina de mostrar o display
RotinaPagamento3:
    CALL LimpaPerifericos       ; chama a rotina de limpar os perifericos
    MOV R2, Dinheiro            ; guarda em R2 o endereco do periferico de entrada Dinheiro
    MOVB R6, [R2]               ; guarda em R6 o valor do periferico de entrada Dinheiro
    MOV R8, 50H                 ; guarda em R8 o valor 50 em hexadecimal
    MOV R9, 20H                 ; guarda em R9 o valor 20 em hexadecimal 
    MOV R10, 10H                ; guarda em R10 o valor 10 em hexadecimal
    CMP R6, 0                   ; se nao houver dinheiro introduzido fica em loop a espera
    JEQ RotinaPagamento3        ; saltando para a rotina de pagamento 3

    CMP R6, 5                   ; se o user introduzir o valor "5" no periferico de entrada representa 5 euros
    JEQ inseriu5euros           ; salta para a etiqueta de inserir 5 euros na variavel que tem o total inserido pelo user
    
    CMP R6, 2                   ; se o user introduzir o valor "2" no periferico de entrada representa 2 euros
    JEQ inseriu2euros           ; salta para a etiqueta de inserir 2 euros na variavel que tem o total inserido pelo user
    
    CMP R6, 1                   ; se o user introduzir o valor "1" no periferico de entrada representa 1 euro
    JEQ inseriu1euros           ; salta para a etiqueta de inserir 1 euro na variavel que tem o total inserido pelo user
    
    CMP R6, R8                  ; se o user introduzir o valor "50" no periferico de entrada representa 50 cents
    JEQ inseriu50cent           ; salta para a etiqueta de inserir 50 cents na variavel que tem o total inserido pelo user
    
    CMP R6, R9                  ; se o user introduzir o valor "20" no periferico de entrada representa 20 cents
    JEQ inseriu20cent           ; salta para a etiqueta de inserir 20 cents na variavel que tem o total inserido pelo user
    
    CMP R6, R10                  ; se o user introduzir o valor "10" no periferico de entrada representa 10 cents
    JEQ inseriu10cent           ; salta para a etiqueta de inserir 10 cents na variavel que tem o total inserido pelo user

    CALL RotinaErroMoeda        ; se nao for nenhum destes valores significa que nao e uma moeda e chama a rotina de erro de moedas
    JMP RotinaPagamento2        ; volta para a parte de inserir moedas

;------------------
; NESTA PARTE FALTA ADICIONAR CADA MOEDA INSERIDA AO STOCK DA MAQUINA!!!!!!!!!!!!!!!!!!1
;------------------

inseriu5euros:
    MOV R8, Valor5Euros
    ADD R4, R8                  ; adiciona o valor 500 a variavel R4 (total inserido pelo user)
    JMP AdicionaValor           ; salta para a etiquita que vai adicionar na memoria esse valor
inseriu2euros:
    MOV R8, Valor2Euros
    ADD R4, R8                  ; adiciona o valor 200 a variavel R4 (total inserido pelo user)
    JMP AdicionaValor           ; salta para a etiquita que vai adicionar na memoria esse valor
inseriu1euros:
    MOV R8, Valor1Euro
    ADD R4, R8                  ; adiciona o valor 100 a variavel R4 (total inserido pelo user)
    JMP AdicionaValor           ; salta para a etiquita que vai adicionar na memoria esse valor
inseriu50cent:
    MOV R8, Valor50Cent
    ADD R4, R8                  ; adiciona o valor 50 a variavel R4 (total inserido pelo user)
    JMP AdicionaValor           ; salta para a etiquita que vai adicionar na memoria esse valor
inseriu20cent:
    MOV R8, Valor20Cent
    ADD R4, R8                  ; adiciona o valor 20 a variavel R4 (total inserido pelo user)
    JMP AdicionaValor           ; salta para a etiquita que vai adicionar na memoria esse valor
inseriu10cent:
    MOV R8, Valor10Cent
    ADD R4, R8                  ; adiciona o valor 10 a variavel R4 (total inserido pelo user)

AdicionaValor:
    MOV [R3], R4                ; adiciona no espaco de memoria do dinheiro total inserido o valor de R4
    MOV R4, [R3]                ; R4 vai ficar com o valor que tem no espaco de memoria de R3
ConfirmarPagamento:
    MOV R5, OK                  ; guarda em R5 o endereco do periferico de entrada OK
    MOVB R7, [R5]               ; guarda em R7 o valor do periferico de entrada OK
    CMP R7, 0                   ; fica em loop a espera do per. de entrada
    JEQ ConfirmarPagamento      
    CMP R7, 1                   ; se OK for clicado passa para a etiqueta Final, onde vai ser gerado o PEPE
    JEQ Final
    CALL RotinaErro             ; caso contrario nao foi um valor aceite e volta para o ConfirmarPagamento
    JMP ConfirmarPagamento

Final:
    CMP R4, R1                  ; compara a ver se o valor total introduzido e igual ou superior ao total a pagar
    JGE CriarPEPE               ; se sim salta para a rotina de criar o PEPE
    JMP RotinaPagamento2        ; se nao salta para a rotina de pagamento 2 para introduzir mais moedas


;----------------------------------------
; Rotina para gerar o PEPE já com o saldo
;----------------------------------------

CriarPEPE:
    MOV R6, R1                  ; guarda o total a pagar que e o que vai para o cartao
    SUB R4, R1                  ; subtrai o total inserido menos o total a pagar, para dar o troco
    MOV R1 , TrocoAdevolver     ; R1 guarda o endereco do troco a devolver
    MOV [R1], R4                ; guarda no espaco de memoria o resultado da subtracao
    MOV R1, 0                   ; guarda em R1 o valor 0
    MOV [R0], R1                ; limpa o espaco de memoria de total a pagar

    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos
    MOV R0, NumeroDePepes       ; guarda em R0 o endereco onde tem o numero atual de pepes gerados
    MOV R1, [R0]                ; guarda em R1 o valor de R0
    MOV R2, BaseDeDados         ; guarda em R2 o endereço da base de dados
    MOV R3, FimBaseDeDados      ; guarda em R3 o endereco do fim da base de dados

VerificaPEPE:
    MOV R4, [R2]                ; guarda o valor que esta no inicio da base de dados (num de pepe)
    MOV R5, 16                  ; R5 fica com o valor 16 para saltar para o proximo pepe disponivel an base de dados
    CMP R4, 0                   ; se R4 for igual a zero significa que nao tem pepe e podemos adicionar um novo nesse endereco de memoria
    JEQ NovoPEPE                ; salta para a rotina de criar um novo pepe
    ADD R2, R5                  ; se ja existe um pepe salta para o proximo endereco de memoria vazio
    CMP R2, R3                  ; compara a ver se ja chegou ao fim da base de dados
    JNE VerificaPEPE            ; salta para a etiqueta de verificar se ja existe pepe nesse endereco

NovoPEPE:
    ADD R1, 1                   ; Adiciona +1 a variavel de numero atual de pepes
    MOV [R2], R1                ; coloca no espaco de memoria da base de dados o numero do pepe
    ADD R2, 4                   ; aumenta o endereco de memoria para depois adicionar o saldo ao cartao
    MOV [R2], R6                ; guarda o valor do total a pagar
    MOV [R0], R1                ; adiciona a variavel numero de pepes o numero atual de pepes gerados
    CALL LimpaPerifericos       ; limpa os perifericos 
    CALL MostraTalao            ; chama a rotina de mostrar o talao, com o troco e o pepe gerado
    
    JMP Ligado

;------------------------------------------------------------------------------------------------
;
;------------------------------------------------------------------------------------------------
;                          Rotina de pagamento com cartao e recarregar cartao
;------------------------------------------------------------------------------------------------

;-------------------
; Rotina Usar Cartao
;-------------------
RotinaCartao:
    MOV R2, MenuCodigoPEPE      ; R2 guarda o endereco do display para inserir o numero de pepe
    CALL MostraDisplay          ; chamada da rotina de mostrar display
    CALL LimpaPerifericos       ; limpa os perifericos 
    MOV R0, BaseDeDados         ; R0 guarda o endereco do incio da base de dados

loopCartao:
    MOV R1, [R0]                ; R1 fica com o valor que esta na base de dados
    MOV R2, FimBaseDeDados      ; R2 guarda o endereco do fim da base de dados

    MOV R6, Escrita          ; R6 guarda o endereco do per. de entrada para introducao do num de pepe
    MOVB R7, [R6]               ; R7 fica com o valor que foi inserido no per. de entrada

    CMP R7, 0                   ; compara a ver se e zero
    JEQ loopCartao              ; se for fica em loop a espera de um valor maior que zero a ser introduzido pelo user

    CMP R7, R1                  ; compara o valor introduzido com o que esta atualmente a ser "visto" na base de dados
    JEQ rotinaUsarCartao        ; se for igual, o cartao existe na base de dados e pode fazer operacoes com esse cartao
    MOV R3, 16                  ; R3 guarda o valor 16
    ADD R0, R3                  ; adicionamos ao endereco que indica a base de dados mais 16 para irmos para o proximo end. de mem. que pode conter outro pepe
    CMP R0, R2                  ; verifica se ja chegou ao fim da base de dados
    JNE loopCartao              ; se nao chegou volta ao loop do cartao para verificar se esse cartoa existe
    CALL rotinaNaoExistePepe    ; caso contrario esse PEPE nao existe no sistema e volta para a etiqueta de rotina usar cartao
    JMP RotinaCartao

;--------------------
; Rotina de Continuar
;--------------------
rotinaUsarCartao:
    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos
    MOV R0, Opcao               ; guarda em R0 o endereco do per. de entrada Opcao
    MOVB R1, [R0]               ; R1 guarda o valor inserido no per. de entrada
    CMP R1, 0                   ; se R1 for igual a zero fica em loop
    JEQ rotinaUsarCartao
    CMP R1, Continuar           ; se for igual a Continuar salta para a rotina de usar cartao 2
    JEQ rotinaUsarCartao2       
    CMP R1, Cancelar            ; se for iguala Cancelar salta para a rotina de Ligado
    JEQ Ligado
    CALL RotinaErro             ; se nao e uma opcao valida chama a rotina de erro e volta para a rotina de usar cartao
    JEQ rotinaUsarCartao

rotinaUsarCartao2:
    MOV R2, MenuCompraPEPE      ; guarda em R2 o endereco do display de opcoes do cartao
    CALL MostraDisplay          ; chama a rotina de usar cartao
    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos
opcaoCartao:
    MOV R0, Opcao               ; R0 guarda o endereco do per. de entrada Opcao
    MOVB R1, [R0]               ; R1 guarda o valor introduzido no per. de entrada

    CMP R1, 0                   ; compara com 0, se for fica em loop
    JEQ opcaoCartao
    CMP R1, Comprar             ; se for igual a Comprar salta para a rotina de comprar com cartao
    JEQ RotinaComprarCartao
    CMP R1, Recarregar          ; se for igual a Recarregar salta para a rotina de recarregar o cartao
    JEQ RotinaRecarregar
    CALL RotinaErro             ; caso contrario nao e uma opcao valida e chama a rotina de erro para o pepe
    JMP rotinaUsarCartao2




;-----------------------------
; Rotina de comprar com cartao
;-----------------------------
RotinaComprarCartao:
    MOV R3, 0                   ; R3 guarda o total a pagar de bilhetes
RotinaComprarCartao2:
    MOV R2, MenuCompra          ; R2 guarda o endereco do menu de compra
    CALL MostraDisplay          ; chama a rotina de mostrar o display
    CALL LimpaPerifericos       ; chama a rotina de limpar os perifericos

LeOpcaoCompraCartao:
    MOV R0, Opcao               ; guarda em R0 o endereco da Opcao
    MOVB R1, [R0]               ; guarda em R1 o valor que esta no endereco

    CMP R1, 0                   ; se for 0 fica em loop
    JEQ LeOpcaoCompraCartao

    CMP R1, Porto               ; se for igual a Porto (1) 
    JEQ RotinaMaisBilhetesCartao; salta para a rotina de mais bilhetes

    CMP R1, Lisboa              ; se for iguala a Lisboa (2)
    JEQ RotinaMaisBilhetesCartao; salta para a rotina de mais bilhetes

    CMP R1, Faro                ; se for igual a Faro (3)
    JEQ RotinaMaisBilhetesCartao; salta para a rotina de mais bilhetes

    CMP R1, Braga               ; se for igual a Braga (4)
    JEQ RotinaMaisBilhetesCartao; salta para a rotina de mais bilhetes

    CMP R1, Cancelar            ; se for igual a Cancelar (5)
    JEQ Ligado                  ; volta para o Ligado                 TA A DAR OUT OF BOUND AQUI

    CALL RotinaErro             ; se nao for nenhuma das opcoes chama a rotina de erro
    JMP RotinaComprarCartao2    ; e volta para a rotina de comprar 2


;---------------------
; Rotina mais bilhetes
;---------------------
RotinaMaisBilhetesCartao:
    MOV R0, TotalPagar          ; guarda em R0 o endereco de total a pagar
    
    CMP R1, 1                   ; se for igual a 1
    JEQ BPortoCartao            ; salta para o bilhete do porto
    CMP R1, 2                   ; se for igual a 2
    JEQ BLisboaCartao           ; salta para o bilhete de Lisboa
    CMP R1, 3                   ; se for igual a 3
    JEQ BFaroCartao             ; salta para o bilhete de Faro
    CMP R1, 4                   ; se for igual a 4
    JEQ BBragaCartao            ; salta para o bilhete de Braga

BPortoCartao:
    MOV R2, CustoPorto          ; guarda em R2 o custo do bilhete para o Porto
    ADD R3, R2                  ; adiciona ao R3 (total a pagar) o valor de R2 (CustoPorto)
    MOV [R0], R3                ; no valor do endereco de memoria do total a pagar mete o valor de R5
    JMP ecraMaisBilhetesCartao  ; salta para o ecra a perguntar se quer mais bilhetes
BLisboaCartao:
    MOV R2, CustoLisboa         ; guarda em R2 o custo do bilhete para Lisboa
    ADD R3, R2                  ; adiciona ao R5 (total a pagar) o valor de R2 (CustoLisboa)
    MOV [R0], R3                ; no valor do endereco de memoria do total a pagar mete o valor de R5
    JMP ecraMaisBilhetesCartao  ; salta para o ecra a perguntar se quer mais bilhetes
BFaroCartao:
    MOV R2, CustoFaro           ; guarda em R2 o custo do bilhete para Faro
    ADD R3, R2                  ; adiciona ao R5 (total a pagar) o valor de R2 (CustoFaro)
    MOV [R0], R3                ; no valor do endereco de memoria do total a pagar mete o valor de R5
    JMP ecraMaisBilhetesCartao  ; salta para o ecra a perguntar se quer mais bilhetes
BBragaCartao:
    MOV R2, CustoBraga          ; guarda em R2 o custo do bilhete para Braga
    ADD R3, R2                  ; adiciona ao R5 (total a pagar) o valor de R2 (CustoBraga)
    MOV [R0], R3                ; no valor do endereco de memoria do total a pagar mete o valor de R5

ecraMaisBilhetesCartao:
    MOV R2, DisplayMaisBilhetes ; guarda em R2 o endereco do display de mais bilhetes
    CALL MostraDisplay          ; chama a rotina de mostar display
    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos
LeOpcaoBilhetesCartao:
    MOV R0, OK                  ; guarda em R0 o endereco de perfiferico de entrada OK
    MOVB R1, [R0]               ; guarda em R1 o valor do periferico de entrada

    CMP R1, 0                   ; compara se o valor e 0
    JEQ LeOpcaoBilhetesCartao   ; se sim fica em loop a espera de um valor aceite

    CMP R1, 1                   ; compara se o valor e 1
    JEQ RotinaComprarCartao2    ; se sim salta para a rotina de comprar mais bilhetes

    CMP R1, 2                   ; compara se o valor e 2
    JEQ RotinaPagamentoCartao   ; se sim salta para a rotina de pagamento dos bilhetes

    CALL RotinaErro             ; se nao e nenhum dos outros chama a rotina de erro 
    JMP Ligado                  ; e salta para o ligado

;-------------------------------
; Rotina de pagamento com cartao
;-------------------------------

RotinaPagamentoCartao:
    MOV R0, TotalPagar          ; endereco com o total a pagar
    MOV R1, [R0]                ; valor com o total a pagar
    MOV R3, BaseDeDados         ; guarda o endereco de memoria com o inicio da base de dados
RotinaPagamentoCartao2:
    MOV R4, [R3]                ; R4 vai ter o valor que esta no endereco de memoria
    MOV R6, FimBaseDeDados      ;
    MOV R2, DisplayTotalPagarCartao
    CALL MostraDisplay

    CMP R4, R7                  ; R7 tem o num de PEPE a ser usado agora compara com o que tem na base de dados a ver se é o mesmo
    JEQ SegueCompra             ; se o numero de cartao existe prossegue a compra
    MOV R5, 16                  ; guarda em R5 o valor 16 para mover para o proximo endereco de mem
    ADD R3, R5                  ; vai para o proximo endereco de mem da base de dados
    CMP R3, R6                  ; compara a ver se chegou ao fim da base de dados
    JNE RotinaPagamentoCartao2  ; se não chegou ao fim volta para o rotina pagamento cartao 2

SegueCompra:
    ADD R3, 4                   ; aumenta 4 ao endereco onde esta a base de dados que e onde contem o saldo do cartao
    MOV R4, [R3]                ; R4 guarda o valor que esta no endereco
    CMP R4, R1                  ; compra o valor que tem em R4 com R1 (total a pagar)
    JGE SaldoSuficiente         ; se esse valor for maior ou igual ao total a pagar segue para a etiqueta saldo suficiente
    MOV R1, 0                   ; guarda em R1 o valor 0
    MOV [R0], R1                ; limpa os valores que estao no total a pagar
    MOV R2, EcraErro            ; mostra que nao tem saldo suficiente para a compra ser realizada
    CALL MostraDisplay          ; aqui vai ficar a espera do ok
    JMP rotinaUsarCartao2       ; volta para as opcoes do cartao
    
SaldoSuficiente:
    SUB R4, R1                  ; retira do saldo o valor a pagar
    MOV [R3], R4                ; atualiza o saldo na base de dados
    MOV R1, 0                   ; guarda em R1 o valor 0
    MOV [R0], R1                ; limpa os valores que estao no total a pagar
    MOV R2, EcraSucesso         ; compra feita com sucesso e mostrar o saldo atual do cartao
    CALL MostraDisplay
    JMP Ligado




;------------------------------
; Rotina de recarregar o cartao
;------------------------------
RotinaRecarregar:
    MOV R0, BaseDeDados
proximoCartao:
    MOV R1, [R0]
    MOV R3, FimBaseDeDados

    CMP R7, R1
    JEQ CartaoCorreto
    MOV R4, 16                  ; guarda em R5 o valor 16 para mover para o proximo endereco de mem
    ADD R0, R4                  ; vai para o proximo endereco de mem da base de dados
    CMP R0, R3
    JMP proximoCartao

CartaoCorreto:
    MOV R3, 0                   ; vai guardar o total inserido
    MOV R8, DinheiroInserido
    MOV [R8], R3
    MOV R2,                     ; display de recarregar
    CALL MostraDisplay
    CALL LimpaPerifericos
loopRecaregar:
    MOV R0, Dinheiro            ; guarda em R0 o endereco do per. de entrada
    MOV R2, [R0]                ; R2 guarda o valor que esta no per. de entrada
    MOV R5, 50H                 ;
    MOV R6, 20H                 ;
    MOV R7, 10H                 ;

    CMP R2, 0                   ; compara com 0, se for igual fica em loop
    JEQ loopRecaregar
    CMP R2, 5                   ; se for igual a 5 introduziu uma nota de 5 
    JEQ pos5euros
    CMP R2, 2                   ; se for igual a 2 introduziu uma moeda de 2
    JEQ pos2euros
    CMP R2, 1                   ; se for igual a 1 introduziu uma moeda de 1
    JEQ pos1euro
    CMP R2, R5                  ; se for igual a 50 introduziu uma moeda de 50
    JEQ pos50cent
    CMP R2, R6                  ; se for igual a 20 introduziu uma moeda de 20
    JEQ pos20cent
    CMP R2, R7                  ; se for igual a 10 introduziu uma moeda de 10
    JEQ pos10cent

    CALL RotinaErroMoeda        ; se nao nao introduziu nenhuma moeda
    JMP loopRecaregar           ; e volta para a etiqueta de introduzir moedas

pos5euros:
    MOV R4, Valor5Euros
    ADD R3, R4
    JMP poeNaMemoria
pos2euros:
    MOV R4, Valor2Euros
    ADD R3, R4
    JMP poeNaMemoria
pos1euro:
    MOV R4, Valor1Euro
    ADD R3, R4
    JMP poeNaMemoria
pos50cent:
    MOV R4, Valor50Cent
    ADD R3, R4
    JMP poeNaMemoria
pos20cent:
    MOV R4, Valor20Cent
    ADD R3, R4
    JMP poeNaMemoria
pos10cent:
    MOV R4, Valor10Cent
    ADD R3, R4

poeNaMemoria:
    MOV [R8], R3
    MOV R3, [R8]
confirmaCarregamento:
    MOV R2, OK
    MOV R4, [R2]
    CMP R4, 0
    JEQ ConfirmarCarregamento
    CMP R4, 1
    JEQ finalCarregamento
    CALL RotinaErro
    JMP ConfirmarCarregamento

finalCarregamento:
    ADD R0, 4
    MOV R1, [R0]
    ADD R3, R1
    MOV [R0], R3


;-------------------------------
;        Rotina Stock
;------------------------------
RotinaStock:
    MOV R2, MenuStock
    CALL MostraDisplay

passStock:
    MOV R0, 0110H
    MOV R1, [R0]
    MOV R2, Escrita
    MOV R3, [R2]

    CMP R3, R1
    JNE passStock

    ADD R0, 1
    MOV R1, [R0]
    CALL LimpaPerifericos
    MOV R2, Escrita
    MOV R3, [R2]
    CMP R3, R1
    JNE passStock

    ADD R0, 1
    MOV R1, [R0]
    CALL LimpaPerifericos
    MOV R2, Escrita
    MOV R3, [R2]
    CMP R3, R1
    JNE passStock

    ADD R0, 1
    MOV R1, [R0]
    CALL LimpaPerifericos
    MOV R2, Escrita
    MOV R3, [R2]
    CMP R3, R1
    JNE passStock

    ADD R0, 1
    MOV R1, [R0]
    CALL LimpaPerifericos
    MOV R2, Escrita
    MOV R3, [R2]
    CMP R3, R1
    JNE passStock

loopStock:
    MOV R0, Opcao
    MOVB R1, [R0]

    CMP R1, 0
    JEQ loopStock
    CMP R1, 1
    JEQ reporStock
    CMP R1, 2
    JEQ verStock
    CMP R1, Cancelar
    JEQ Ligado
    CALL RotinaErro
    JMP loopStock

;----------------------
; Rotina de repor stock
;----------------------
reporStock:
    

    JMP loopStock

;--------------------
; Rotina de ver stock
;--------------------
verStock:
    JMP loopStock


;---------------------------------------------------------------
; Rotinas que serao as mais usadas durante a escrita do programa
;--------------------------------------------------------------- 

;---------------------
; Rotina Limpa Display
;---------------------
LimpaDisplay:
    PUSH R0
    PUSH R1
    PUSH R2

    MOV R0, InicioEcra
    MOV R1, FimEcra
CicloLimpa:
    MOV R2, CaracterVazio
    MOVB [R0], R2
    ADD R0, 1
    CMP R0, R1
    JLE CicloLimpa

    POP R2
    POP R1
    POP R0
    RET

;----------------------
; Rotina Mostra Display
;----------------------
MostraDisplay:
    PUSH R0
    PUSH R1 
    PUSH R3

    MOV R0, InicioEcra
    MOV R1, FimEcra
Ciclo_Display:
    MOV R3, [R2]
    MOV [R0], R3
    ADD R0, 2
    ADD R2, 2
    CMP R0, R1
    JLE Ciclo_Display

    POP R3
    POP R1
    POP R0 
    RET

;--------------------
; Rotina Mostra Talao
;--------------------
MostraTalao:
    PUSH R2
    PUSH R1
    PUSH R0

    MOV R2, MenuTalao
    CALL MostraDisplay
    CALL LimpaPerifericos
CicloTalao:
    MOV R0, OK
    MOVB R1, [R0]
    CMP R1, 1
    JNE CicloTalao

    POP R0
    POP R1
    POP R2
    RET 

;------------------------
;Rotina Limpa Perifericos
;------------------------
LimpaPerifericos:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R5
    
    MOV R0, ON_OFF
    MOV R1, OK
    MOV R2, Opcao
    MOV R3, Dinheiro
    MOV R4, Escrita
    MOV R5, 0
    MOVB [R0], R5
    MOVB [R1], R5
    MOVB [R2], R5
    MOVB [R3], R5
    MOVB [R4], R5

    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET

;------------
; Rotina Erro
;------------
RotinaErro:
    PUSH R2
    PUSH R1
    PUSH R0

    MOV R2, EcraErro
    CALL MostraDisplay
    CALL LimpaPerifericos
CicloErro:
    MOV R0, OK
    MOVB R1, [R0]
    CMP R1, 1
    JNE CicloErro

    POP R0
    POP R1
    POP R2
    RET

;------------------
; Rotina Erro Moeda
;------------------
RotinaErroMoeda:
    PUSH R2
    PUSH R1
    PUSH R0

    MOV R2, EcraErroMoeda
    CALL MostraDisplay
    CALL LimpaPerifericos
CicloErroMoeda:
    MOV R0, OK
    MOVB R1, [R0]
    CMP R1, 1
    JNE CicloErroMoeda

    POP R0
    POP R1
    POP R2
    RET 

;------------------
; Rotina Erro Moeda
;------------------
rotinaNaoExistePepe:
    PUSH R2
    PUSH R1
    PUSH R0

    MOV R2, PepeErro
    CALL MostraDisplay
    CALL LimpaPerifericos
CicloErroPepe:
    MOV R0, OK
    MOVB R1, [R0]
    CMP R1, 1
    JNE CicloErroPepe

    POP R0
    POP R1
    POP R2
    RET