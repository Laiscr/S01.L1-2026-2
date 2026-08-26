Dim pin As Integer = 1235

Print "TENTE ACERTAR O PIN: "
Input pin

While pin <> 1235
    Print "PIN invalido. Tente novamente."
    Print "TENTE ACERTAR O PIN: "
    Input pin
Wend

Print "Transacao autorizada!"

Sleep
