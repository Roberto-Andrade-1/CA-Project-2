;----------------------------------------------------------------
;                        Periferico de entrada
;----------------------------------------------------------------

ON_OFF          EQU 0030H ; Onde o utilizador ira ligar a maquina
OK              EQU 0040H ; Onde o utilizador ira selecionar o OK
Opcao           EQU 0050H ; Onde o utilizador ira escolher a opcao
Dinheiro        EQU 0060H ; Onde o utilizador ira introduzir as moedas/notas

;----------------------------------------------------------------
;      Labels para quem usar saber onde inserir os valores
;----------------------------------------------------------------

Place 0038H
String "ON_OFF" 
Place 0048H
String "OK"
Place 0058H
String "Opcao"
Place 0068H
String "Dinheiro"

;----------------------------------------------------------------
;                          Periferico de saida
;----------------------------------------------------------------

InicioEcra      EQU 0090H
FimEcra         EQU 00FFH

;----------------------------------------------------------------
;                               Constantes
;----------------------------------------------------------------
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

stackPointer    EQU 0000H

;-----------------------------------------------------------------
;                         Menus de informacao
;-----------------------------------------------------------------

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
    String "--- SUCESSO  ---"

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



;--------------------------------------------------------------------
;                             Inicio do programa
;--------------------------------------------------------------------

Place 0000H
Inicio:
    MOV R0, Principio
    JMP R0


Place 0A00H
Principio:
    MOV SP, stackPointer
    CALL LimpaDisplay
    CALL LimpaPerifericos
    MOV R0, ON_OFF

LeOnOff:
    MOVB R1, [R0]
    CMP R1, 1
    JNE LeOnOff

Ligado:
    MOV R2, MenuPrincipal
    CALL MostraDisplay
    CALL LimpaPerifericos

LeOpcao:
    MOV R3, Opcao
    MOVB R4, [R3]
    CMP R4, 0
    JEQ LeOpcao
    CMP R4, Comprar
    JEQ RotinaComprar
    CMP R4, UsarCartao
    JEQ RotinaCartao
    CMP R4, Stock
    JEQ RotinaStock
    CALL RotinaErro
    JMP Ligado


;---------------
; Rotina Comprar
;---------------
RotinaComprar:
    MOV R2, MenuCompra
    CALL MostraDisplay
    CALL LimpaPerifericos

LeOpcaoCompra:
    MOV R0, Opcao
    MOVB R1, [R0]
    CMP R1, 0
    JEQ LeOpcaoCompra
    CMP R1, Porto
    JEQ RotinaPagamento
    CMP R1, Lisboa
    JEQ RotinaPagamento
    CMP R1, Faro
    JEQ RotinaPagamento
    CMP R1, Braga
    JEQ RotinaPagamento
    CMP R1, Cancelar
    JEQ Ligado 
    CALL RotinaErro
    
    JMP Ligado

;-----------------
; Rotina Pagamento
;-----------------
RotinaPagamento:

    JMP Ligado

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
