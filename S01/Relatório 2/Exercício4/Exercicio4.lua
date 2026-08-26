function calcularMedia(a, b)
    return (a + b) / 2
end

function encontrarMaior(a, b)
    if a > b then
        return a
    else
        return b
    end
end

function calcularDiferencaAbsoluta(a, b)
    if a > b then
        return a - b
    else
        return b - a
    end
end

function analisarNumeros(n1, n2, operacao)
    if operacao == "media" then
        return calcularMedia(n1, n2)
    elseif operacao == "maior" then
        return encontrarMaior(n1, n2)
    elseif operacao == "diferenca" then
        return calcularDiferencaAbsoluta(n1, n2)
    else
        return "Operacao invalida!"
    end
end

print("Digite o primeiro numero:")
local n1 = tonumber(io.read())

print("Digite o segundo numero:")
local n2 = tonumber(io.read())

print("Digite a operacao (media, maior ou diferenca):")
local operacao = io.read()

local resultado = analisarNumeros(n1, n2, operacao)
print("Resultado: " .. resultado)

--https://www.reddit.com/r/lua/comments/1hgurz3/whats_the_difference_between_else_and_elseif/?tl=pt-br
-- aqui não foi utilizado IA. Fiz somente uma pesquisa sobre if-else para não ter que fazer aninhamento.
-- por isso, não achei necessário utilizar o IA_Report pra isso. Só deixei o link de onde tirei a 
-- informação. :P