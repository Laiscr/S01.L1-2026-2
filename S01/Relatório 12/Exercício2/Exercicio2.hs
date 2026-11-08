pesoMaximo :: Double
pesoMaximo = 5.0
-- pesoMaximo = 8.0  -- erro: Multiple declarations of 'pesoMaximo'

data Encomenda = Encomenda
  { destinatario :: String, 
  peso :: Double, 
  frete :: Double}

descrever :: Encomenda -> String
descrever e =
  destinatario e ++ " - " ++ show (peso e) ++ " kg - frete R$ " ++ show (frete e)

-- Usamos 'filter' para manter apenas as encomendas cujo peso <= pesoMaximo
cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas = filter (\e -> peso e <= pesoMaximo) encomendas

totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas = sum (map frete encomendas)

main :: IO ()
main = do
  let encomendas =
        [ Encomenda { destinatario = "Osono", peso = 2.0, frete = 15.0 }, 
        Encomenda { destinatario = "Madame", peso = 7.5, frete = 40.0 }, 
        Encomenda { destinatario = "Tombo", peso = 4.5, frete = 20.0 }, 
        Encomenda { destinatario = "Ursula", peso = 9.0, frete = 55.0 }]

  putStrLn "--- Todas as encomendas ---"
  mapM_ putStrLn (map descrever encomendas)

  let aceitas = cabemNaVassoura encomendas

  putStrLn "--- Cabem na vassoura ---"
  mapM_ putStrLn (map descrever aceitas)

  putStrLn ("Total de fretes: R$ " ++ show (totalDeFretes aceitas))