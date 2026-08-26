function gerarTabelaPotencias(inicio, fim, base)
    local resultado = 0
    for i = inicio, fim do
        resultado = base ^ i
        print(base .. " ^ " .. i .. " = " .. resultado)
    end
end    

print("Digite o expoente inicial (M):")
local inicio = tonumber(io.read())

print("Digite o expoente final (N):")
local fim = tonumber(io.read())

print("Digite a base:")
local base = tonumber(io.read())

gerarTabelaPotencias(inicio, fim, base)

-- o único ponto que pesquisei para fazer este exercício foi sobre 
-- se havia alguma biblioteca para potenciação e a primeira resposta que
-- obtive foi de IA, então, colocarei aqui (e no IA_Report) o link dessa resposta:
-- https://share.google/aimode/whKJQjXmYHommxpT8
-- o restante foi eu mesma...porém não sei como tirar o ".0" das respostas no terminal'-'