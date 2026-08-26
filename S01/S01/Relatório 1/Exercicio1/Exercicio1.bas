Dim peso As Double
Dim agua As Integer
Dim meta As Double = 0.00

'meta diaria recomendada de agua e calculada
'multiplicando o peso do individuo por 35 ml

Print "DIGITE SEU PESO (EM KG): "
Input peso

Print "AGORA, DIGITE A QUANT. DE AGUA (EM ML) INGERIDA HOJE: "
Input agua

meta = 35 * peso

'para não me perder: se bebi mais agua que a meta esperava então[...]'
If agua >= meta Then 
    Print "Meta atingida!"
Else
    Print "Meta nao atingida"
End If

Sleep