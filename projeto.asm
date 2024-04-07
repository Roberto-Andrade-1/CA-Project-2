; Constantes
Comprar EQU 1
UsarCartao EQU 2
Stock EQU 3

Continuar EQU 1
Cancelar EQU 5

Recarregar EQU 2

Seguinte EQU 1

Porto EQU 1
Lisboa EQU 2
Faro EQU 3
Braga EQU 4

CustoPorto EQU 150
CustoLisboa EQU 250
CustoFaro EQU 350
CustoBraga EQU 450



; Periférico de entrada
PER_EN EQU 0070H ; Onde o utilizador irá selecionar a sua opção

; Periférico de saida
InicioEcra EQU 0090H
FimEcra EQU 00FFH

; Menus de informação

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
    String "1-Porto: 1.50"
    String "2-Lisboa: 2.50"
    String "3-Faro: 3.50"
    String "4-Braga: 4.50"
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
    String "----- ERRO -----"

Place 06D0H
PasseErro:
    String "----- ERRO -----"
    String "                "
    String "     CODIGO     "
    String "     UNICO      "
    String "     ERRADO     "
    String "                "
    String "----- ERRO -----"