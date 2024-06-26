;------------------------------------------------------------------------------------
;                               Periferico de entrada
;------------------------------------------------------------------------------------

PER_EN           EQU 0040H ; Onde o utilizador ira introduzir as suas escolhas e inputs 

;------------------------------------------------------------------------------------
;              Labels para quem usar saber onde inserir os valores
;               e tambem saber onde estao os valores de cada coisa
;------------------------------------------------------------------------------------

Place 0048H
String "PER_EN"
Place 0126H
String "PEPEs"
Place 0136H
String "TotalPagar"
Place 0146H
String "Notas 5"
Place 0156H
String "Moedas 2"
Place 0166H
String "Moedas 1"
Place 0176H
String "Moedas 50"
Place 0186H
String "Moedas 20"
Place 0196H
String "Moedas 10"
Place 01A6H
String "TotalPosto"
Place 01B6H
String "Troco"
Place 01C6H
String "MoedaAtual"

;-------------------------------------------------------------------------------------
;                                Periferico de saida
;-------------------------------------------------------------------------------------

InicioEcra      EQU 0090H
FimEcra         EQU 00FFH

;-------------------------------------------------------------------------------------
;                                      Constantes
;-------------------------------------------------------------------------------------
CaracterVazio   EQU 20H         ; Caracter vazio

Comprar         EQU 1           ; Opcao de comprar bilhete
UsarCartao      EQU 2           ; Opcao de usar cartao
Stock           EQU 3           ; Opcao de stock

Continuar       EQU 1           ; Opcao de continuar
Cancelar        EQU 5           ; Opcao de cancelar

Recarregar      EQU 2           ; Opcao de recarregar cartao

Seguinte        EQU 1           ; Opcao de seguinte

Porto           EQU 1           ; Opcao de bilhete para o Porto
Lisboa          EQU 2           ; Opcao de bilhete para Lisboa
Faro            EQU 3           ; Opcao de bilhete para Faro
Braga           EQU 4           ; Opcao de bilhete para Braga

CustoPorto      EQU 150         ; Custo do bilhete para o Porto
CustoLisboa     EQU 250         ; Custo do bilhete para Lisboa
CustoFaro       EQU 350         ; Custo do bilhete para Faro
CustoBraga      EQU 450         ; Custo do bilhete para Braga

Valor5Euros     EQU 500         ; Valor da nota de 5
Valor2Euros     EQU 200         ; Valor da moeda de 2
Valor1Euro      EQU 100         ; Valor da moeda de 1
Valor50Cent     EQU 50          ; Valor da moeda de 50
Valor20Cent     EQU 20          ; Valor da moeda de 20
Valor10Cent     EQU 10          ; Valor da moeda de 10

stackPointer    EQU 0000H       ; Endereco inicial da stack

NumTotalCarater EQU 4           ; Numero total de carateres


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
DinheiroAtualInserido EQU 01C0H     ; endereco onde fica guardado a moeda que foi inserida agora
BaseDeDados         EQU 2000H       ; endereco onde vao ficar guardados os numeros de pepe e o seu saldo
FimBaseDeDados      EQU 2070H       ; endereco do fim da base de dados

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
    String "                "
    String "TROCO:    .     "
    String "                "
    String "                "
    String "                "
    String "OK pra continuar"

Place 0350H
MenuCodigoPEPE:
    String "                "    
    String "  INTRODUZA N.  "
    String "      PEPE      "
    String "                "
    String "      XXXX      "
    String "                "
    String "                "

Place 03D0H
MenuCompraPEPE:
    String "   SALDO PEPE   "
    String "                "
    String "       .        "
    String "                "
    String "1-Comprar       "
    String "2-Recarregar    "
    String "5-Cancelar      "

Place 0450H
MenuStock1:
    String "-- Stock 1/3 -- "
    String "Notas  5 Euro:  "
    String "                "
    String "Moeda  2 Euro:  "
    String "                "
    String "                "
    String "1-Seguinte      "

Place 04D0H
MenuStock2:
    String "-- Stock 2/3 -- "
    String "Moeda  1 Euro:  "
    String "                "
    String "Moeda 50 Cent:  "
    String "                "
    String "                "
    String "1-Seguinte      "

Place 0550H
MenuStock3:
    String "-- Stock 3/3 -- "
    String "Moeda 20 Cent:  "
    String "                "
    String "Moeda 10 Cent:  "
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
    String "   1- SIM       "
    String "   2- NAO       "

Place 07D0H
DisplayTotalPagar:
    String "     TOTAL      "
    String "                "
    String "       .        "
    String "                "
    String " INSIRA MOEDAS  "
    String "   E  DEPOIS    "
    String "OK PRA CONTINUAR"

Place 0850H
DisplayTotalPagarCartao:
    String "     TOTAL      "
    String "                "
    String "       .        "
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
    String "                "
    String "   INTRODUZA    "
    String "    PASSWORD    "
    String "                "
    String "     XXXXX      "
    String "                "
    String "                "

Place 09D0H
MenuUsarCartao:
    String "                "
    String "    UTILIZAR    "
    String "     CARTAO     "
    String "                "
    String "1-Comprar       "
    String "2-Recarregar    "
    String "                "

Place 0A50H
PepeErro:
    String "----- ERRO -----"
    String "                "
    String "      PEPE      "
    String "      NAO       "
    String "     EXISTE     "
    String "                "
    String "OK pra continuar"

Place 0AD0H
OpcoesStock:
    String "     STOCK      "
    String "                "
    String "1-Repor Stock   "
    String "2-Ver Stock     "
    String "                "
    String "5-Cancelar      "
    String "                "

Place 0B50H
EcraRepor:
    String "     STOCK      "
    String "                "
    String " TIPO DE MOEDA  "
    String "  NO DINHEIRO   "
    String "                "
    String "   QUANTIDADE   "
    String "   NO ESCRITA   "

Place 0BD0H
EcraRecarregar:
    String "                "
    String " INSIRA MOEDAS  "
    String " PARA CARREGAR  "
    String "    O CARTAO    "
    String "                "
    String "   E  DEPOIS    "
    String "OK PRA CONTINUAR"

Place 0C50H
saldoInsuficiente:
    String "                "
    String "    NAO TEM     "
    String "     SALDO      "
    String "   SUFICIENTE   "
    String "                "
    String "                "
    String "OK PRA CONTINUAR"

;--------------------------------------------------------------------
;                             Inicio do programa
;--------------------------------------------------------------------

Place 0000H
Inicio:
    MOV R0, Principio           ; guarda no R0 o endereco do principio do programa
    JMP R0                      ; salta para o endereco em questao


Place 1200H
Principio:
    MOV SP, stackPointer        ; stack pointer inicializada com o endereço fornecido nas variaveis
    CALL LimpaDisplay           ; chama a rotina de limpar o display para ficar todo em branco
    CALL LimpaPerifericos       ; chama a rotina de limpar os perifericos
    MOV R0, PER_EN              ; guarda no R0 o endereço do periferico de entrada de ligar e desligar a maquina

LeOnOff:
    MOVB R1, [R0]               ; guarda em R1 o valor introduzido no periferico de entrada
    CMP R1, 1                   ; verifica se o valor e 1
    JNE LeOnOff                 ; se nao for igual salta para a rotina LeOnOff, fica num loop a espera de um valor no per. de entrada

Ligado:
    MOV R2, MenuPrincipal       ; no R2 fica guardado o endereco do display MenuPrincipal
    CALL MostraDisplay          ; chama a rotina de mostra display para mostrar o display anterior
    CALL LimpaPerifericos       ; chama a rotina que limpa os perifericos de entrada

LeOpcao:
    MOV R0, PER_EN              ; guarda no R0 o endereco da opcao
    MOVB R1, [R0]               ; guarda no R1, o valor que esta no endereco de R0

    CMP R1, 0                   ; compara com 0 
    JEQ LeOpcao                 ; se for fica em loop ate ter um valor diferente de 0 

    CMP R1, Comprar             ; se o valor for igual a Comprar (1)
    JEQ RotinaComprar           ; entao salta para a rotina de comprar

    CMP R1, UsarCartao          ; se o valor for igual a UsarCartao (2)
    JEQ UsarCartaoIntermedio    ; entao salta para a rotina de usar cartao

    CMP R1, Stock               ; se o valor for igual a Stock (3)
    JEQ StockIntermedio         ; entao salta para a rotina de stock

    CALL RotinaErro             ; se nao for nenhuma das disponiveis chama a rotina de erro
    JMP Ligado                  ; e volta ao Ligado

UsarCartaoIntermedio:
    JMP RotinaCartao            ; para conseguir chegar a rotina

StockIntermedio:
    JMP RotinaStock             ; para conseguir chegar a rotina

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
    MOV R0, PER_EN              ; guarda em R0 o endereco da Opcao
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
    MOV R0, PER_EN              ; guarda em R0 o endereco de perfiferico de entrada OK
    MOVB R1, [R0]               ; guarda em R1 o valor do periferico de entrada

    CMP R1, 0                   ; compara se o valor e 0
    JEQ LeOpcaoBilhetes         ; se sim fica em loop a espera de um valor aceite

    CMP R1, 1                   ; compara se o valor e 1
    JEQ RotinaComprar2          ; se sim salta para a rotina de comprar mais bilhetes

    CMP R1, 2                   ; compara se o valor e 2
    JEQ RotinaPagamento         ; se sim salta para a rotina de pagamento dos bilhetes

    CALL RotinaErro             ; se nao e nenhum dos outros chama a rotina de erro 
    JMP ecraMaisBilhetes        


;-----------------
; Rotina Pagamento
;-----------------
RotinaPagamento:
    MOV R0, TotalPagar          ; R0 vai guaradr o endereco de total a pagar
    MOV R1, [R0]                ; R1 vai guardar o valor no endereco de memoria de R0
    MOV R3, DinheiroInserido    ; R3 guarda o endereço do dinheiro total inserido
    MOV R4, 0                   ; R4 vai ter o total inserido pelo user 
    MOV R3, DinheiroAtualInserido ; R3, fica com o endereco da moeda/nota que foi inserida atualmente
    MOV R0, [R3]                ; R0 guarda o valor que ta na memoria
RotinaPagamento2:
    MOV R2, DisplayTotalPagar   ; guarda em R2 o endereco do display que mostra o total a pagar
    CALL MostraDisplay          ; chama a rotina de mostrar o display
    MOV R2, 00B5H               ; R2 guarda o endereco do display onde vai ser inserido o valor a pagar
    CALL converter              ; chama a rotina que vai inserir esse valor no display
    CALL LimpaPerifericos       ; chama a rotina de limpar os perifericos
RotinaPagamento3:
    MOV R5, PER_EN              ; guarda em R2 o endereco do periferico de entrada Dinheiro
    MOVB R6, [R5]               ; guarda em R6 o valor do periferico de entrada Dinheiro
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
    
    CMP R6, R10                 ; se o user introduzir o valor "10" no periferico de entrada representa 10 cents
    JEQ inseriu10cent           ; salta para a etiqueta de inserir 10 cents na variavel que tem o total inserido pelo user

    CALL RotinaErroMoeda        ; se nao for nenhum destes valores significa que nao e uma moeda e chama a rotina de erro de moedas
    JMP RotinaPagamento2        ; volta para a parte de inserir moedas

inseriu5euros:
    MOV R8, Valor5Euros         ; R8 guarda o valor da nota de 5
    ADD R4, R8                  ; adiciona o valor 500 a variavel R4 (total inserido pelo user)
    MOV R0, R8                  ; move o valor inserido, para o R0 (moeda/nota atual inserida)
    MOV R5, QuantidadeNotas5    ; R5 guarda o endereco da quantidade de notas de 5
    MOV R7, [R5]                ; R7 guarda o valor que esta no endereco
    ADD R7, 1                   ; adiciona mais um a esse valor
    MOV [R5], R7                ; move a nova quantidade para o endereco de memoria 
    JMP AdicionaValor           ; salta para a etiquita que vai adicionar na memoria esse valor
inseriu2euros:
    MOV R8, Valor2Euros         ; R8 guarda o valor da moeda de 2
    ADD R4, R8                  ; adiciona o valor 200 a variavel R4 (total inserido pelo user)
    MOV R0, R8                  ; move o valor inserido, para o R0 (moeda/nota atual inserida)
    MOV R5, QuantidadeMoedas2   ; R5 guarda o endereco da quantidade de moedas de 2
    MOV R7, [R5]                ; R7 guarda o valor que esta no endereco
    ADD R7, 1                   ; adiciona mais um a esse valor
    MOV [R5], R7                ; move a nova quantidade para o endereco de memoria 
    JMP AdicionaValor           ; salta para a etiquita que vai adicionar na memoria esse valor
inseriu1euros:
    MOV R8, Valor1Euro          ; R8 guarda o valor da moeda de 1
    ADD R4, R8                  ; adiciona o valor 100 a variavel R4 (total inserido pelo user)
    MOV R0, R8                  ; move o valor inserido, para o R0 (moeda/nota atual inserida)
    MOV R5, QuantidadeMoedas1   ; R5 guarda o endereco da quantidade de moedas de 1
    MOV R7, [R5]                ; R7 guarda o valor que esta no endereco
    ADD R7, 1                   ; adiciona mais um a esse valor
    MOV [R5], R7                ; move a nova quantidade para o endereco de memoria
    JMP AdicionaValor           ; salta para a etiquita que vai adicionar na memoria esse valor
inseriu50cent:
    MOV R8, Valor50Cent         ; R8 guarda o valor da moeda de 50
    ADD R4, R8                  ; adiciona o valor 50 a variavel R4 (total inserido pelo user)
    MOV R0, R8                  ; move o valor inserido, para o R0 (moeda/nota atual inserida)
    MOV R5, QuantidadeMoedas50  ; R5 guarda o endereco da quantidade de moedas de 50
    MOV R7, [R5]                ; R7 guarda o valor que esta no endereco
    ADD R7, 1                   ; adiciona mais um a esse valor
    MOV [R5], R7                ; move a nova quantidade para o endereco de memoria
    JMP AdicionaValor           ; salta para a etiquita que vai adicionar na memoria esse valor
inseriu20cent:
    MOV R8, Valor20Cent         ; R8 guarda o valor da moeda de 20
    ADD R4, R8                  ; adiciona o valor 20 a variavel R4 (total inserido pelo user)
    MOV R0, R8                  ; move o valor inserido, para o R0 (moeda/nota atual inserida)
    MOV R5, QuantidadeMoedas20  ; R5 guarda o endereco da quantidade de moedas de 20
    MOV R7, [R5]                ; R7 guarda o valor que esta no endereco
    ADD R7, 1                   ; adiciona mais um a esse valor
    MOV [R5], R7                ; move a nova quantidade para o endereco de memoria
    JMP AdicionaValor           ; salta para a etiquita que vai adicionar na memoria esse valor
inseriu10cent:
    MOV R8, Valor10Cent         ; R8 guarda o valor da moeda de 10
    ADD R4, R8                  ; adiciona o valor 10 a variavel R4 (total inserido pelo user)
    MOV R0, R8                  ; move o valor inserido, para o R0 (moeda/nota atual inserida)
    MOV R5, QuantidadeMoedas10  ; R5 guarda o endereco da quantidade de moedas de 10
    MOV R7, [R5]                ; R7 guarda o valor que esta no endereco
    ADD R7, 1                   ; adiciona mais um a esse valor
    MOV [R5], R7                ; move a nova quantidade para o endereco de memoria

AdicionaValor:
    MOV R3, DinheiroAtualInserido ; R3 guarda o endereco da moeda/nota atual inserida
    MOV [R3], R0                ; move o valor inserido para o endereco de memoria
    MOV R3, DinheiroInserido    ; R3 guarda o endereco do dinheiro total inserido
    MOV [R3], R4                ; adiciona no espaco de memoria do dinheiro total inserido o valor de R4
    MOV R4, [R3]                ; R4 vai ficar com o valor que tem no espaco de memoria de R3
ConfirmarPagamento:
    SUB R1, R0                  ; subtrai o valor total a pagar pelo valor inserido
    CMP R1, 0                   ; compara se o valor e 0
    JLE Final                   ; se for menor ou igual a 0 salta para a etiqueta de final
    JMP RotinaPagamento2        ; se nao volta para a rotina de pagamento 2

Final:
    MOV R0, TotalPagar          ; R0 vai guaradr o endereco de total a pagar
    MOV R1, [R0]                ; R1 vai guardar o valor no endereco de memoria de R0
    CMP R4, R1                  ; compara a ver se o valor total introduzido e igual ou superior ao total a pagar
    JGE CriarPEPE               ; se sim salta para a rotina de criar o PEPE


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
    MOV R2, MenuTalao           ; guarda o endereco do display do talao
    CALL MostraDisplay          ; chama a rotina de mostrar o talao, com o troco e o pepe gerado
    MOV R2, 00B8H               ; guarda o endereco do display onde vai ser inserido o troco a devolver
    MOV R3, TrocoAdevolver      ; guarda o endereco do troco a devolver
    MOV R1, [R3]                ; guarda o valor do troco a devolver
    CALL converter              ; chama a rotina que vai inserir o troco a devolver no display
    MOV R2, 00A5H               ; guarda o endereco do display onde vai ser inserido o numero do pepe
    MOV R0, NumeroDePepes       ; guarda o endereco do numero de pepes
    MOV R1, [R0]                ; guarda o valor do numero de pepes
    CALL PEPEeStock             ; chama a rotina que vai inserir o numero do pepe no display
loopPEPE:
    MOV R0, PER_EN              ; guarda o endereco do periferico de entrada OK
    MOVB R1, [R0]               ; guarda o valor introduzido no periferico de entrada
    CMP R1, 0                   ; compara se o valor e 0
    JEQ loopPEPE                ; se for fica em loop
    CMP R1, 1                   ; compara se o valor e 1
    JEQ fimPEPE                 ; se for salta para o fim do pepe
    CALL RotinaErro             ; se nao for nenhum dos valores validos chama a rotina de erro
    JEQ loopPEPE                ; volta para o loop do pepe
fimPEPE:
    JMP Ligado                  ; volta para o ligado


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

    MOV R6, PER_EN              ; R6 guarda o endereco do per. de entrada para introducao do num de pepe
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

;----------------------
; Rotina de Usar Cartao
;----------------------
rotinaUsarCartao:
    MOV R2, MenuCompraPEPE      ; guarda em R2 o endereco do display de opcoes do cartao
    CALL MostraDisplay          ; chama a rotina de usar cartao
    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos
    MOV R2, 00B5H               ; guarda o endereco do display onde vai ser inserido o total a pagar
    ADD R0, 4                   ; adiciona 4 ao endereco de memoria para ir buscar o total a pagar
    MOV R1, [R0]                ; guarda o valor do total a pagar
    CALL converter              ; chama a rotina que vai inserir o total a pagar no display
opcaoCartao:
    MOV R0, PER_EN              ; R0 guarda o endereco do per. de entrada Opcao
    MOVB R1, [R0]               ; R1 guarda o valor introduzido no per. de entrada

    CMP R1, 0                   ; compara com 0, se for fica em loop
    JEQ opcaoCartao 
    CMP R1, Comprar             ; se for igual a Comprar salta para a rotina de comprar com cartao
    JEQ RotinaComprarCartao
    CMP R1, Recarregar          ; se for igual a Recarregar salta para a rotina de recarregar o cartao
    JEQ recarregarIntermedio
    CMP R1, Cancelar            ; se for iguala Cancelar salta para a rotina de Ligado
    JEQ LigadoIntermedio
    CALL RotinaErro             ; caso contrario nao e uma opcao valida e chama a rotina de erro para o pepe
    JMP rotinaUsarCartao

LigadoIntermedio:
    JMP Ligado                  ; volta para o ligado

recarregarIntermedio:
    JMP RotinaRecarregar        ; salta para a rotina de recarregar o cartao

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
    MOV R0, PER_EN              ; guarda em R0 o endereco da Opcao
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
    JEQ rotinaUsarCartao        ; 

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
    MOV R0, PER_EN              ; guarda em R0 o endereco de perfiferico de entrada OK
    MOVB R1, [R0]               ; guarda em R1 o valor do periferico de entrada

    CMP R1, 0                   ; compara se o valor e 0
    JEQ LeOpcaoBilhetesCartao   ; se sim fica em loop a espera de um valor aceite

    CMP R1, 1                   ; compara se o valor e 1
    JEQ RotinaComprarCartao2    ; se sim salta para a rotina de comprar mais bilhetes

    CMP R1, 2                   ; compara se o valor e 2
    JEQ RotinaPagamentoCartao   ; se sim salta para a rotina de pagamento dos bilhetes

    CALL RotinaErro             ; se nao e nenhum dos outros chama a rotina de erro 
    JMP LeOpcaoBilhetesCartao   ; e salta para o ligado

;-------------------------------
; Rotina de pagamento com cartao
;-------------------------------

RotinaPagamentoCartao:
    MOV R0, TotalPagar          ; endereco com o total a pagar
    MOV R1, [R0]                ; valor com o total a pagar
    MOV R3, BaseDeDados         ; guarda o endereco de memoria com o inicio da base de dados
RotinaPagamentoCartao2:
    MOV R4, [R3]                ; R4 vai ter o valor que esta no endereco de memoria
    MOV R6, FimBaseDeDados      ; R6 guarda o endereco de memoria do fim da base de dados
    MOV R2, DisplayTotalPagarCartao ; guarda o endereco do display onde vai ser inserido o total a pagar
    CALL MostraDisplay          ; chama a rotina de mostrar display
    MOV R2, 00B5H               ; guarda o endereco do display onde vai ser inserido o total a pagar
    CALL converter              ; chama a rotina que vai inserir o total a pagar no display
    CMP R4, R7                  ; R7 tem o num de PEPE a ser usado agora compara com o que tem na base de dados a ver se é o mesmo
    JEQ SegueCompra1            ; se o numero de cartao existe prossegue a compra
    MOV R5, 16                  ; guarda em R5 o valor 16 para mover para o proximo endereco de mem
    ADD R3, R5                  ; vai para o proximo endereco de mem da base de dados
    CMP R3, R6                  ; compara a ver se chegou ao fim da base de dados
    JNE RotinaPagamentoCartao2  ; se não chegou ao fim volta para o rotina pagamento cartao 2
SegueCompra1:
    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos
SegueCompra:
    MOV R9, PER_EN              ; guarda o endereco do periferico de entrada OK
    MOVB R10, [R9]              ; guarda o valor introduzido no periferico de entrada
    CMP R10, 0                  ; compara se o valor e 0
    JEQ SegueCompra             ; se for 0 fica em loop
    CMP R10, 1                  ; compara se o valor e 1
    JEQ continuacao             ; se for 1 prossegue com a compra
    CALL RotinaErro             ; se nao for nenhum dos valores validos chama a rotina de erro
    JMP SegueCompra1            ; volta para a rotina de pagamento cartao 1

continuacao:
    ADD R3, 4                   ; aumenta 4 ao endereco onde esta a base de dados que e onde contem o saldo do cartao
    MOV R4, [R3]                ; R4 guarda o valor que esta no endereco
    CMP R4, R1                  ; compra o valor que tem em R4 com R1 (total a pagar)
    JGE SaldoSuficiente         ; se esse valor for maior ou igual ao total a pagar segue para a etiqueta saldo suficiente
    MOV R1, 0                   ; guarda em R1 o valor 0
    MOV [R0], R1                ; limpa os valores que estao no total a pagar
loopInsuficiente:
    MOV R2, saldoInsuficiente   ; mostra que nao tem saldo suficiente para a compra ser realizada
    CALL MostraDisplay          ; aqui vai ficar a espera do ok
    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos
loopInsuficiente2:
    MOV R0, PER_EN              ; guarda em R0 o endereco do periferico de entrada OK
    MOVB R1, [R0]               ; guarda em R1 o valor introduzido no periferico de entrada
    CMP R1, 0                   ; compara se o valor e 0
    JEQ loopInsuficiente2       ; se for 0 fica em loop
    CMP R1, 1                   ; compara se o valor e 1
    JEQ voltaInsuficiente       ; se for 1 volta para a etiqueta de saldo insuficiente
    CALL RotinaErro             ; se nao for nenhum dos valores validos chama a rotina de erro
    JMP loopInsuficiente        ; volta para o loop de saldo insuficiente
voltaInsuficiente:
    JMP  RotinaCartao           ; volta a pedir para introduzir o cartao

SaldoSuficiente:
    SUB R4, R1                  ; retira do saldo o valor a pagar
    MOV [R3], R4                ; atualiza o saldo na base de dados
    MOV R1, 0                   ; guarda em R1 o valor 0
    MOV [R0], R1                ; limpa os valores que estao no total a pagar
    MOV R2, EcraSucesso         ; compra feita com sucesso e mostrar o saldo atual do cartao
    CALL MostraDisplay          ; chama a rotina de mostrar display
loopConfirmar:
    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos
loopConfirmar2:
    MOV R0, PER_EN              ; guarda o endereco do periferico de entrada OK
    MOVB R1, [R0]               ; guarda o valor introduzido no periferico de entrada
    CMP R1, 0                   ; compara se o valor e 0
    JEQ loopConfirmar2          ; se for 0 fica em loop
    CMP R1, 1                   ; compara se o valor e 1
    JEQ prosseguir              ; se for 1 prossegue com a compra
    CALL RotinaErro             ; se nao for nenhum dos valores validos chama a rotina de erro
    JMP loopConfirmar           ; volta para o loop de confirmar

prosseguir:
    MOV R2, 00B5H               ; guarda o endereco do display onde vai ser inserido o saldo atual do cartao
    MOV R1, [R3]                ; guarda o valor do saldo atual do cartao

    SUB R3, 4                   ; subtrai 4 ao endereco de memoria para ir buscar o numero do cartao
    MOV R0, R3                  ; move o endereco de memoria para R0
    JMP rotinaUsarCartao        ; volta para a rotina de usar cartao

;------------------------------ 
; Rotina de recarregar o cartao
;------------------------------
RotinaRecarregar:
    MOV R0, BaseDeDados         ; guarda o endereco de memoria do inicio da base de dados
proximoCartao:
    MOV R1, [R0]                ; R1 guarda o valor que esta no endereco de memoria
    MOV R3, FimBaseDeDados      ; R3 guarda o endereco de memoria do fim da base de dados

    CMP R7, R1                  ; compara o valor introduzido com o que esta na base de dados
    JEQ CartaoCorreto           ; se for igual salta para a etiqueta de cartao correto
    MOV R4, 16                  ; guarda em R5 o valor 16 para mover para o proximo endereco de mem
    ADD R0, R4                  ; vai para o proximo endereco de mem da base de dados
    CMP R0, R3                  ; compara a ver se ja chegou ao fim da base de dados
    JMP proximoCartao           ; se nao chegou volta para a rotina de recarregar

CartaoCorreto:
    MOV R3, 0                   ; vai guardar o total inserido
    MOV R8, DinheiroInserido    ; R8 guarda o endereco do dinheiro inserido
    MOV [R8], R3                ; limpa o valor que esta no endereco de memoria
    MOV R2, EcraRecarregar      ; guarda o endereco do display de recarregar
    CALL MostraDisplay          ; chama a rotina de mostrar display
    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos
loopRecaregar:
    MOV R0, PER_EN              ; guarda em R0 o endereco do per. de entrada
    MOVB R2, [R0]               ; R2 guarda o valor que esta no per. de entrada
    MOV R5, 50H                 ; guarda em R5 o valor 50
    MOV R6, 20H                 ; guarda em R6 o valor 20
    MOV R1, 10H                 ; guarda em R1 o valor 10

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
    CMP R2, R1                  ; se for igual a 10 introduziu uma moeda de 10
    JEQ pos10cent

    CALL RotinaErroMoeda        ; se nao nao introduziu nenhuma moeda
    JMP CartaoCorreto           ; e volta para a etiqueta de introduzir moedas

pos5euros:
    MOV R4, Valor5Euros         ; R4 guarda o valor da nota de 5
    ADD R3, R4                  ; adiciona o valor 5 a variavel R3 (total inserido pelo user)
    MOV R5, QuantidadeNotas5    ; R5 guarda o endereco da quantidade de notas de 5
    MOV R6 , [R5]               ; R6 guarda o valor que esta no endereco
    ADD R6, 1                   ; adiciona mais um a esse valor
    MOV [R5], R6                ; move a nova quantidade para o endereco de memoria
    JMP poeNaMemoria            ; salta para a etiqueta que vai adicionar na memoria esse valor
pos2euros:
    MOV R4, Valor2Euros         ; R4 guarda o valor da moeda de 2
    ADD R3, R4                  ; adiciona o valor 2 a variavel R3 (total inserido pelo user)
    MOV R5, QuantidadeMoedas2   ; R5 guarda o endereco da quantidade de moedas de 2
    MOV R6, [R5]                ; R6 guarda o valor que esta no endereco
    ADD R6, 1                   ; adiciona mais um a esse valor
    MOV [R5], R6                ; move a nova quantidade para o endereco de memoria
    JMP poeNaMemoria            ; salta para a etiqueta que vai adicionar na memoria esse valor
pos1euro:
    MOV R4, Valor1Euro          ; R4 guarda o valor da moeda de 1
    ADD R3, R4                  ; adiciona o valor 1 a variavel R3 (total inserido pelo user)
    MOV R5, QuantidadeMoedas1   ; R5 guarda o endereco da quantidade de moedas de 1
    MOV R6 , [R5]               ; R6 guarda o valor que esta no endereco
    ADD R6, 1                   ; adiciona mais um a esse valor
    MOV [R5], R6                ; move a nova quantidade para o endereco de memoria
    JMP poeNaMemoria            ; salta para a etiqueta que vai adicionar na memoria esse valor
pos50cent:
    MOV R4, Valor50Cent         ; R4 guarda o valor da moeda de 50
    ADD R3, R4                  ; adiciona o valor 50 a variavel R3 (total inserido pelo user)
    MOV R5, QuantidadeMoedas50  ; R5 guarda o endereco da quantidade de moedas de 50
    MOV R6 , [R5]               ; R6 guarda o valor que esta no endereco
    ADD R6, 1                   ; adiciona mais um a esse valor
    MOV [R5], R6                ; move a nova quantidade para o endereco de memoria
    JMP poeNaMemoria            ; salta para a etiqueta que vai adicionar na memoria esse valor
pos20cent:
    MOV R4, Valor20Cent         ; R4 guarda o valor da moeda de 20
    ADD R3, R4                  ; adiciona o valor 20 a variavel R3 (total inserido pelo user)
    MOV R5, QuantidadeMoedas20  ; R5 guarda o endereco da quantidade de moedas de 20
    MOV R6 , [R5]               ; R6 guarda o valor que esta no endereco
    ADD R6, 1                   ; adiciona mais um a esse valor
    MOV [R5], R6                ; move a nova quantidade para o endereco de memoria
    JMP poeNaMemoria            ; salta para a etiqueta que vai adicionar na memoria esse valor
pos10cent:
    MOV R4, Valor10Cent         ; R4 guarda o valor da moeda de 10
    ADD R3, R4                  ; adiciona o valor 10 a variavel R3 (total inserido pelo user)
    MOV R5, QuantidadeMoedas10  ; R5 guarda o endereco da quantidade de moedas de 10
    MOV R6 , [R5]               ; R6 guarda o valor que esta no endereco
    ADD R6, 1                   ; adiciona mais um a esse valor
    MOV [R5], R6                ; move a nova quantidade para o endereco de memoria

poeNaMemoria:
    MOV [R8], R3                ; move o total inserido para o endereco de memoria
    MOV R3, [R8]                ; move o total inserido para R3
    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos
confirmaCarregamento:
    MOV R2, PER_EN              ; guarda o endereco do periferico de entrada OK
    MOVB R4, [R2]               ; guarda o valor introduzido no periferico de entrada
    CMP R4, 0                   ; compara se o valor e 0
    JEQ confirmaCarregamento    ; se for 0 fica em loop
    CMP R4, 1                   ; compara se o valor e 1
    JEQ finalCarregamento       ; se for 1 salta para o final do carregamento
    CALL RotinaErro             ; se nao for nenhum dos valores validos chama a rotina de erro
    JMP confirmaCarregamento    ; volta para o loop de confirmar o carregamento

finalCarregamento:
    MOV R0, BaseDeDados         ; guarda o endereco de memoria do inicio da base de dados
nextCartao:
    MOV R1, [R0]                ; guarda o valor que esta no endereco de memoria
    MOV R5, FimBaseDeDados      ; guarda o endereco de memoria do fim da base de dados

    CMP R7, R1                  ; compara o valor introduzido com o que esta na base de dados
    JEQ aumentaSaldo            ; se for igual salta para a etiqueta de aumentar o saldo
    MOV R4, 16                  ; guarda em R5 o valor 16 para mover para o proximo endereco de mem
    ADD R0, R4                  ; vai para o proximo endereco de mem da base de dados
    CMP R0, R5                  ; compara a ver se ja chegou ao fim da base de dados
    JMP nextCartao              ; se nao chegou volta para a rotina de recarregar

aumentaSaldo:
    ADD R0, 4                   ; aumenta 4 ao endereco de memoria para ir buscar o saldo do cartao
    MOV R1, [R0]                ; guarda o valor que esta no endereco de memoria
    ADD R3, R1                  ; adiciona o valor do total inserido ao saldo do cartao
    MOV [R0], R3                ; atualiza o saldo na base de dados
    SUB R0, 4                   ; subtrai 4 ao endereco de memoria para ir buscar o numero do cartao
    JMP rotinaUsarCartao        ; volta para a rotina de usar cartao


;-------------------------------
;        Rotina Stock
;------------------------------

RotinaStock:
    MOV R0, 0110H               ; endereco do inicio da palavra passe
    MOV R1, 0114H               ; endereco do fim da palavra passe
    MOV R2, MenuStock           ; endereco do menu de stock
    CALL MostraDisplay          ; chama a rotina de mostrar display

passStock:
    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos
passStock2:
    MOVB R2, [R0]               ; guarda o valor introduzido no periferico de entrada
    MOV R3, PER_EN              ; endereco do periferico de entrada OK
    MOVB R4, [R3]               ; guarda o valor introduzido no periferico de entrada

    CMP R4, 0                   ; compara se o valor e 0
    JEQ passStock2              ; se for 0 fica em loop
    CMP R4, R2                  ; compara se o valor introduzido e igual ao valor da palavra passe
    JNE RotinaStock             ; se nao for igual volta para a rotina de stock
    ADD R0, 1                   ; adiciona 1 ao endereco de memoria para ir buscar a opcao
    CMP R0, R1                  ; compara se ja chegou ao fim da palavra passe
    JLE passStock               ; se nao chegou volta para o loop da palavra passe

loopStock:
    MOV R2, OpcoesStock         ; endereco do menu de opcoes de stock
    CALL MostraDisplay          ; chama a rotina de mostrar display
    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos
loopStock2:
    MOV R0, PER_EN              ; endereco do periferico de entrada OK
    MOVB R1, [R0]               ; guarda o valor introduzido no periferico de entrada

    CMP R1, 0                   ; compara se o valor e 0
    JEQ loopStock2              ; se for 0 fica em loop
    CMP R1, 1                   ; compara se o valor e 1
    JEQ reporStock              ; se for 1 salta para a rotina de repor stock
    CMP R1, 2                   ; compara se o valor e 2
    JEQ verStock                ; se for 2 salta para a rotina de ver stock
    CMP R1, Cancelar            ; compara se o valor e 3
    JEQ LigadoIntermedio3       ; se for 3 salta para a rotina de ligado
    CALL RotinaErro             ; se nao for nenhum dos valores validos chama a rotina de erro
    JMP loopStock               ; volta para o loop de stock

LigadoIntermedio3:
    JMP Ligado                  ; volta para a rotina de ligado

;----------------------
; Rotina de repor stock
;----------------------
reporStock:
    MOV R2, EcraRepor           ; endereco do display de repor stock
    CALL MostraDisplay          ; chama a rotina de mostrar display
    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos
    MOV R4, 50H                 ; guarda o valor 50
    MOV R5, 20H                 ; guarda o valor 20
    MOV R6, 10H                 ; guarda o valor 10
loopRepor:
    MOV R0, PER_EN              ; endereco do periferico de entrada Dinheiro
    MOVB R1, [R0]               ; guarda o valor introduzido no periferico de entrada

    CMP R1, 0                   ; compara se o valor e 0
    JEQ loopRepor               ; se for 0 fica em loop

    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos
    MOV R2, PER_EN              ; endereco do periferico de entrada Quantidade
    MOVB R3, [R2]               ; guarda o valor introduzido no periferico de entrada

    CMP R3, 0                   ; compara se o valor e 0
    JEQ loopRepor               ; se for 0 fica em loop

    CMP R1, 5                   ; compara se o valor e 5
    JEQ stockNota5              ; se for 5 salta para a rotina de stock de notas de 5

    CMP R1, 2                   ; compara se o valor e 2
    JEQ stockMoeda2             ; se for 2 salta para a rotina de stock de moedas de 2

    CMP R1, 1                   ; compara se o valor e 1
    JEQ stockMoeda1             ; se for 1 salta para a rotina de stock de moedas de 1

    CMP R1, R4                  ; compara se o valor e 50
    JEQ stockMoeda50            ; se for 50 salta para a rotina de stock de moedas de 50

    CMP R1, R5                  ; compara se o valor e 20
    JEQ stockMoeda20            ; se for 20 salta para a rotina de stock de moedas de 20

    CMP R1, R6                  ; compara se o valor e 10
    JEQ stockMoeda10            ; se for 10 salta para a rotina de stock de moedas de 10

    CALL RotinaErroMoeda        ; se nao for nenhum dos valores validos chama a rotina de erro
    JEQ loopRepor               ; volta para o loop de repor stock

stockNota5:
    MOV R4, QuantidadeNotas5    ; endereco da quantidade de notas de 5
    MOV R5, [R4]                ; guarda o valor que esta no endereco
    ADD R5, R3                  ; adiciona o valor introduzido ao valor que esta no endereco
    MOV [R4], R5                ; move o novo valor para o endereco de memoria
    JMP loopStock               ; salta para o loop de stock

stockMoeda2:
    MOV R4, QuantidadeMoedas2   ; endereco da quantidade de moedas de 2
    MOV R5, [R4]                ; guarda o valor que esta no endereco
    ADD R5, R3                  ; adiciona o valor introduzido ao valor que esta no endereco
    MOV [R4], R5                ; move o novo valor para o endereco de memoria
    JMP loopStock               ; salta para o loop de stock

stockMoeda1:
    MOV R4, QuantidadeMoedas1   ; endereco da quantidade de moedas de 1
    MOV R5, [R4]                ; guarda o valor que esta no endereco
    ADD R5, R3                  ; adiciona o valor introduzido ao valor que esta no endereco
    MOV [R4], R5                ; move o novo valor para o endereco de memoria
    JMP loopStock               ; salta para o loop de stock

stockMoeda50:
    MOV R4, QuantidadeMoedas50  ; endereco da quantidade de moedas de 50
    MOV R5, [R4]                ; guarda o valor que esta no endereco
    ADD R5, R3                  ; adiciona o valor introduzido ao valor que esta no endereco
    MOV [R4], R5                ; move o novo valor para o endereco de memoria
    JMP loopStock               ; salta para o loop de stock

stockMoeda20:
    MOV R4, QuantidadeMoedas20  ; endereco da quantidade de moedas de 20
    MOV R5, [R4]                ; guarda o valor que esta no endereco
    ADD R5, R3                  ; adiciona o valor introduzido ao valor que esta no endereco
    MOV [R4], R5                ; move o novo valor para o endereco de memoria
    JMP loopStock               ; salta para o loop de stock

stockMoeda10:
    MOV R4, QuantidadeMoedas10  ; endereco da quantidade de moedas de 10
    MOV R5, [R4]                ; guarda o valor que esta no endereco
    ADD R5, R3                  ; adiciona o valor introduzido ao valor que esta no endereco
    MOV [R4], R5                ; move o novo valor para o endereco de memoria
    JMP loopStock               ; salta para o loop de stock


;--------------------
; Rotina de ver stock
;--------------------
verStock:
    MOV R2, MenuStock1          ; endereco do menu de stock
    CALL MostraDisplay          ; chama a rotina de mostrar display
    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos

    MOV R2, 00B0H               ; endereco do display onde vai ser inserido o stock
    MOV R0, QuantidadeNotas5    ; endereco da quantidade de notas de 5
    MOV R1, [R0]                ; guarda o valor que esta no endereco
    CALL PEPEeStock             ; chama a rotina de mostrar o stock

    MOV R2, 00D0H               ; endereco do display onde vai ser inserido o stock
    MOV R0, QuantidadeMoedas2   ; endereco da quantidade de moedas de 2
    MOV R1, [R0]                ; guarda o valor que esta no endereco
    CALL PEPEeStock             ; chama a rotina de mostrar o stock
loopVerStock:
    MOV R0, PER_EN              ; endereco do periferico de entrada Seguinte
    MOVB R1, [R0]               ; guarda o valor introduzido no periferico de entrada

    CMP R1, 0                   ; compara se o valor e 0
    JEQ loopVerStock            ; se for 0 fica em loop
    CMP R1, Seguinte            ; compara se o valor e 1
    JEQ verStock2               ; se for 1 salta para a rotina de ver stock 2
    CALL RotinaErro             ; se nao for nenhum dos valores validos chama a rotina de erro
    JMP verStock                ; volta para a rotina de ver stock

verStock2:
    MOV R2, MenuStock2          ; endereco do menu de stock
    CALL MostraDisplay          ; chama a rotina de mostrar display

    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos
    MOV R2, 00B0H               ; endereco do display onde vai ser inserido o stock
    MOV R0, QuantidadeMoedas1   ; endereco da quantidade de moedas de 1
    MOV R1, [R0]                ; guarda o valor que esta no endereco
    CALL PEPEeStock             ; chama a rotina de mostrar o stock

    MOV R2, 00D0H               ; endereco do display onde vai ser inserido o stock
    MOV R0, QuantidadeMoedas50  ; endereco da quantidade de moedas de 50
    MOV R1, [R0]                ; guarda o valor que esta no endereco
    CALL PEPEeStock             ; chama a rotina de mostrar o stock

loopVerStock2:
    MOV R0, PER_EN              ; endereco do periferico de entrada Seguinte
    MOVB R1, [R0]               ; guarda o valor introduzido no periferico de entrada

    CMP R1, 0                   ; compara se o valor e 0
    JEQ loopVerStock2           ; se for 0 fica em loop
    CMP R1, Seguinte            ; compara se o valor e 1
    JEQ verStock3               ; se for 1 salta para a rotina de ver stock 3
    CALL RotinaErro             ; se nao for nenhum dos valores validos chama a rotina de erro
    JMP verStock2               ; volta para a rotina de ver stock 2

verStock3:
    MOV R2, MenuStock3          ; endereco do menu de stock
    CALL MostraDisplay          ; chama a rotina de mostrar display
    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos

    MOV R2, 00B0H               ; endereco do display onde vai ser inserido o stock
    MOV R0, QuantidadeMoedas20  ; endereco da quantidade de moedas de 20
    MOV R1, [R0]                ; guarda o valor que esta no endereco
    CALL PEPEeStock             ; chama a rotina de mostrar o stock

    MOV R2, 00D0H               ; endereco do display onde vai ser inserido o stock
    MOV R0, QuantidadeMoedas10  ; endereco da quantidade de moedas de 10
    MOV R1, [R0]                ; guarda o valor que esta no endereco
    CALL PEPEeStock             ; chama a rotina de mostrar o stock

loopVerStock3:
    MOV R0, PER_EN              ; endereco do periferico de entrada Voltar
    MOVB R1, [R0]               ; guarda o valor introduzido no periferico de entrada

    CMP R1, 0                   ; compara se o valor e 0
    JEQ loopVerStock3           ; se for 0 fica em loop
    CMP R1, 2                   ; compara se o valor e 2
    JEQ loopStockIntermedio     ; se for 2 volta para a rotina de stock intermedio
    CALL RotinaErro             ; se nao for nenhum dos valores validos chama a rotina de erro
    JMP verStock3               ; volta para a rotina de ver stock 3

loopStockIntermedio:
    JMP loopStock               ; volta para a rotina de stock


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

    MOV R0, InicioEcra          ; R0 = InicioEcra
    MOV R1, FimEcra             ; R1 = FimEcra
CicloLimpa:
    MOV R2, CaracterVazio       ; guarda o caracter vazio em R2
    MOVB [R0], R2               ; coloca o valor no R0
    ADD R0, 1                   ; incrementa o endereco de memoria
    CMP R0, R1                  ; compara se ja chegou ao fim do display
    JLE CicloLimpa              ; se nao chegou volta para o ciclo

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

    MOV R0, InicioEcra          ; R0 = InicioEcra
    MOV R1, FimEcra             ; R1 = FimEcra
Ciclo_Display:
    MOV R3, [R2]                ; R3 guarda o valor que esta no endereco
    MOV [R0], R3                ; move o valor para a memoria 
    ADD R0, 2                   ; incrementa o endereco de memoria
    ADD R2, 2                   ; incrementa o endereco de memoria
    CMP R0, R1                  ; compara se ja chegou ao fim do display
    JLE Ciclo_Display           ; se nao chegou volta para o ciclo

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
    
    MOV R0, PER_EN              ; endereco do periferico de entrada
    MOV R1, 0                   ; valor a ser introduzido no periferico de entrada
    MOVB [R0], R1               ; move o valor para o periferico de entrada

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

    MOV R2, EcraErro            ; endereco do display de erro
    CALL MostraDisplay          ; chama a rotina de mostrar display
    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos
CicloErro:
    MOV R0, PER_EN              ; endereco do periferico de entrada OK
    MOVB R1, [R0]               ; guarda o valor introduzido no periferico de entrada
    CMP R1, 1                   ; compara se o valor e 1
    JNE CicloErro               ; se nao for 1 fica em loop

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

    MOV R2, EcraErroMoeda       ; endereco do display de erro
    CALL MostraDisplay          ; chama a rotina de mostrar display
    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos
CicloErroMoeda:
    MOV R0, PER_EN              ; endereco do periferico de entrada OK
    MOVB R1, [R0]               ; guarda o valor introduzido no periferico de entrada
    CMP R1, 1                   ; compara se o valor e 1
    JNE CicloErroMoeda          ; se nao for 1 fica em loop

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

    MOV R2, PepeErro            ; endereco do display de erro
    CALL MostraDisplay          ; chama a rotina de mostrar display
    CALL LimpaPerifericos       ; chama a rotina de limpar perifericos
CicloErroPepe:
    MOV R0, PER_EN              ; endereco do periferico de entrada OK
    MOVB R1, [R0]               ; guarda o valor introduzido no periferico de entrada
    CMP R1, 1                   ; compara se o valor e 1
    JNE CicloErroPepe           ; se nao for 1 fica em loop

    POP R0
    POP R1
    POP R2
    RET

;------------------------------------------
; Rotina de conversao para ASCII no display
;------------------------------------------

converter:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R5
    PUSH R6

    MOV R0, 10              ; R1 = 10 para realizar as operacoes de divisao
    ADD R2, 4               ; fica com o endereco do caracter a ser preenchido
    MOV R3, 0               ; R3 = 0 numero de caracteres ja preenchidos
    MOV R5, 48              ; R5 = 48 para converter para ASCII
proximoCaracter:
    MOV R4, R1              ; faz uma copia de R1 pra R4 (R4 = X)
    MOD R4, R0              ; R4 = D = (resto) R4/R1 = (resto) X/10
    DIV R1, R0              ; R1 = X = R1/R0 = X/10
    ADD R4, R5              ; C = R4 = R4 + R5
    MOVB [R2], R4           ; guarda o C no Display
    ADD R3, 1               ; Atualiza o num de caracteres ja preenchidos
    SUB R2, 1               ; Passa para o proximo espaco do display
    CMP R3, 2               ; verifica se ja preencheu os 2 caracteres
    JEQ saltaCaracter       ; se ja preencheu salta para a etiqueta saltaCaracter   
    CMP R1, 0               ; verifica se o X ja e zero
    JNE proximoCaracter     ; se nao for zero volta para o proximo caracter
    JMP cicloVazios         ; se for zero passa para o ciclo de vazios
saltaCaracter:
    SUB R2, 1               ; decrementa o endereco de memoria
    JMP proximoCaracter     ; volta para o proximo caracter
cicloVazios:
    CMP R3, NumTotalCarater ; verifica se ja preencheu todos os caracteres
    JEQ fimRotina           ; se ja preencheu todos os caracteres salta para o fim da rotina
    MOV R6, 30H             ; R6 = 30H para preencher com zeros
    MOVB [R2], R6           ; preenche com espacos
    ADD R3, 1               ; Atualiza o num de caracteres ja preenchidos
    SUB R2, 1               ; Passa para o proximo espaco do display
    CMP R3, 2               ; verifica se ja preencheu os 2 caracteres
    JEQ saltaVazio          ; se ja preencheu salta para a etiqueta saltaVazio
    JMP cicloVazios         ; se nao preencheu volta para o ciclo de vazios
saltaVazio:
    SUB R2, 1               ; decrementa o endereco de memoria
    JMP cicloVazios         ; volta para o ciclo de vazios

fimRotina:
    POP R6
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET


;------------------------------------------
; Rotina de conversao para ASCII no display
;------------------------------------------

PEPEeStock:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R5
    PUSH R6

    MOV R0, 10              ; R1 = 10 para realizar as operacoes de divisao
    ADD R2, 4               ; fica com o endereco do caracter a ser preenchido
    MOV R3, 0               ; R3 = 0 numero de caracteres ja preenchidos
    MOV R5, 48              ; R5 = 48 para converter para ASCII
proximoCaracterPS:          
    MOV R4, R1              ; faz uma copia de R1 pra R4 (R4 = X)
    MOD R4, R0              ; R4 = D = (resto) R4/R1 = (resto) X/10
    DIV R1, R0              ; R1 = X = R1/R0 = X/10
    ADD R4, R5              ; C = R4 = R4 + R5
    MOVB [R2], R4           ; guarda o C no Display
    ADD R3, 1               ; Atualiza o num de caracteres ja preenchidos
    SUB R2, 1               ; Passa para o proximo espaco do display
    CMP R1, 0               ; verifica se o X ja e zero
    JNE proximoCaracterPS   ; se nao for zero volta para o proximo caracter
cicloVaziosPS:
    CMP R3, NumTotalCarater ; verifica se ja preencheu todos os caracteres
    JEQ fimRotina           ; se ja preencheu todos os caracteres salta para o fim da rotina
    MOV R6, 30H             ; R6 = 30H para preencher com zeros
    MOVB [R2], R6           ; preenche com espacos
    ADD R3, 1               ; Atualiza o num de caracteres ja preenchidos
    SUB R2, 1               ; Passa para o proximo espaco do display
    JMP cicloVaziosPS       ; se nao preencheu volta para o ciclo de vazios

fimRotinaPS:
    POP R6
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET
