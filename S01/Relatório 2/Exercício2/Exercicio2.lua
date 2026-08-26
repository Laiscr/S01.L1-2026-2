function contarOcorrencias(tabela, alvo)
    local contador = 0
    for i = 1, #tabela do
        if tabela[i] == alvo then
            contador = contador + 1
        end
    end
    return contador
end
 
print("Digite a quantidade de elementos (N):")
local n = tonumber(io.read())
 
local numeros = {}
for i = 1, n do
    print("Digite o " .. i .. "o numero:")
    local valor = tonumber(io.read())
    table.insert(numeros, valor)
end
 
print("Digite o numero a ser buscado (X):")
local x = tonumber(io.read())
 
local ocorrencias = contarOcorrencias(numeros, x)
print("O numero " .. x .. " aparece " .. ocorrencias .. " vez(es) na tabela.")