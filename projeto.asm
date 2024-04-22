;------------------------------------------------------------------------------------
;                               Periferico de entrada
;------------------------------------------------------------------------------------

ON_OFF          EQU 0020H ; Onde o utilizador ira ligar a maquina
OK              EQU 0030H ; Onde o utilizador ira selecionar o OK
Opcao           EQU 0040H ; Onde o utilizador ira escolher a opcao
Dinheiro        EQU 0050H ; Onde o utilizador ira introduzir as moedas/notas
PassePepe       EQU 0060H ; Onde o utilizador ira introduzir a passe do stock ou o nº
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
    String "2-Cancelar      "
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



;--------------------------------------------------------------------
;                             Inicio do programa
;--------------------------------------------------------------------

Place 0000H
Inicio:
    MOV R0, Principio       ; guarda no R0 o endereco do principio do programa
    JMP R0                  ; salta para o endereco em questao


Place 0A00H
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
    JEQ RotinaCartao            ; entao salta para a rotina de usar cartao

    CMP R1, Stock               ; se o valor for igual a Stock (3)
    JEQ RotinaStock             ; entao salta para a rotina de stock

    CALL RotinaErro             ; se nao for nenhuma das disponiveis chama a rotina de erro
    JMP Ligado                  ; e volta ao Ligado


;-------------------
; Rotina Usar Cartao
;-------------------
RotinaCartao:

    JMP Ligado

;-------------
; Rotina Stock
;-------------
RotinaStock:

    JMP Ligado

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
    CALL LimpaPerifericos       ; chama a rotina de limpar os perifericos
RotinaPagamento3:
    MOV R2, Dinheiro            ; guarda em R2 o endereco do periferico de entrada Dinheiro
    MOVB R6, [R2]               ; guarda em R6 o valor do periferico de entrada Dinheiro
    MOV R8, 50H
    MOV R9, 20H
    MOV R10, 10H
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
    CMP R7, 0
    JEQ ConfirmarPagamento
    CMP R7, 1
    JEQ Final
    CALL RotinaErro
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
    SUB R4, R1                  ;
    MOV R1 , TrocoAdevolver     ;
    MOV [R1], R4                ;
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

    MOV R2, EcraSucesso
    CALL MostraDisplay
    ;JMP Ligado




;--------------------------------------------------------------------------
;         Rotina de usar cartao, podendo recarregar e comprar viagens
;--------------------------------------------------------------------------




;-------------
; Rotina Stock
;-------------
;RotinaStock:

 ;   JMP Ligado







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

;------------------------
;Rotina Limpa Perifericos
;------------------------
LimpaPerifericos:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    
    MOV R0, ON_OFF
    MOV R1, OK
    MOV R2, Opcao
    MOV R3, Dinheiro
    MOV R4, 0
    MOVB [R0], R4
    MOVB [R1], R4
    MOVB [R2], R4
    MOVB [R3], R4

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
