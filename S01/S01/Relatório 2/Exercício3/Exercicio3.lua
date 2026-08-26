function filtrarMaiores(tabela, limite)
    local maiores = {}
    for i = 1, #tabela do
        if tabela[i] > limite then
            table.insert(maiores, tabela[i])
        end
    end
    return maiores
end

print("Digite a quantidade de elementos (N):")
local n = tonumber(io.read())

local numeros = {}
for i = 1, n do
    print("Digite o elemento " .. i .. ":")
    numeros[i] = tonumber(io.read())
end

print("Digite o valor limite (K):")
local k = tonumber(io.read())

local resultado = filtrarMaiores(numeros, k)

print("--- Elementos maiores que " .. k .. " ---")
for i = 1, #resultado do
    print(resultado[i])
end